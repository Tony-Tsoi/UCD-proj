module prob6 (
	input [3:0] a,
	input [3:0] b,
	input [3:0] c,
	input [3:0] d,
	input [3:0] e,
	input [3:0] f,
	output reg [5:0] s );
	
	wire [5:0] s1, c01, s2, c02;
	
	csa6 A0 (.a( {{2{a[3]}}, a} ), .b({{2{b[3]}},b}), .c({{2{c[3]}},c}), .d({{2{d[3]}},d}), .cin(1'b0), .s(s1), .c0(c01), .c1());
	csa6 A1 (.a(s1), .b({{2{e[3]}},e}), .c({{2{f[3]}},f}), .d({c01[4:0], 1'b0}), .cin(1'b0), .s(s2), .c0(c02), .c1());
	
	always @(*)
		s = s2 + {c02[4:0], 1'b0};
endmodule