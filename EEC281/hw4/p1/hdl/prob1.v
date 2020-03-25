module prob1 (clk, a_r, a_i, b_r, b_i, w_r, w_i, x_r, x_i);

input clk;
input [15:0] a_i, a_r, b_i, b_r, w_i, w_r;
output [15:0] x_i, x_r;

// Stage 1: Adders
wire [16:0] amb = {b_r[15], b_r} - {b_i[15], b_i}; // A - B
wire [16:0] cmd = {w_r[15], w_r} - {w_i[15], w_i}; // C - D
wire [16:0] cpd = {w_r[15], w_r} + {w_i[15], w_i}; // C + D

// Stage 1 -> 2
reg [15:0] a_r2, a_i2, b_r2, b_i2, w_i2;
reg [16:0] amb_s2, cmd_s2,cpd_s2;
always @(posedge clk) begin
	amb_s2 <= #1 amb;
	cmd_s2 <= #1 cmd;
	cpd_s2 <= #1 cpd;
	a_r2 <= #1 a_r;
	a_i2 <= #1 a_i;
	b_r2 <= #1 b_r;
	b_i2 <= #1 b_i;
	w_i2 <= #1 w_i;
end

// Stage 2: Multipliers
wire [33:0] m1 = {{17{amb_s2[16]}}, amb_s2} * {{18{w_i2[15]}}, w_i2};
wire [33:0] m2 = {{17{cmd_s2[16]}}, cmd_s2} * {{18{b_r2[15]}}, b_r2};
wire [33:0] m3 = {{17{cpd_s2[16]}}, cpd_s2} * {{18{b_i2[15]}}, b_i2};

// Stage 2 -> 3
reg [15:0] a_r3, a_i3;
reg [31:0] m1_3, m2_3, m3_3;
always @(posedge clk) begin
	a_r3 <= #1 a_r2;
	a_i3 <= #1 a_i2;
	m1_3 <= #1 m1[31:0];
	m2_3 <= #1 m2[31:0];
	m3_3 <= #1 m3[31:0];
end

// Stage 3: Add and Output with Rounding
wire [31:0] xr_tmp = {{2{a_r3[15]}}, a_r3, 14'h0000} + m1_3 + m2_3;
wire xr_bias = xr_tmp[15] | {&{xr_tmp[14:12]}};
assign x_r = xr_tmp[31:16] + xr_bias;

wire [31:0] xi_tmp = {{2{a_i3[15]}}, a_i3, 14'h0000} + m1_3 + m3_3;
wire xi_bias = xi_tmp[15] | {&{xi_tmp[14:12]}};
assign x_i = xi_tmp[31:16] + xi_bias;

endmodule