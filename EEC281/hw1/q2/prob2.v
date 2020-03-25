module prob2 (
	input [10:0] flonum, // 3 bit unsigned exponent, 8 bit signed 6.2 mantissa
	output [14:0] fixnum); // 13.2 signed
	
	assign fixnum = flonum[7:0] << flonum[10:8];
endmodule