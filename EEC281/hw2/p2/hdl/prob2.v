module prob2 (clk, inA, inB, ci, out, co);

input clk, ci;
input [15:0] inA, inB;
output [15:0] out;
output co;
reg [15:0] out;
reg co;

// register the inputs
reg [15:0] inA_r, inB_r;
reg ci_r;

always @(posedge clk) begin
	inA_r <= #1 inA;
	inB_r <= #1 inB;
	ci_r <= #1 ci;
end

// Adders
wire co_c;
wire [15:1] ci_tmp;
wire [15:0] out_c;

fa F0 (.a(inA_r[0]), .b(inB_r[0]), .ci(ci_r), .s(out_c[0]), .co(ci_tmp[1]));
fa F1 (.a(inA_r[1]), .b(inB_r[1]), .ci(ci_tmp[1]), .s(out_c[1]), .co(ci_tmp[2]));
fa F2 (.a(inA_r[2]), .b(inB_r[2]), .ci(ci_tmp[2]), .s(out_c[2]), .co(ci_tmp[3]));
fa F3 (.a(inA_r[3]), .b(inB_r[3]), .ci(ci_tmp[3]), .s(out_c[3]), .co(ci_tmp[4]));
fa F4 (.a(inA_r[4]), .b(inB_r[4]), .ci(ci_tmp[4]), .s(out_c[4]), .co(ci_tmp[5]));
fa F5 (.a(inA_r[5]), .b(inB_r[5]), .ci(ci_tmp[5]), .s(out_c[5]), .co(ci_tmp[6]));
fa F6 (.a(inA_r[6]), .b(inB_r[6]), .ci(ci_tmp[6]), .s(out_c[6]), .co(ci_tmp[7]));
fa F7 (.a(inA_r[7]), .b(inB_r[7]), .ci(ci_tmp[7]), .s(out_c[7]), .co(ci_tmp[8]));
fa F8 (.a(inA_r[8]), .b(inB_r[8]), .ci(ci_tmp[8]), .s(out_c[8]), .co(ci_tmp[9]));
fa F9 (.a(inA_r[9]), .b(inB_r[9]), .ci(ci_tmp[9]), .s(out_c[9]), .co(ci_tmp[10]));
fa F10 (.a(inA_r[10]), .b(inB_r[10]), .ci(ci_tmp[10]), .s(out_c[10]), .co(ci_tmp[11]));
fa F11 (.a(inA_r[11]), .b(inB_r[11]), .ci(ci_tmp[11]), .s(out_c[11]), .co(ci_tmp[12]));
fa F12 (.a(inA_r[12]), .b(inB_r[12]), .ci(ci_tmp[12]), .s(out_c[12]), .co(ci_tmp[13]));
fa F13 (.a(inA_r[13]), .b(inB_r[13]), .ci(ci_tmp[13]), .s(out_c[13]), .co(ci_tmp[14]));
fa F14 (.a(inA_r[14]), .b(inB_r[14]), .ci(ci_tmp[14]), .s(out_c[14]), .co(ci_tmp[15]));
fa F15 (.a(inA_r[15]), .b(inB_r[15]), .ci(ci_tmp[15]), .s(out_c[15]), .co(co_c));

// register the outputs
always @(posedge clk) begin
	out <= #1 out_c;
	co <= #1 co_c;
end

endmodule