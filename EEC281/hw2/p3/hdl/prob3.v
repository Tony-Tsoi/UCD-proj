module prob3 (clk, inA, inB, ci, co, out);

input clk, ci;
input [15:0] inA, inB;
output [15:0] out;
output co;

reg [15:0] out;
reg co;

// register all inputs
reg [15:0] inA_r, inB_r;
reg ci_r;

always @(posedge clk) begin
	inA_r <= #1 inA;
	inB_r <= #1 inB;
	ci_r <= #1 ci;
end

// Stage 1
wire [7:0] out_c;
wire [7:1] ci_tmp;
wire ci_s8;

fa F0 (.a(inA_r[0]), .b(inB_r[0]), .ci(ci_r), .co(ci_tmp[1]), .s(out_c[0]));
fa F1 (.a(inA_r[1]), .b(inB_r[1]), .ci(ci_tmp[1]), .co(ci_tmp[2]), .s(out_c[1]));
fa F2 (.a(inA_r[2]), .b(inB_r[2]), .ci(ci_tmp[2]), .co(ci_tmp[3]), .s(out_c[2]));
fa F3 (.a(inA_r[3]), .b(inB_r[3]), .ci(ci_tmp[3]), .co(ci_tmp[4]), .s(out_c[3]));
fa F4 (.a(inA_r[4]), .b(inB_r[4]), .ci(ci_tmp[4]), .co(ci_tmp[5]), .s(out_c[4]));
fa F5 (.a(inA_r[5]), .b(inB_r[5]), .ci(ci_tmp[5]), .co(ci_tmp[6]), .s(out_c[5]));
fa F6 (.a(inA_r[6]), .b(inB_r[6]), .ci(ci_tmp[6]), .co(ci_tmp[7]), .s(out_c[6]));
fa F7 (.a(inA_r[7]), .b(inB_r[7]), .ci(ci_tmp[7]), .co(ci_s8), .s(out_c[7]));

// Stage 2, ci = 0
wire [15:8] out_c0;
wire [15:8] ci_tmp0;
wire co_c0;

fa F8_0 (.a(inA_r[8]), .b(inB_r[8]), .ci(1'b0), .co(ci_tmp0[9]), .s(out_c0[8]));
fa F9_0 (.a(inA_r[9]), .b(inB_r[9]), .ci(ci_tmp0[9]), .co(ci_tmp0[10]), .s(out_c0[9]));
fa F10_0 (.a(inA_r[10]), .b(inB_r[10]), .ci(ci_tmp0[10]), .co(ci_tmp0[11]), .s(out_c0[10]));
fa F11_0 (.a(inA_r[11]), .b(inB_r[11]), .ci(ci_tmp0[11]), .co(ci_tmp0[12]), .s(out_c0[11]));
fa F12_0 (.a(inA_r[12]), .b(inB_r[12]), .ci(ci_tmp0[12]), .co(ci_tmp0[13]), .s(out_c0[12]));
fa F13_0 (.a(inA_r[13]), .b(inB_r[13]), .ci(ci_tmp0[13]), .co(ci_tmp0[14]), .s(out_c0[13]));
fa F14_0 (.a(inA_r[14]), .b(inB_r[14]), .ci(ci_tmp0[14]), .co(ci_tmp0[15]), .s(out_c0[14]));
fa F15_0 (.a(inA_r[15]), .b(inB_r[15]), .ci(ci_tmp0[15]), .co(co_c0), .s(out_c0[15]));

// Stage 2, ci = 1
wire [15:8] out_c1;
wire [15:8] ci_tmp1;
wire co_c1;

fa F8_1 (.a(inA_r[8]), .b(inB_r[8]), .ci(1'b1), .co(ci_tmp1[9]), .s(out_c1[8]));
fa F9_1 (.a(inA_r[9]), .b(inB_r[9]), .ci(ci_tmp1[9]), .co(ci_tmp1[10]), .s(out_c1[9]));
fa F10_1 (.a(inA_r[10]), .b(inB_r[10]), .ci(ci_tmp1[10]), .co(ci_tmp1[11]), .s(out_c1[10]));
fa F11_1 (.a(inA_r[11]), .b(inB_r[11]), .ci(ci_tmp1[11]), .co(ci_tmp1[12]), .s(out_c1[11]));
fa F12_1 (.a(inA_r[12]), .b(inB_r[12]), .ci(ci_tmp1[12]), .co(ci_tmp1[13]), .s(out_c1[12]));
fa F13_1 (.a(inA_r[13]), .b(inB_r[13]), .ci(ci_tmp1[13]), .co(ci_tmp1[14]), .s(out_c1[13]));
fa F14_1 (.a(inA_r[14]), .b(inB_r[14]), .ci(ci_tmp1[14]), .co(ci_tmp1[15]), .s(out_c1[14]));
fa F15_1 (.a(inA_r[15]), .b(inB_r[15]), .ci(ci_tmp1[15]), .co(co_c1), .s(out_c1[15]));

// Select of Stage 2
wire [15:8] out_cs = ci_s8? out_c1 : out_c0;
wire co_c = ci_s8? co_c1 : co_c0;

// register the output
always @(posedge clk) begin
	co <= #1 co_c;
	out <= #1 {out_cs, out_c};
end

endmodule
