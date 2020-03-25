module prob1c (a, b, ci, co, s);

input a, b, ci;
output co, s;

wire [1:0] tmp = a + b + ci;

assign co = tmp[1];
assign s = tmp[0];

endmodule