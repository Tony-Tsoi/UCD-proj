module prob1e ( num1, num2, num3, num4, num5, num6, num7, num8, num9,
	num10, num11, num12, num13, num14, num15, num16, num17, num18, num19, out);

input [5:0] num1, num2, num3, num4, num5, num6, num7, num8, num9, num10, 
	num11, num12, num13, num14, num15, num16, num17, num18, num19;
output [5:0] out;

assign out = num1 + num2 + num3 +num4 + num5 + num6 + num7 + num8 + num9 
	+ num10 + num11 + num12 + num13 + num14 + num15 + num16 + num17 + num18 + num19;

endmodule