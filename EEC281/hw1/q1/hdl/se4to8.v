// from signed 1.3 to 5.3
module se4to8 (
	input [3:0] num_in,
	output [7:0] num_out);
	
	assign num_out = { {4{num_in[3]}}, num_in };	
endmodule