// from a 3.1 unsigned to a 5.3 signed
module u4to8 (
	input [3:0] num_in,
	output [7:0] num_out);
	
	assign num_out = {2'b00, num_in, 2'b00};
endmodule