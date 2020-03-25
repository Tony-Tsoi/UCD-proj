module prob1h (inA, inB, out);

input [15:0] inA, inB;
output [31:0] out;

assign out = inA * inB;

endmodule