module fa(
    input   a,
    input   b,
    input   ci,
    output  s,
    output  co
);
    wire [1:0] sum;
	
	assign sum = a + b + ci;
	assign s = sum[0];
	assign co = sum[1];
endmodule