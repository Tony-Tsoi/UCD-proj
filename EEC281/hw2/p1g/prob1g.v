module prob1g (inA, inB, out);

input [7:0] inA, inB;
output [15:0] out;

assign out = inA * inB;

endmodule