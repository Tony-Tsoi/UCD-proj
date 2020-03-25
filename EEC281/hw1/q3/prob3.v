module prob3 (
	input [8:0] fixnum, // 7.2 signed
	output [8:0] flonum); // 4.1 signed mantissa, 4bit signed exponent
	
	reg [4:0] mant;
	reg [3:0] exp;
	
	assign flonum = {exp, mant};
	
	always @(fixnum) begin
		casez (fixnum)
			9'b01???_????, 9'b10???_????: begin
				exp = 4'h2; mant = fixnum[8:4];
			end
			9'b001??_????, 9'b110??_????: begin
				exp = 4'h1; mant = fixnum[7:3];
			end
			
			9'b0001?_????, 9'b1110?_????: begin
				exp = 4'h0; mant = fixnum[6:2];
			end
			
			9'b00001_????, 9'b11110_????: begin
				exp = 4'hf; mant = fixnum[5:1];
			end
			
			9'b00000_1???, 9'b11111_0???: begin
				exp = 4'he; mant = fixnum[4:0];
			end
			
			9'b00000_01??, 9'b11111_10??: begin
				exp = 4'hd; mant = {fixnum[3:0], 1'b0};
			end
			
			9'b00000_001?, 9'b11111_110?: begin
				exp = 4'hc; mant = {fixnum[2:0], 2'h0};
			end
			
			9'h001, 9'h1fe: begin
				exp = 4'hb; mant = {fixnum[1:0], 3'h0};
			end
			
			9'h000: begin
				exp = 4'h0; mant = 5'h00;
			end
				
			9'h1ff: begin
				exp = 4'h9; mant = 5'h10;
			end
			
			default: begin
				exp = 4'hx; mant = 5'hxx;
			end
		endcase
	end
endmodule