module csa8 (
	input [7:0] num1,
	input [7:0] num2,
	input [7:0] num3,
	output [7:0] sout,
	output [7:0] cout );
	
	fa A0 (.a(num1[0]), .b(num2[0]), .ci(num3[0]), .s(sout[0]), .co(cout[0]));
	fa A1 (.a(num1[1]), .b(num2[1]), .ci(num3[1]), .s(sout[1]), .co(cout[1]));
	fa A2 (.a(num1[2]), .b(num2[2]), .ci(num3[2]), .s(sout[2]), .co(cout[2]));
	fa A3 (.a(num1[3]), .b(num2[3]), .ci(num3[3]), .s(sout[3]), .co(cout[3]));
	fa A4 (.a(num1[4]), .b(num2[4]), .ci(num3[4]), .s(sout[4]), .co(cout[4]));
	fa A5 (.a(num1[5]), .b(num2[5]), .ci(num3[5]), .s(sout[5]), .co(cout[5]));
	fa A6 (.a(num1[6]), .b(num2[6]), .ci(num3[6]), .s(sout[6]), .co(cout[6]));
	fa A7 (.a(num1[7]), .b(num2[7]), .ci(num3[7]), .s(sout[7]), .co(cout[7]));
endmodule