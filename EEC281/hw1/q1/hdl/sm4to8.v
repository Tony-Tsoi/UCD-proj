// from sm 1.2 to signed 5.3
module sm4to8 (
	input [3:0] num_in,
	output reg [7:0] num_out);
	
	reg [3:0] val;
	
	always @(num_in) begin
		val = num_in;
		if (num_in[3] == 1'b1)
			val = ~(num_in) + 1;
		num_out = { {4{num_in[3]}}, val[2:0], 1'b0 };
	end
endmodule