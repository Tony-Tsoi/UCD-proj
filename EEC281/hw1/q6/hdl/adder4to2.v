module adder4to2 (
	input a,
	input b,
	input c,
	input d,
	input e,
	output c0,
	output c1,
	output s);
	
	wire fas;

	fa F1 (.a(a), .b(b), .ci(c), .co(c0), .s(fas));
	fa F2 (.a(fas), .b(d), .ci(e), .co(c1), .s(s));
endmodule