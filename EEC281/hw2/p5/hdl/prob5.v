module prob5 (clk, inA, inB, ci, co, out);

input clk, ci;
input [15:0] inA, inB;
output co;
output [15:0] out;
reg co;
reg [15:0] out;

// Register all inputs
reg [15:0] inA_s1, inB_s1;
reg ci_s1;

always @(posedge clk) begin
	inA_s1 <= #1 inA;
	inB_s1 <= #1 inB;
	ci_s1 <= #1 ci;
end

// Stage 1
wire [2:1] co_s1;
wire [1:0] out_s1;

fa F0 (.a(inA_s1[0]), .b(inB_s1[0]), .ci(ci_s1), .co(co_s1[1]), .s(out_s1[0]));
fa F1 (.a(inA_s1[1]), .b(inB_s1[1]), .ci(co_s1[1]), .co(co_s1[2]), .s(out_s1[1]));

// to stage 2
reg [15:2] inA_s2, inB_s2;
reg ci_s2;
reg [1:0] out_s2;

always @(posedge clk) begin
	inA_s2 <= #1 inA_s1[15:2];
	inB_s2 <= #1 inB_s1[15:2];
	ci_s2 <= #1 co_s1[2];
	out_s2 <= #1 out_s1;
end

// Stage 2
wire [4:3] co_s2;
wire [3:2] out_s2_w;

fa F2 (.a(inA_s2[2]), .b(inB_s2[2]), .ci(ci_s2), .co(co_s2[3]), .s(out_s2_w[2]));
fa F3 (.a(inA_s2[3]), .b(inB_s2[3]), .ci(co_s2[3]), .co(co_s2[4]), .s(out_s2_w[3]));

// to stage 3
reg [15:4] inA_s3, inB_s3;
reg ci_s3;
reg [3:0] out_s3;

always @(posedge clk) begin
	inA_s3 <= #1 inA_s2[15:4];
	inB_s3 <= #1 inB_s2[15:4];
	ci_s3 <= #1 co_s2[4];
	out_s3 <= #1 {out_s2_w, out_s2};
end

// Stage 3
wire [6:5] co_s3;
wire [5:4] out_s3_w;

fa F4 (.a(inA_s3[4]), .b(inB_s3[4]), .ci(ci_s3), .co(co_s3[5]), .s(out_s3_w[4]));
fa F5 (.a(inA_s3[5]), .b(inB_s3[5]), .ci(co_s3[5]), .co(co_s3[6]), .s(out_s3_w[5]));

// to stage 4
reg [15:6] inA_s4, inB_s4;
reg ci_s4;
reg [5:0] out_s4;

always @(posedge clk) begin
	inA_s4 <= #1 inA_s3[15:6];
	inB_s4 <= #1 inB_s3[15:6];
	ci_s4 <= #1 co_s3[6];
	out_s4 <= #1 {out_s3_w, out_s3};
end

// Stage 4
wire [8:7] co_s4;
wire [7:6] out_s4_w;

fa F6 (.a(inA_s4[6]), .b(inB_s4[6]), .ci(ci_s4), .co(co_s4[7]), .s(out_s4_w[6]));
fa F7 (.a(inA_s4[7]), .b(inB_s4[7]), .ci(co_s4[7]), .co(co_s4[8]), .s(out_s4_w[7]));

// to stage 5
reg [15:8] inA_s5, inB_s5;
reg ci_s5;
reg [7:0] out_s5;

always @(posedge clk) begin
	inA_s5 <= #1 inA_s4[15:8];
	inB_s5 <= #1 inB_s4[15:8];
	ci_s5 <= #1 co_s4[8];
	out_s5 <= #1 {out_s4_w, out_s4};
end

// Stage 5
wire [10:9] co_s5;
wire [9:8] out_s5_w;

fa F8 (.a(inA_s5[8]), .b(inB_s5[8]), .ci(ci_s5), .co(co_s5[9]), .s(out_s5_w[8]));
fa F9 (.a(inA_s5[9]), .b(inB_s5[9]), .ci(co_s5[9]), .co(co_s5[10]), .s(out_s5_w[9]));

// to stage 6
reg [15:10] inA_s6, inB_s6;
reg ci_s6;
reg [9:0] out_s6;

always @(posedge clk) begin
	inA_s6 <= #1 inA_s5[15:10];
	inB_s6 <= #1 inB_s5[15:10];
	ci_s6 <= #1 co_s5[10];
	out_s6 <= #1 {out_s5_w, out_s5};
end

// Stage 6
wire [12:11] co_s6;
wire [11:10] out_s6_w;

fa F10 (.a(inA_s6[10]), .b(inB_s6[10]), .ci(ci_s6), .co(co_s6[11]), .s(out_s6_w[10]));
fa F11 (.a(inA_s6[11]), .b(inB_s6[11]), .ci(co_s6[11]), .co(co_s6[12]), .s(out_s6_w[11]));

// to stage 7
reg [15:12] inA_s7, inB_s7;
reg ci_s7;
reg [11:0] out_s7;

always @(posedge clk) begin
	inA_s7 <= #1 inA_s6[15:12];
	inB_s7 <= #1 inB_s6[15:12];
	ci_s7 <= #1 co_s6[12];
	out_s7 <= #1 {out_s6_w, out_s6};
end

// Stage 7
wire [14:13] co_s7;
wire [13:12] out_s7_w;

fa F12 (.a(inA_s7[12]), .b(inB_s7[12]), .ci(ci_s7), .co(co_s7[13]), .s(out_s7_w[12]));
fa F13 (.a(inA_s7[13]), .b(inB_s7[13]), .ci(co_s7[13]), .co(co_s7[14]), .s(out_s7_w[13]));

// to stage 8
reg [15:14] inA_s8, inB_s8;
reg ci_s8;
reg [13:0] out_s8;

always @(posedge clk) begin
	inA_s8 <= #1 inA_s7[15:14];
	inB_s8 <= #1 inB_s7[15:14];
	ci_s8 <= #1 co_s7[14];
	out_s8 <= #1 {out_s7_w, out_s7};
end

// Stage 8
wire co_s8;
wire [15:14] out_s8_w;

fa F14 (.a(inA_s8[14]), .b(inB_s8[14]), .ci(ci_s8), .co(co_s8), .s(out_s8_w[14]));
fa F15 (.a(inA_s8[15]), .b(inB_s8[15]), .ci(co_s8), .co(co_c), .s(out_s8_w[15]));

// to output
always @(posedge clk) begin
	co <= co_c;
	out <= #1 {out_s8_w, out_s8};
end

endmodule