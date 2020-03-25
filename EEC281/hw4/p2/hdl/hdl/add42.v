module add42 (a, b, c, d, e, c0, c1, s);

input a, b, c, d, e;
output c0, c1, s;

wire fas;

fa F1 (.a(a), .b(b), .ci(c), .co(c0), .s(fas));
fa F2 (.a(fas), .b(d), .ci(e), .co(c1), .s(s));

endmodule