module fa(a, b, ci, s, co);

input	a, b, ci;
output	s, co;

assign s = a ^ b ^ ci; // a xor b xor c
assign co = (a&b) | (a&ci) | (b&ci); // ab + aci + bci

endmodule