/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-23 13:01:49
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-04-04 17:23:56
*/
module SR_original_tb;

	parameter H_CLK_PERIOD = 5;
	parameter CLK_PERIOD = H_CLK_PERIOD*2;

	parameter DATAWIDTH = 8;

	reg clock, reset, enable,enable_read;
	reg [DATAWIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7; 
	reg [DATAWIDTH-1:0] integer_pixels [255:0];
	
	wire [DATAWIDTH-1:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15;
	

	SR_original #(DATAWIDTH) SR_original_cell(
		.clock(clock), 
		.reset(reset),
		.enable(enable),
		.enable_read(enable_read),
		.in_0(in_0),
		.in_1(in_1),
		.in_2(in_2),
		.in_3(in_3),
		.in_4(in_4),
		.in_5(in_5),
		.in_6(in_6),
		.in_7(in_7),
		.out_0(out_0),
		.out_1(out_1),
		.out_2(out_2),
		.out_3(out_3),
		.out_4(out_4),
		.out_5(out_5),
		.out_6(out_6),
		.out_7(out_7),
		.out_8(out_8),
		.out_9(out_9),
		.out_10(out_10),
		.out_11(out_11),
		.out_12(out_12),
		.out_13(out_13),
		.out_14(out_14),
		.out_15(out_15)
	);


	initial $readmemh(".././fprintf_referencia/integer_pixels.txt", integer_pixels);

	always 
		#H_CLK_PERIOD clock = !clock;
 

	initial begin
		$dumpfile ("SR_original_tb.vcd");
		$dumpvars;


		clock = 0;
		reset = 0;
		enable = 0;
		enable_read = 0;

		#5;
		reset = 1;

		#CLK_PERIOD;
		reset = 0;
		enable = 1;

		in_0  = integer_pixels [4];
		in_1  = integer_pixels [5];
		in_2  = integer_pixels [6];
		in_3  = integer_pixels [7];
		in_4  = integer_pixels [8];
		in_5  = integer_pixels [9];
		in_6  = integer_pixels [10];
		in_7  = integer_pixels [11];

		#CLK_PERIOD;
		in_0  = integer_pixels [4+16*1];
		in_1  = integer_pixels [5+16*1];
		in_2  = integer_pixels [6+16*1];
		in_3  = integer_pixels [7+16*1];
		in_4  = integer_pixels [8+16*1];
		in_5  = integer_pixels [9+16*1];
		in_6  = integer_pixels [10+16*1];
		in_7  = integer_pixels [11+16*1];


		#CLK_PERIOD;
		in_0  = integer_pixels [4+16*2];
		in_1  = integer_pixels [5+16*2];
		in_2  = integer_pixels [6+16*2];
		in_3  = integer_pixels [7+16*2];
		in_4  = integer_pixels [8+16*2];
		in_5  = integer_pixels [9+16*2];
		in_6  = integer_pixels [10+16*2];
		in_7  = integer_pixels [11+16*2];


		#CLK_PERIOD;
		in_0  = integer_pixels [4+16*3];
		in_1  = integer_pixels [5+16*3];
		in_2  = integer_pixels [6+16*3];
		in_3  = integer_pixels [7+16*3];
		in_4  = integer_pixels [8+16*3];
		in_5  = integer_pixels [9+16*3];
		in_6  = integer_pixels [10+16*3];
		in_7  = integer_pixels [11+16*3];

		#CLK_PERIOD;
		in_0  = integer_pixels [4+16*4];
		in_1  = integer_pixels [5+16*4];
		in_2  = integer_pixels [6+16*4];
		in_3  = integer_pixels [7+16*4];
		in_4  = integer_pixels [8+16*4];
		in_5  = integer_pixels [9+16*4];
		in_6  = integer_pixels [10+16*4];
		in_7  = integer_pixels [11+16*4];

		#CLK_PERIOD;
		in_0  = integer_pixels [4+16*5];
		in_1  = integer_pixels [5+16*5];
		in_2  = integer_pixels [6+16*5];
		in_3  = integer_pixels [7+16*5];
		in_4  = integer_pixels [8+16*5];
		in_5  = integer_pixels [9+16*5];
		in_6  = integer_pixels [10+16*5];
		in_7  = integer_pixels [11+16*5];

		#CLK_PERIOD;
		in_0  = integer_pixels [4+16*6];
		in_1  = integer_pixels [5+16*6];
		in_2  = integer_pixels [6+16*6];
		in_3  = integer_pixels [7+16*6];
		in_4  = integer_pixels [8+16*6];
		in_5  = integer_pixels [9+16*6];
		in_6  = integer_pixels [10+16*6];
		in_7  = integer_pixels [11+16*6];

		#CLK_PERIOD;
		in_0  = integer_pixels [4+16*7];
		in_1  = integer_pixels [5+16*7];
		in_2  = integer_pixels [6+16*7];
		in_3  = integer_pixels [7+16*7];
		in_4  = integer_pixels [8+16*7];
		in_5  = integer_pixels [9+16*7];
		in_6  = integer_pixels [10+16*7];
		in_7  = integer_pixels [11+16*7];


		#CLK_PERIOD;
		enable_read = 1; 

		#500;
		reset = 1;
		enable = 0;

		#30;

		$finish;
		
	end

endmodule