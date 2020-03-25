module prob2 (clk, start, reset, im_addr, im_data, fi_addr, fi_data, wr_addr, wr_data, wr_en);

// Inputs and Outputs Declaration
input clk, start, reset;
output [4:0] im_addr; // read image
input [551:0] im_data;
output [3:0] fi_addr; // read filter
input [263:0] fi_data;
output [3:0] wr_addr; // write output (to ROM or stream out)
output [71:0] wr_data; // 23 bits per pixel color
output wr_en; // output data is valid

reg [4:0] im_addr;
reg [3:0] fi_addr;

// Clocked input of ROM data, delay by 1 cycle
reg [551:0] im_data_d;
reg [263:0] fi_data_d;

// Counter regs
reg [1:0] state, state_c;
reg [3:0] counti, counti_c; // 11x11 inside counter, counts from 0 to 10
reg [4:0] countj, countj_c; // [z, y, x] z: to determine done state
reg [4:0] countj_d, countj_d2;

// Logic for addresses
wire [4:0] im_addr_c = {1'b0, counti} + {1'b0, countj[3:2], 2'b00};
wire [3:0] fi_addr_c = counti;

// Multiply-Adder for Image and Filter Data
wire [263:0] im_data_in = 
	(countj_d2[1:0] == 2'b00) ? im_data_d[551:288] :
	(countj_d2[1:0] == 2'b01) ? im_data_d[455:192] :
	(countj_d2[1:0] == 2'b10) ? im_data_d[359:96] : im_data_d[263:0];
wire [71:0] ou_data;
multadd MA (.im_data(im_data_in), .fi_data(fi_data_d), .ou_data(ou_data));

// States
parameter IDLE = 2'b00;
parameter CALC = 2'b01;
parameter DONE = 2'b11;

// Output accumulator
reg [23:0] acc_r, acc_rc, acc_g, acc_gc, acc_b, acc_bc;

// Output ready signal
assign wr_en = (counti == 5'd02);

// Output data
assign wr_data = {acc_r, acc_g, acc_b};

// Output address
assign wr_addr = countj[3:0] - 4'd01;

// State Machine
always @(state or state_c or counti or counti_c or countj or countj_c or acc_b or acc_bc or 
	acc_g or acc_gc or acc_r or acc_rc or ou_data) begin
	state_c = state;
	counti_c = counti;
	countj_c = countj;
	acc_rc = acc_r;
	acc_gc = acc_g;
	acc_bc = acc_b;
	
	case (state)
		IDLE: begin
			counti_c = 4'd00;
			countj_c = 4'd00;
			if (start == 1'b1)
				state_c = CALC;
		end
		CALC: begin
			counti_c = counti + 4'd01;
			if (counti == 4'd10) begin
				counti_c = 4'd00;
				countj_c = countj + 4'd01;
			end
			
			acc_rc = acc_r + ou_data[71:48];
			acc_gc = acc_g + ou_data[47:24];
			acc_bc = acc_b + ou_data[23:0];
			
			// reset accumulator
			if (counti == 4'd02) begin
				acc_rc = ou_data[71:48];
				acc_gc = ou_data[47:24];
				acc_bc = ou_data[23:0];
			end
			
			if ((counti == 4'd02) && (countj[4] == 1'b1))
				state_c = DONE;		
		end
	endcase
end

// Output
always @(posedge clk) begin
	state <= #1 state_c;
	im_addr <= #1 im_addr_c;
	fi_addr <= #1 fi_addr_c;
	counti <= #1 counti_c;
	countj <= #1 countj_c;
	acc_b <= #1 acc_bc;
	acc_g <= #1 acc_gc;
	acc_r <= #1 acc_rc;
	
	im_data_d <= #1 im_data;
	fi_data_d <= #1 fi_data;
	
	countj_d <= #1 countj;
	countj_d2 <= #1 countj_d;

	if (reset == 1'b1)
		state <= #1 IDLE;
end

endmodule