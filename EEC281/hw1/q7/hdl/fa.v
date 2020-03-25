module fa(
    input   a,
    input   b,
    input   ci,
    output  s,
    output  co
);
    assign s = a ^ b ^ ci; 					// a xor b xor c
    assign co = (a&b) | (a&ci) | (b&ci);	// ab + aci + bci
endmodule