module prob1 (
	input [3:0] a, // in 2's 1.3 format
	input [3:0] b, // in unsigned 3.1 format
	input [3:0] c, // in sign&mag M1.2 format
	output [7:0] sum);

	wire [7:0] num1, num2, num3, out1, out2;
	
	se4to8 SE (.num_in(a), .num_out(num1));
	u4to8 U (.num_in(b), .num_out(num2));
	sm4to8 SM (.num_in(c), .num_out(num3));

	csa8 CSAV (.num1(num1), .num2(num2), .num3(num3), .sout(out1), .cout(out2));
	cpa8 CPRP (.num1(out1), .num2({out2[6:0], 1'b0}), .cin(1'b0), .out(sum), .cout());
endmodule