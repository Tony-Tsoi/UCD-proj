module prob4 (clk, inA, inB, ci, co, out);

input clk, ci;
input [15:0] inA, inB;
output co;
output [15:0] out;
reg co;
reg [15:0] out;

// Register all inputs
reg [15:0] inA_r, inB_r;
reg ci_r;

always @(posedge clk) begin
	inA_r <= #1 inA;
	inB_r <= #1 inB;
	ci_r <= #1 ci;
end

// Stage 1: 4 FAs
wire [3:0] out_c;
wire [3:1] ci_tmp;
wire ci_s1;

fa F0 (.a(inA_r[0]), .b(inB_r[0]), .ci(ci_r), .co(ci_tmp[1]), .s(out_c[0]));
fa F1 (.a(inA_r[1]), .b(inB_r[1]), .ci(ci_tmp[1]), .co(ci_tmp[2]), .s(out_c[1]));
fa F2 (.a(inA_r[2]), .b(inB_r[2]), .ci(ci_tmp[2]), .co(ci_tmp[3]), .s(out_c[2]));
fa F3 (.a(inA_r[3]), .b(inB_r[3]), .ci(ci_tmp[3]), .co(ci_s1), .s(out_c[3]));

// Stage 2: 5 FAs, ci_s1 = 0
wire [8:4] out_c20;
wire [8:5] ci_tmp20;
wire ci_s20;

fa F4_0 (.a(inA_r[4]), .b(inB_r[4]), .ci(1'b0), .co(ci_tmp20[5]), .s(out_c20[4]));
fa F5_0 (.a(inA_r[5]), .b(inB_r[5]), .ci(ci_tmp20[5]), .co(ci_tmp20[6]), .s(out_c20[5]));
fa F6_0 (.a(inA_r[6]), .b(inB_r[6]), .ci(ci_tmp20[6]), .co(ci_tmp20[7]), .s(out_c20[6]));
fa F7_0 (.a(inA_r[7]), .b(inB_r[7]), .ci(ci_tmp20[7]), .co(ci_tmp20[8]), .s(out_c20[7]));
fa F8_0 (.a(inA_r[8]), .b(inB_r[8]), .ci(ci_tmp20[8]), .co(ci_s20), .s(out_c20[8]));

// Stage 2: 5 FAs, ci_s1 = 1
wire [8:4] out_c21;
wire [8:5] ci_tmp21;
wire ci_s21;

fa F4_1 (.a(inA_r[4]), .b(inB_r[4]), .ci(1'b1), .co(ci_tmp21[5]), .s(out_c21[4]));
fa F5_1 (.a(inA_r[5]), .b(inB_r[5]), .ci(ci_tmp21[5]), .co(ci_tmp21[6]), .s(out_c21[5]));
fa F6_1 (.a(inA_r[6]), .b(inB_r[6]), .ci(ci_tmp21[6]), .co(ci_tmp21[7]), .s(out_c21[6]));
fa F7_1 (.a(inA_r[7]), .b(inB_r[7]), .ci(ci_tmp21[7]), .co(ci_tmp21[8]), .s(out_c21[7]));
fa F8_1 (.a(inA_r[8]), .b(inB_r[8]), .ci(ci_tmp21[8]), .co(ci_s21), .s(out_c21[8]));

// Stage 2 MUX
wire [8:4] out_c2 = ci_s1 ? out_c21 : out_c20;
wire ci_s2 = ci_s1 ? ci_s21 : ci_s20;

// Stage 3: 7 FAs, ci_s2 = 0
wire [15:9] out_c30;
wire [15:10] ci_tmp30;
wire ci_s30;

fa F9_0 (.a(inA_r[9]), .b(inB_r[9]), .ci(1'b0), .co(ci_tmp30[10]), .s(out_c30[9]));
fa F10_0 (.a(inA_r[10]), .b(inB_r[10]), .ci(ci_tmp30[10]), .co(ci_tmp30[11]), .s(out_c30[10]));
fa F11_0 (.a(inA_r[11]), .b(inB_r[11]), .ci(ci_tmp30[11]), .co(ci_tmp30[12]), .s(out_c30[11]));
fa F12_0 (.a(inA_r[12]), .b(inB_r[12]), .ci(ci_tmp30[12]), .co(ci_tmp30[13]), .s(out_c30[12]));
fa F13_0 (.a(inA_r[13]), .b(inB_r[13]), .ci(ci_tmp30[13]), .co(ci_tmp30[14]), .s(out_c30[13]));
fa F14_0 (.a(inA_r[14]), .b(inB_r[14]), .ci(ci_tmp30[14]), .co(ci_tmp30[15]), .s(out_c30[14]));
fa F15_0 (.a(inA_r[15]), .b(inB_r[15]), .ci(ci_tmp30[15]), .co(ci_s30), .s(out_c30[15]));

// Stage 3: 7 FAs, ci_s2 = 1
wire [15:9] out_c31;
wire [15:10] ci_tmp31;
wire ci_s31;

fa F9_1 (.a(inA_r[9]), .b(inB_r[9]), .ci(1'b1), .co(ci_tmp31[10]), .s(out_c31[9]));
fa F10_1 (.a(inA_r[10]), .b(inB_r[10]), .ci(ci_tmp31[10]), .co(ci_tmp31[11]), .s(out_c31[10]));
fa F11_1 (.a(inA_r[11]), .b(inB_r[11]), .ci(ci_tmp31[11]), .co(ci_tmp31[12]), .s(out_c31[11]));
fa F12_1 (.a(inA_r[12]), .b(inB_r[12]), .ci(ci_tmp31[12]), .co(ci_tmp31[13]), .s(out_c31[12]));
fa F13_1 (.a(inA_r[13]), .b(inB_r[13]), .ci(ci_tmp31[13]), .co(ci_tmp31[14]), .s(out_c31[13]));
fa F14_1 (.a(inA_r[14]), .b(inB_r[14]), .ci(ci_tmp31[14]), .co(ci_tmp31[15]), .s(out_c31[14]));
fa F15_1 (.a(inA_r[15]), .b(inB_r[15]), .ci(ci_tmp31[15]), .co(ci_s31), .s(out_c31[15]));

// Stage 3 MUX
wire [15:9] out_c3 = ci_s2 ? out_c31 : out_c30;
wire co_c = ci_s2 ? ci_s31 : ci_s30;

// Register the output
always @(posedge clk) begin
	co <= #1 co_c;
	out <= #1 {out_c3, out_c2, out_c};
end

endmodule