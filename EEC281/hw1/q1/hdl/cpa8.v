module cpa8 (
	input [7:0] num1,
	input [7:0] num2,
	input cin,
	output [7:0] out,
	output cout );
	
	wire ci1, ci2, ci3, ci4, ci5, ci6, ci7;
	
	fa A0 (.a(num1[0]), .b(num2[0]), .ci(cin), .s(out[0]), .co(ci1));
	fa A1 (.a(num1[1]), .b(num2[1]), .ci(ci1), .s(out[1]), .co(ci2));
	fa A2 (.a(num1[2]), .b(num2[2]), .ci(ci2), .s(out[2]), .co(ci3));
	fa A3 (.a(num1[3]), .b(num2[3]), .ci(ci3), .s(out[3]), .co(ci4));
	fa A4 (.a(num1[4]), .b(num2[4]), .ci(ci4), .s(out[4]), .co(ci5));
	fa A5 (.a(num1[5]), .b(num2[5]), .ci(ci5), .s(out[5]), .co(ci6));
	fa A6 (.a(num1[6]), .b(num2[6]), .ci(ci6), .s(out[6]), .co(ci7));
	fa A7 (.a(num1[7]), .b(num2[7]), .ci(ci7), .s(out[7]), .co(cout));
endmodule