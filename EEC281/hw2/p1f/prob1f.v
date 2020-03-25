module prob1f (bstr, out);

input [18:0] bstr;
output [5:0] out;

wire [4:0] num1s;
wire [8:0] c0;
wire [3:0] s0;
wire [3:0] c1;
wire [1:0] s1;
wire [1:0] c2;

assign out = {num1s, 1'b0} - 6'd19; // using carry propogate adder

adder4to2 A00 (.a(bstr[0]), .b(bstr[1]), .c(bstr[2]), .d(bstr[3]), .e(bstr[4]), .c0(c0[0]), .c1(c0[1]), .s(s0[0]));
adder4to2 A01 (.a(bstr[5]), .b(bstr[6]), .c(bstr[7]), .d(bstr[8]), .e(bstr[9]), .c0(c0[2]), .c1(c0[3]), .s(s0[1]));
adder4to2 A02 (.a(bstr[10]), .b(bstr[11]), .c(bstr[12]), .d(bstr[13]), .e(bstr[14]), .c0(c0[4]), .c1(c0[5]), .s(s0[2]));
fa A03 (.a(bstr[15]), .b(bstr[16]), .ci(bstr[17]), .co(c0[6]), .s(s0[3]));
adder4to2 A04 (.a(bstr[18]), .b(s0[0]), .c(s0[1]), .d(s0[2]), .e(s0[3]), .c0(c0[7]), .c1(c0[8]), .s(num1s[0]));

adder4to2 A10 (.a(c0[0]), .b(c0[1]), .c(c0[2]), .d(c0[3]), .e(c0[4]), .c0(c1[0]), .c1(c1[1]), .s(s1[0]));
fa A11 (.a(c0[5]), .b(c0[6]), .ci(c0[7]), .co(c1[2]), .s(s1[1]));
fa A12 (.a(s1[0]), .b(s1[1]), .ci(c0[8]), .co(c1[3]), .s(num1s[1]));

adder4to2 A20 (.a(c1[0]), .b(c1[1]), .c(c1[2]), .d(c1[3]), .e(1'b0), .c0(c2[0]), .c1(c2[1]), .s(num1s[2]));

fa A30 (.a(c2[0]), .b(c2[1]), .ci(1'b0), .co(num1s[4]), .s(num1s[3]));

endmodule