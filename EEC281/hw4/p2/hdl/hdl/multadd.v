module multadd(im_data, fi_data, ou_data);

input [263:0] im_data, fi_data;
output [71:0] ou_data;

// Declare each pixel from image
wire [7:0] im_r_0 = im_data[263:256];
wire [7:0] im_g_0 = im_data[255:248];
wire [7:0] im_b_0 = im_data[247:240];

wire [7:0] im_r_1 = im_data[239:232];
wire [7:0] im_g_1 = im_data[231:224];
wire [7:0] im_b_1 = im_data[223:216];

wire [7:0] im_r_2 = im_data[215:208];
wire [7:0] im_g_2 = im_data[207:200];
wire [7:0] im_b_2 = im_data[199:192];

wire [7:0] im_r_3 = im_data[191:184];
wire [7:0] im_g_3 = im_data[183:176];
wire [7:0] im_b_3 = im_data[175:168];

wire [7:0] im_r_4 = im_data[167:160];
wire [7:0] im_g_4 = im_data[159:152];
wire [7:0] im_b_4 = im_data[151:144];

wire [7:0] im_r_5 = im_data[143:136];
wire [7:0] im_g_5 = im_data[135:128];
wire [7:0] im_b_5 = im_data[127:120];

wire [7:0] im_r_6 = im_data[119:112];
wire [7:0] im_g_6 = im_data[111:104];
wire [7:0] im_b_6 = im_data[103:96];

wire [7:0] im_r_7 = im_data[95:88];
wire [7:0] im_g_7 = im_data[87:80];
wire [7:0] im_b_7 = im_data[79:72];

wire [7:0] im_r_8 = im_data[71:64];
wire [7:0] im_g_8 = im_data[63:56];
wire [7:0] im_b_8 = im_data[55:48];

wire [7:0] im_r_9 = im_data[47:40];
wire [7:0] im_g_9 = im_data[39:32];
wire [7:0] im_b_9 = im_data[31:24];

wire [7:0] im_r_10 = im_data[23:16];
wire [7:0] im_g_10 = im_data[15:8];
wire [7:0] im_b_10 = im_data[7:0];

// Declare each pixel from filter
wire [7:0] fi_r_0 = fi_data[263:256];
wire [7:0] fi_g_0 = fi_data[255:248];
wire [7:0] fi_b_0 = fi_data[247:240];

wire [7:0] fi_r_1 = fi_data[239:232];
wire [7:0] fi_g_1 = fi_data[231:224];
wire [7:0] fi_b_1 = fi_data[223:216];

wire [7:0] fi_r_2 = fi_data[215:208];
wire [7:0] fi_g_2 = fi_data[207:200];
wire [7:0] fi_b_2 = fi_data[199:192];

wire [7:0] fi_r_3 = fi_data[191:184];
wire [7:0] fi_g_3 = fi_data[183:176];
wire [7:0] fi_b_3 = fi_data[175:168];

wire [7:0] fi_r_4 = fi_data[167:160];
wire [7:0] fi_g_4 = fi_data[159:152];
wire [7:0] fi_b_4 = fi_data[151:144];

wire [7:0] fi_r_5 = fi_data[143:136];
wire [7:0] fi_g_5 = fi_data[135:128];
wire [7:0] fi_b_5 = fi_data[127:120];

wire [7:0] fi_r_6 = fi_data[119:112];
wire [7:0] fi_g_6 = fi_data[111:104];
wire [7:0] fi_b_6 = fi_data[103:96];

wire [7:0] fi_r_7 = fi_data[95:88];
wire [7:0] fi_g_7 = fi_data[87:80];
wire [7:0] fi_b_7 = fi_data[79:72];

wire [7:0] fi_r_8 = fi_data[71:64];
wire [7:0] fi_g_8 = fi_data[63:56];
wire [7:0] fi_b_8 = fi_data[55:48];

wire [7:0] fi_r_9 = fi_data[47:40];
wire [7:0] fi_g_9 = fi_data[39:32];
wire [7:0] fi_b_9 = fi_data[31:24];

wire [7:0] fi_r_10 = fi_data[23:16];
wire [7:0] fi_g_10 = fi_data[15:8];
wire [7:0] fi_b_10 = fi_data[7:0];

// Multiply
wire [15:0] ou_r_0 = {8'h00, im_r_0} * {8'h00, fi_r_0};
wire [15:0] ou_g_0 = {8'h00, im_g_0} * {8'h00, fi_g_0};
wire [15:0] ou_b_0 = {8'h00, im_b_0} * {8'h00, fi_b_0};

wire [15:0] ou_r_1 = {8'h00, im_r_1} * {8'h00, fi_r_1};
wire [15:0] ou_g_1 = {8'h00, im_g_1} * {8'h00, fi_g_1};
wire [15:0] ou_b_1 = {8'h00, im_b_1} * {8'h00, fi_b_1};

wire [15:0] ou_r_2 = {8'h00, im_r_2} * {8'h00, fi_r_2};
wire [15:0] ou_g_2 = {8'h00, im_g_2} * {8'h00, fi_g_2};
wire [15:0] ou_b_2 = {8'h00, im_b_2} * {8'h00, fi_b_2};

wire [15:0] ou_r_3 = {8'h00, im_r_3} * {8'h00, fi_r_3};
wire [15:0] ou_g_3 = {8'h00, im_g_3} * {8'h00, fi_g_3};
wire [15:0] ou_b_3 = {8'h00, im_b_3} * {8'h00, fi_b_3};

wire [15:0] ou_r_4 = {8'h00, im_r_4} * {8'h00, fi_r_4};
wire [15:0] ou_g_4 = {8'h00, im_g_4} * {8'h00, fi_g_4};
wire [15:0] ou_b_4 = {8'h00, im_b_4} * {8'h00, fi_b_4};

wire [15:0] ou_r_5 = {8'h00, im_r_5} * {8'h00, fi_r_5};
wire [15:0] ou_g_5 = {8'h00, im_g_5} * {8'h00, fi_g_5};
wire [15:0] ou_b_5 = {8'h00, im_b_5} * {8'h00, fi_b_5};

wire [15:0] ou_r_6 = {8'h00, im_r_6} * {8'h00, fi_r_6};
wire [15:0] ou_g_6 = {8'h00, im_g_6} * {8'h00, fi_g_6};
wire [15:0] ou_b_6 = {8'h00, im_b_6} * {8'h00, fi_b_6};

wire [15:0] ou_r_7 = {8'h00, im_r_7} * {8'h00, fi_r_7};
wire [15:0] ou_g_7 = {8'h00, im_g_7} * {8'h00, fi_g_7};
wire [15:0] ou_b_7 = {8'h00, im_b_7} * {8'h00, fi_b_7};

wire [15:0] ou_r_8 = {8'h00, im_r_8} * {8'h00, fi_r_8};
wire [15:0] ou_g_8 = {8'h00, im_g_8} * {8'h00, fi_g_8};
wire [15:0] ou_b_8 = {8'h00, im_b_8} * {8'h00, fi_b_8};

wire [15:0] ou_r_9 = {8'h00, im_r_9} * {8'h00, fi_r_9};
wire [15:0] ou_g_9 = {8'h00, im_g_9} * {8'h00, fi_g_9};
wire [15:0] ou_b_9 = {8'h00, im_b_9} * {8'h00, fi_b_9};

wire [15:0] ou_r_10 = {8'h00, im_r_10} * {8'h00, fi_r_10};
wire [15:0] ou_g_10 = {8'h00, im_g_10} * {8'h00, fi_g_10};
wire [15:0] ou_b_10 = {8'h00, im_b_10} * {8'h00, fi_b_10};

// Adder
wire [23:0] out_r, out_g, out_b;
adder11 AR (.in0(ou_r_0), .in1(ou_r_1), .in2(ou_r_2), .in3(ou_r_3), .in4(ou_r_4), .in5(ou_r_5), .in6(ou_r_6),
	.in7(ou_r_7), .in8(ou_r_8), .in9(ou_r_9), .in10(ou_r_10), .out(out_r));
adder11 AG (.in0(ou_g_0), .in1(ou_g_1), .in2(ou_g_2), .in3(ou_g_3), .in4(ou_g_4), .in5(ou_g_5), .in6(ou_g_6),
	.in7(ou_g_7), .in8(ou_g_8), .in9(ou_g_9), .in10(ou_g_10), .out(out_g));
adder11 AB (.in0(ou_b_0), .in1(ou_b_1), .in2(ou_b_2), .in3(ou_b_3), .in4(ou_b_4), .in5(ou_b_5), .in6(ou_b_6),
	.in7(ou_b_7), .in8(ou_b_8), .in9(ou_b_9), .in10(ou_b_10), .out(out_b));

// Set Output
assign ou_data = {out_r, out_g, out_b};

endmodule