module adder11(in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, out);

input [15:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10;
output [23:0] out;

wire [1:0] s_1r0;
wire [3:0] co_1r0;
add42 ar0_0 (.a(in0[0]), .b(in1[0]), .c(in2[0]), .d(in3[0]), .e(in4[0]), 
	.c0(co_1r0[0]), .c1(co_1r0[1]), .s(s_1r0[0]));
add42 ar0_1 (.a(in5[0]), .b(in6[0]), .c(in7[0]), .d(in8[0]), .e(in9[0]), 
	.c0(co_1r0[2]), .c1(co_1r0[3]), .s(s_1r0[1]));

wire [1:0] s_1r1;
wire [3:0] co_1r1;
add42 ar1_0 (.a(in0[1]), .b(in1[1]), .c(in2[1]), .d(in3[1]), .e(in4[1]), 
	.c0(co_1r1[0]), .c1(co_1r1[1]), .s(s_1r1[0]));
add42 ar1_1 (.a(in5[1]), .b(in6[1]), .c(in7[1]), .d(in8[1]), .e(in9[1]), 
	.c0(co_1r1[2]), .c1(co_1r1[3]), .s(s_1r1[1]));
	
wire [1:0] s_1r2;
wire [3:0] co_1r2;
add42 ar2_0 (.a(in0[2]), .b(in1[2]), .c(in2[2]), .d(in3[2]), .e(in4[2]), 
	.c0(co_1r2[0]), .c1(co_1r2[1]), .s(s_1r2[0]));
add42 ar2_1 (.a(in5[2]), .b(in6[2]), .c(in7[2]), .d(in8[2]), .e(in9[2]), 
	.c0(co_1r2[2]), .c1(co_1r2[3]), .s(s_1r2[1]));

wire [1:0] s_1r3;
wire [3:0] co_1r3;
add42 ar3_0 (.a(in0[3]), .b(in1[3]), .c(in2[3]), .d(in3[3]), .e(in4[3]), 
	.c0(co_1r3[0]), .c1(co_1r3[1]), .s(s_1r3[0]));
add42 ar3_1 (.a(in5[3]), .b(in6[3]), .c(in7[3]), .d(in8[3]), .e(in9[3]), 
	.c0(co_1r3[2]), .c1(co_1r3[3]), .s(s_1r3[1]));
	
wire [1:0] s_1r4;
wire [3:0] co_1r4;
add42 ar4_0 (.a(in0[4]), .b(in1[4]), .c(in2[4]), .d(in3[4]), .e(in4[4]), 
	.c0(co_1r4[0]), .c1(co_1r4[1]), .s(s_1r4[0]));
add42 ar4_1 (.a(in5[4]), .b(in6[4]), .c(in7[4]), .d(in8[4]), .e(in9[4]), 
	.c0(co_1r4[2]), .c1(co_1r4[3]), .s(s_1r4[1]));

wire [1:0] s_1r5;
wire [3:0] co_1r5;
add42 ar5_0 (.a(in0[5]), .b(in1[5]), .c(in2[5]), .d(in3[5]), .e(in4[5]), 
	.c0(co_1r5[0]), .c1(co_1r5[1]), .s(s_1r5[0]));
add42 ar5_1 (.a(in5[5]), .b(in6[5]), .c(in7[5]), .d(in8[5]), .e(in9[5]), 
	.c0(co_1r5[2]), .c1(co_1r5[3]), .s(s_1r5[1]));
	
wire [1:0] s_1r6;
wire [3:0] co_1r6;
add42 ar6_0 (.a(in0[6]), .b(in1[6]), .c(in2[6]), .d(in3[6]), .e(in4[6]), 
	.c0(co_1r6[0]), .c1(co_1r6[1]), .s(s_1r6[0]));
add42 ar6_1 (.a(in5[6]), .b(in6[6]), .c(in7[6]), .d(in8[6]), .e(in9[6]), 
	.c0(co_1r6[2]), .c1(co_1r6[3]), .s(s_1r6[1]));

wire [1:0] s_1r7;
wire [3:0] co_1r7;
add42 ar7_0 (.a(in0[7]), .b(in1[7]), .c(in2[7]), .d(in3[7]), .e(in4[7]), 
	.c0(co_1r7[0]), .c1(co_1r7[1]), .s(s_1r7[0]));
add42 ar7_1 (.a(in5[7]), .b(in6[7]), .c(in7[7]), .d(in8[7]), .e(in9[7]), 
	.c0(co_1r7[2]), .c1(co_1r7[3]), .s(s_1r7[1]));

wire [1:0] s_1r8;
wire [3:0] co_1r8;
add42 ar8_0 (.a(in0[8]), .b(in1[8]), .c(in2[8]), .d(in3[8]), .e(in4[8]), 
	.c0(co_1r8[0]), .c1(co_1r8[1]), .s(s_1r8[0]));
add42 ar8_1 (.a(in5[8]), .b(in6[8]), .c(in7[8]), .d(in8[8]), .e(in9[8]), 
	.c0(co_1r8[2]), .c1(co_1r8[3]), .s(s_1r8[1]));

wire [1:0] s_1r9;
wire [3:0] co_1r9;
add42 ar9_0 (.a(in0[9]), .b(in1[9]), .c(in2[9]), .d(in3[9]), .e(in4[9]), 
	.c0(co_1r9[0]), .c1(co_1r9[1]), .s(s_1r9[0]));
add42 ar9_1 (.a(in5[9]), .b(in6[9]), .c(in7[9]), .d(in8[9]), .e(in9[9]), 
	.c0(co_1r9[2]), .c1(co_1r9[3]), .s(s_1r9[1]));

wire [1:0] s_1r10;
wire [3:0] co_1r10;
add42 ar10_0 (.a(in0[10]), .b(in1[10]), .c(in2[10]), .d(in3[10]), .e(in4[10]), 
	.c0(co_1r10[0]), .c1(co_1r10[1]), .s(s_1r10[0]));
add42 ar10_1 (.a(in5[10]), .b(in6[10]), .c(in7[10]), .d(in8[10]), .e(in9[10]), 
	.c0(co_1r10[2]), .c1(co_1r10[3]), .s(s_1r10[1]));

wire [1:0] s_1r11;
wire [3:0] co_1r11;
add42 ar11_0 (.a(in0[11]), .b(in1[11]), .c(in2[11]), .d(in3[11]), .e(in4[11]), 
	.c0(co_1r11[0]), .c1(co_1r11[1]), .s(s_1r11[0]));
add42 ar11_1 (.a(in5[11]), .b(in6[11]), .c(in7[11]), .d(in8[11]), .e(in9[11]), 
	.c0(co_1r11[2]), .c1(co_1r11[3]), .s(s_1r11[1]));

wire [1:0] s_1r12;
wire [3:0] co_1r12;
add42 ar12_0 (.a(in0[12]), .b(in1[12]), .c(in2[12]), .d(in3[12]), .e(in4[12]), 
	.c0(co_1r12[0]), .c1(co_1r12[1]), .s(s_1r12[0]));
add42 ar12_1 (.a(in5[12]), .b(in6[12]), .c(in7[12]), .d(in8[12]), .e(in9[12]), 
	.c0(co_1r12[2]), .c1(co_1r12[3]), .s(s_1r12[1]));

wire [1:0] s_1r13;
wire [3:0] co_1r13;
add42 ar13_0 (.a(in0[13]), .b(in1[13]), .c(in2[13]), .d(in3[13]), .e(in4[13]), 
	.c0(co_1r13[0]), .c1(co_1r13[1]), .s(s_1r13[0]));
add42 ar13_1 (.a(in5[13]), .b(in6[13]), .c(in7[13]), .d(in8[13]), .e(in9[13]), 
	.c0(co_1r13[2]), .c1(co_1r13[3]), .s(s_1r13[1]));

wire [1:0] s_1r14;
wire [3:0] co_1r14;
add42 ar14_0 (.a(in0[14]), .b(in1[14]), .c(in2[14]), .d(in3[14]), .e(in4[14]), 
	.c0(co_1r14[0]), .c1(co_1r14[1]), .s(s_1r14[0]));
add42 ar14_1 (.a(in5[14]), .b(in6[14]), .c(in7[14]), .d(in8[14]), .e(in9[14]), 
	.c0(co_1r14[2]), .c1(co_1r14[3]), .s(s_1r14[1]));

wire [1:0] s_1r15;
wire [3:0] co_1r15;
add42 ar15_0 (.a(in0[15]), .b(in1[15]), .c(in2[15]), .d(in3[15]), .e(in4[15]), 
	.c0(co_1r15[0]), .c1(co_1r15[1]), .s(s_1r15[0]));
add42 ar15_1 (.a(in5[15]), .b(in6[15]), .c(in7[15]), .d(in8[15]), .e(in9[15]), 
	.c0(co_1r15[2]), .c1(co_1r15[3]), .s(s_1r15[1]));

// Carry Save R Stage 2
wire s_2r0;
wire co_2r0;
fa ar0_2 (.a(s_1r0[0]), .b(s_1r0[1]), .ci(in10[0]), .s(s_2r0), .co(co_2r0));

wire s_2r1;
wire [1:0] co_2r1;
add42 ar1_2 (.a(co_1r0[0]), .b(co_1r0[1]), .c(co_1r0[2]), .d(co_1r0[3]), .e(in10[1]),
	.c0(co_2r1[0]), .c1(co_2r1[1]), .s(s_2r1));

wire s_2r2;
wire [1:0] co_2r2;
add42 ar2_2 (.a(co_1r1[0]), .b(co_1r1[1]), .c(co_1r1[2]), .d(co_1r1[3]), .e(in10[2]),
	.c0(co_2r2[0]), .c1(co_2r2[1]), .s(s_2r2));

wire s_2r3;
wire [1:0] co_2r3;
add42 ar3_2 (.a(co_1r2[0]), .b(co_1r2[1]), .c(co_1r2[2]), .d(co_1r2[3]), .e(in10[3]),
	.c0(co_2r3[0]), .c1(co_2r3[1]), .s(s_2r3));

wire s_2r4;
wire [1:0] co_2r4;
add42 ar4_2 (.a(co_1r3[0]), .b(co_1r3[1]), .c(co_1r3[2]), .d(co_1r3[3]), .e(in10[4]),
	.c0(co_2r4[0]), .c1(co_2r4[1]), .s(s_2r4));

wire s_2r5;
wire [1:0] co_2r5;
add42 ar5_2 (.a(co_1r4[0]), .b(co_1r4[1]), .c(co_1r4[2]), .d(co_1r4[3]), .e(in10[5]),
	.c0(co_2r5[0]), .c1(co_2r5[1]), .s(s_2r5));

wire s_2r6;
wire [1:0] co_2r6;
add42 ar6_2 (.a(co_1r5[0]), .b(co_1r5[1]), .c(co_1r5[2]), .d(co_1r5[3]), .e(in10[6]),
	.c0(co_2r6[0]), .c1(co_2r6[1]), .s(s_2r6));

wire s_2r7;
wire [1:0] co_2r7;
add42 ar7_2 (.a(co_1r6[0]), .b(co_1r6[1]), .c(co_1r6[2]), .d(co_1r6[3]), .e(in10[7]),
	.c0(co_2r7[0]), .c1(co_2r7[1]), .s(s_2r7));

wire s_2r8;
wire [1:0] co_2r8;
add42 ar8_2 (.a(co_1r7[0]), .b(co_1r7[1]), .c(co_1r7[2]), .d(co_1r7[3]), .e(in10[8]),
	.c0(co_2r8[0]), .c1(co_2r8[1]), .s(s_2r8));

wire s_2r9;
wire [1:0] co_2r9;
add42 ar9_2 (.a(co_1r8[0]), .b(co_1r8[1]), .c(co_1r8[2]), .d(co_1r8[3]), .e(in10[9]),
	.c0(co_2r9[0]), .c1(co_2r9[1]), .s(s_2r9));

wire s_2r10;
wire [1:0] co_2r10;
add42 ar10_2 (.a(co_1r9[0]), .b(co_1r9[1]), .c(co_1r9[2]), .d(co_1r9[3]), .e(in10[10]),
	.c0(co_2r10[0]), .c1(co_2r10[1]), .s(s_2r10));

wire s_2r11;
wire [1:0] co_2r11;
add42 ar11_2 (.a(co_1r10[0]), .b(co_1r10[1]), .c(co_1r10[2]), .d(co_1r10[3]), .e(in10[11]),
	.c0(co_2r11[0]), .c1(co_2r11[1]), .s(s_2r11));

wire s_2r12;
wire [1:0] co_2r12;
add42 ar12_2 (.a(co_1r11[0]), .b(co_1r11[1]), .c(co_1r11[2]), .d(co_1r11[3]), .e(in10[12]),
	.c0(co_2r12[0]), .c1(co_2r12[1]), .s(s_2r12));

wire s_2r13;
wire [1:0] co_2r13;
add42 ar13_2 (.a(co_1r12[0]), .b(co_1r12[1]), .c(co_1r12[2]), .d(co_1r12[3]), .e(in10[13]),
	.c0(co_2r13[0]), .c1(co_2r13[1]), .s(s_2r13));

wire s_2r14;
wire [1:0] co_2r14;
add42 ar14_2 (.a(co_1r13[0]), .b(co_1r13[1]), .c(co_1r13[2]), .d(co_1r13[3]), .e(in10[14]),
	.c0(co_2r14[0]), .c1(co_2r14[1]), .s(s_2r14));

wire s_2r15;
wire [1:0] co_2r15;
add42 ar15_2 (.a(co_1r14[0]), .b(co_1r14[1]), .c(co_1r14[2]), .d(co_1r14[3]), .e(in10[15]),
	.c0(co_2r15[0]), .c1(co_2r15[1]), .s(s_2r15));

wire s_2r16;
wire [1:0] co_2r16;
add42 ar16_2 (.a(co_1r15[0]), .b(co_1r15[1]), .c(co_1r15[2]), .d(co_1r15[3]), .e(1'b0),
	.c0(co_2r16[0]), .c1(co_2r16[1]), .s(s_2r16));

// Carry Save R Stage 3
wire s_3r1;
wire [1:0] co_3r1;
add42 ar1_3 (.a(s_1r1[0]), .b(s_1r1[1]), .c(co_2r0), .d(s_2r1), .e(1'b0),
	.c0(co_3r1[0]), .c1(co_3r1[1]), .s(s_3r1));

wire s_3r2;
wire [1:0] co_3r2;
add42 ar2_3 (.a(s_1r2[0]), .b(s_1r2[1]), .c(co_2r1[0]), .d(co_2r1[1]), .e(s_2r2),
	.c0(co_3r2[0]), .c1(co_3r2[1]), .s(s_3r2));

wire s_3r3;
wire [1:0] co_3r3;
add42 ar3_3 (.a(s_1r3[0]), .b(s_1r3[1]), .c(co_2r2[0]), .d(co_2r2[1]), .e(s_2r3),
	.c0(co_3r3[0]), .c1(co_3r3[1]), .s(s_3r3));

wire s_3r4;
wire [1:0] co_3r4;
add42 ar4_3 (.a(s_1r4[0]), .b(s_1r4[1]), .c(co_2r3[0]), .d(co_2r3[1]), .e(s_2r4),
	.c0(co_3r4[0]), .c1(co_3r4[1]), .s(s_3r4));

wire s_3r5;
wire [1:0] co_3r5;
add42 ar5_3 (.a(s_1r5[0]), .b(s_1r5[1]), .c(co_2r4[0]), .d(co_2r4[1]), .e(s_2r5),
	.c0(co_3r5[0]), .c1(co_3r5[1]), .s(s_3r5));

wire s_3r6;
wire [1:0] co_3r6;
add42 ar6_3 (.a(s_1r6[0]), .b(s_1r6[1]), .c(co_2r5[0]), .d(co_2r5[1]), .e(s_2r6),
	.c0(co_3r6[0]), .c1(co_3r6[1]), .s(s_3r6));

wire s_3r7;
wire [1:0] co_3r7;
add42 ar7_3 (.a(s_1r7[0]), .b(s_1r7[1]), .c(co_2r6[0]), .d(co_2r6[1]), .e(s_2r7),
	.c0(co_3r7[0]), .c1(co_3r7[1]), .s(s_3r7));

wire s_3r8;
wire [1:0] co_3r8;
add42 ar8_3 (.a(s_1r8[0]), .b(s_1r8[1]), .c(co_2r7[0]), .d(co_2r7[1]), .e(s_2r8),
	.c0(co_3r8[0]), .c1(co_3r8[1]), .s(s_3r8));

wire s_3r9;
wire [1:0] co_3r9;
add42 ar9_3 (.a(s_1r9[0]), .b(s_1r9[1]), .c(co_2r8[0]), .d(co_2r8[1]), .e(s_2r9),
	.c0(co_3r9[0]), .c1(co_3r9[1]), .s(s_3r9));

wire s_3r10;
wire [1:0] co_3r10;
add42 ar10_3 (.a(s_1r10[0]), .b(s_1r10[1]), .c(co_2r9[0]), .d(co_2r9[1]), .e(s_2r10),
	.c0(co_3r10[0]), .c1(co_3r10[1]), .s(s_3r10));

wire s_3r11;
wire [1:0] co_3r11;
add42 ar11_3 (.a(s_1r11[0]), .b(s_1r11[1]), .c(co_2r10[0]), .d(co_2r10[1]), .e(s_2r11),
	.c0(co_3r11[0]), .c1(co_3r11[1]), .s(s_3r11));

wire s_3r12;
wire [1:0] co_3r12;
add42 ar12_3 (.a(s_1r12[0]), .b(s_1r12[1]), .c(co_2r11[0]), .d(co_2r11[1]), .e(s_2r12),
	.c0(co_3r12[0]), .c1(co_3r12[1]), .s(s_3r12));

wire s_3r13;
wire [1:0] co_3r13;
add42 ar13_3 (.a(s_1r13[0]), .b(s_1r13[1]), .c(co_2r12[0]), .d(co_2r12[1]), .e(s_2r13),
	.c0(co_3r13[0]), .c1(co_3r13[1]), .s(s_3r13));

wire s_3r14;
wire [1:0] co_3r14;
add42 ar14_3 (.a(s_1r14[0]), .b(s_1r14[1]), .c(co_2r13[0]), .d(co_2r13[1]), .e(s_2r14),
	.c0(co_3r14[0]), .c1(co_3r14[1]), .s(s_3r14));

wire s_3r15;
wire [1:0] co_3r15;
add42 ar15_3 (.a(s_1r15[0]), .b(s_1r15[1]), .c(co_2r14[0]), .d(co_2r14[1]), .e(s_2r15),
	.c0(co_3r15[0]), .c1(co_3r15[1]), .s(s_3r15));

wire s_3r16;
wire [1:0] co_3r16;
add42 ar16_3 (.a(co_3r15[0]), .b(co_3r15[1]), .c(co_2r15[0]), .d(co_2r15[1]), .e(s_2r16),
	.c0(co_3r16[0]), .c1(co_3r16[1]), .s(s_3r16));

wire s_3r17;
wire [1:0] co_3r17;
add42 ar17_3 (.a(co_2r16[0]), .b(co_2r16[1]), .c(co_3r16[0]), .d(co_3r16[1]), .e(1'b0),
	.c0(co_3r17[0]), .c1(co_3r17[1]), .s(s_3r17));

// Carry Save R Stage 4
wire [15:2] sum_r1;
wire [16:3] sum_r2;

fa ar2_4 (.a(co_3r1[0]), .b(co_3r1[1]), .ci(s_3r2), .co(sum_r2[3]), .s(sum_r1[2]));
fa ar3_4 (.a(co_3r2[0]), .b(co_3r2[1]), .ci(s_3r3), .co(sum_r2[4]), .s(sum_r1[3]));
fa ar4_4 (.a(co_3r3[0]), .b(co_3r3[1]), .ci(s_3r4), .co(sum_r2[5]), .s(sum_r1[4]));
fa ar5_4 (.a(co_3r4[0]), .b(co_3r4[1]), .ci(s_3r5), .co(sum_r2[6]), .s(sum_r1[5]));
fa ar6_4 (.a(co_3r5[0]), .b(co_3r5[1]), .ci(s_3r6), .co(sum_r2[7]), .s(sum_r1[6]));
fa ar7_4 (.a(co_3r6[0]), .b(co_3r6[1]), .ci(s_3r7), .co(sum_r2[8]), .s(sum_r1[7]));
fa ar8_4 (.a(co_3r7[0]), .b(co_3r7[1]), .ci(s_3r8), .co(sum_r2[9]), .s(sum_r1[8]));
fa ar9_4 (.a(co_3r8[0]), .b(co_3r8[1]), .ci(s_3r9), .co(sum_r2[10]), .s(sum_r1[9]));
fa ar10_4 (.a(co_3r9[0]), .b(co_3r9[1]), .ci(s_3r10), .co(sum_r2[11]), .s(sum_r1[10]));
fa ar11_4 (.a(co_3r10[0]), .b(co_3r10[1]), .ci(s_3r11), .co(sum_r2[12]), .s(sum_r1[11]));
fa ar12_4 (.a(co_3r11[0]), .b(co_3r11[1]), .ci(s_3r12), .co(sum_r2[13]), .s(sum_r1[12]));
fa ar13_4 (.a(co_3r12[0]), .b(co_3r12[1]), .ci(s_3r13), .co(sum_r2[14]), .s(sum_r1[13]));
fa ar14_4 (.a(co_3r13[0]), .b(co_3r13[1]), .ci(s_3r14), .co(sum_r2[15]), .s(sum_r1[14]));
fa ar15_4 (.a(co_3r14[0]), .b(co_3r14[1]), .ci(s_3r15), .co(sum_r2[16]), .s(sum_r1[15]));

// Carry Propagate R
wire [19:0] out_r = {2'b00, co_3r17[0],s_3r17, s_3r16, sum_r1, s_3r1, s_2r0} + 
	{2'b00, co_3r17[1], 1'b0, sum_r2, 3'b000};
assign out = {4'h0, out_r};

endmodule