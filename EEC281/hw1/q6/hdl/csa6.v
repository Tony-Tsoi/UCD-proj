module csa6 (
	input [5:0] a,
	input [5:0] b,
	input [5:0] c,
	input [5:0] d,
	input cin,
	output [5:0] s,
	output [5:0] c0,
	output c1);
	
	wire [4:0] cpr;
	
	adder4to2 A0 (.a(a[0]), .b(b[0]), .c(c[0]), .d(d[0]), .e(cin), .s(s[0]), .c0(c0[0]), .c1(cpr[0]));
	adder4to2 A1 (.a(a[1]), .b(b[1]), .c(c[1]), .d(d[1]), .e(cpr[0]), .s(s[1]), .c0(c0[1]), .c1(cpr[1]));
	adder4to2 A2 (.a(a[2]), .b(b[2]), .c(c[2]), .d(d[2]), .e(cpr[1]), .s(s[2]), .c0(c0[2]), .c1(cpr[2]));
	adder4to2 A3 (.a(a[3]), .b(b[3]), .c(c[3]), .d(d[3]), .e(cpr[2]), .s(s[3]), .c0(c0[3]), .c1(cpr[3]));
	adder4to2 A4 (.a(a[4]), .b(b[4]), .c(c[4]), .d(d[4]), .e(cpr[3]), .s(s[4]), .c0(c0[4]), .c1(cpr[4]));
	adder4to2 A6 (.a(a[5]), .b(b[5]), .c(c[5]), .d(d[5]), .e(cpr[4]), .s(s[5]), .c0(c0[5]), .c1(c1));
endmodule