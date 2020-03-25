module prob1a (inA, inB, out);

input [9:0] inA;
input [9:0] inB;
output [9:0] out;

assign out = inA & inB;

endmodule