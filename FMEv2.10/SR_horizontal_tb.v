/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-23 13:05:48
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-03-23 13:59:47
*/
module SR_horizontal_tb;

	parameter H_CLK_PERIOD = 5;
	parameter CLK_PERIOD = H_CLK_PERIOD*2;

	parameter DATAWIDTH = 8;

	reg clock, reset, enable, enable_read;
	reg signed [DATAWIDTH+1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15, in_16,in_17,in_18,in_19,in_20,in_21,in_22,in_23,in_24,in_25,in_26;
	reg [DATAWIDTH+1:0] integer_pixels [255:0];
	
	wire signed [DATAWIDTH+1:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15;
	

	SR_horizontal #(DATAWIDTH) SR_horizontal_cell(
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
		.in_8(in_8),
		.in_9(in_9),
		.in_10(in_10),
		.in_11(in_11),
		.in_12(in_12),
		.in_13(in_13),
		.in_14(in_14),
		.in_15(in_15),
		.in_16(in_16),
		.in_17(in_17),
		.in_18(in_18),
		.in_19(in_19),
		.in_20(in_20),
		.in_21(in_21),
		.in_22(in_22),
		.in_23(in_23),
		.in_24(in_24),
		.in_25(in_25),
		.in_26(in_26),
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
		$dumpfile ("SR_horizontal_tb.vcd");
		$dumpvars;

		clock = 0;
		reset = 0;
		enable = 0;
		enable_read = 0;

		#3;
		reset = 1;

		#CLK_PERIOD;
		reset = 0;
		enable = 1;

		in_0 =  integer_pixels [0+16*0];
		in_1 =  integer_pixels [1+16*0];
		in_2 =  integer_pixels [2+16*0];
		in_3 =  integer_pixels [3+16*0];
		in_4 =  integer_pixels [4+16*0];
		in_5 =  integer_pixels [5+16*0];
		in_6 =  integer_pixels [6+16*0];
		in_7 =  integer_pixels [7+16*0];
		in_8 =  integer_pixels [8+16*0];
		in_9 =  integer_pixels [9+16*0];
		in_10 = integer_pixels [10+16*0];
		in_11 = integer_pixels [11+16*0];
		in_12 = integer_pixels [12+16*0];
		in_13 = integer_pixels [13+16*0];
		in_14 = integer_pixels [14+16*0];
		in_15 = integer_pixels [15+16*0];
		in_16 = integer_pixels [16+16*0];
		in_17 = integer_pixels [17+16*0];
		in_18 = integer_pixels [18+16*0];
		in_19 = integer_pixels [19+16*0];
		in_20 = integer_pixels [20+16*0];
		in_21 = integer_pixels [21+16*0];
		in_22 = integer_pixels [22+16*0];
		in_23 = integer_pixels [23+16*0];
		in_24 = integer_pixels [24+16*0];
		in_25 = integer_pixels [25+16*0];
		in_26 = integer_pixels [26+16*0];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*1];
		in_1 =  integer_pixels [1+16*1];
		in_2 =  integer_pixels [2+16*1];
		in_3 =  integer_pixels [3+16*1];
		in_4 =  integer_pixels [4+16*1];
		in_5 =  integer_pixels [5+16*1];
		in_6 =  integer_pixels [6+16*1];
		in_7 =  integer_pixels [7+16*1];
		in_8 =  integer_pixels [8+16*1];
		in_9 =  integer_pixels [9+16*1];
		in_10 = integer_pixels [10+16*1];
		in_11 = integer_pixels [11+16*1];
		in_12 = integer_pixels [12+16*1];
		in_13 = integer_pixels [13+16*1];
		in_14 = integer_pixels [14+16*1];
		in_15 = integer_pixels [15+16*1];
		in_16 = integer_pixels [16+16*1];
		in_17 = integer_pixels [17+16*1];
		in_18 = integer_pixels [18+16*1];
		in_19 = integer_pixels [19+16*1];
		in_20 = integer_pixels [20+16*1];
		in_21 = integer_pixels [21+16*1];
		in_22 = integer_pixels [22+16*1];
		in_23 = integer_pixels [23+16*1];
		in_24 = integer_pixels [24+16*1];
		in_25 = integer_pixels [25+16*1];
		in_26 = integer_pixels [26+16*1];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*2];
		in_1 =  integer_pixels [1+16*2];
		in_2 =  integer_pixels [2+16*2];
		in_3 =  integer_pixels [3+16*2];
		in_4 =  integer_pixels [4+16*2];
		in_5 =  integer_pixels [5+16*2];
		in_6 =  integer_pixels [6+16*2];
		in_7 =  integer_pixels [7+16*2];
		in_8 =  integer_pixels [8+16*2];
		in_9 =  integer_pixels [9+16*2];
		in_10 = integer_pixels [10+16*2];
		in_11 = integer_pixels [11+16*2];
		in_12 = integer_pixels [12+16*2];
		in_13 = integer_pixels [13+16*2];
		in_14 = integer_pixels [14+16*2];
		in_15 = integer_pixels [15+16*2];
		in_16 = integer_pixels [16+16*2];
		in_17 = integer_pixels [17+16*2];
		in_18 = integer_pixels [18+16*2];
		in_19 = integer_pixels [19+16*2];
		in_20 = integer_pixels [20+16*2];
		in_21 = integer_pixels [21+16*2];
		in_22 = integer_pixels [22+16*2];
		in_23 = integer_pixels [23+16*2];
		in_24 = integer_pixels [24+16*2];
		in_25 = integer_pixels [25+16*2];
		in_26 = integer_pixels [26+16*2];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*3];
		in_1 =  integer_pixels [1+16*3];
		in_2 =  integer_pixels [2+16*3];
		in_3 =  integer_pixels [3+16*3];
		in_4 =  integer_pixels [4+16*3];
		in_5 =  integer_pixels [5+16*3];
		in_6 =  integer_pixels [6+16*3];
		in_7 =  integer_pixels [7+16*3];
		in_8 =  integer_pixels [8+16*3];
		in_9 =  integer_pixels [9+16*3];
		in_10 = integer_pixels [10+16*3];
		in_11 = integer_pixels [11+16*3];
		in_12 = integer_pixels [12+16*3];
		in_13 = integer_pixels [13+16*3];
		in_14 = integer_pixels [14+16*3];
		in_15 = integer_pixels [15+16*3];
		in_16 = integer_pixels [16+16*3];
		in_17 = integer_pixels [17+16*3];
		in_18 = integer_pixels [18+16*3];
		in_19 = integer_pixels [19+16*3];
		in_20 = integer_pixels [20+16*3];
		in_21 = integer_pixels [21+16*3];
		in_22 = integer_pixels [22+16*3];
		in_23 = integer_pixels [23+16*3];
		in_24 = integer_pixels [24+16*3];
		in_25 = integer_pixels [25+16*3];
		in_26 = integer_pixels [26+16*3];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*4];
		in_1 =  integer_pixels [1+16*4];
		in_2 =  integer_pixels [2+16*4];
		in_3 =  integer_pixels [3+16*4];
		in_4 =  integer_pixels [4+16*4];
		in_5 =  integer_pixels [5+16*4];
		in_6 =  integer_pixels [6+16*4];
		in_7 =  integer_pixels [7+16*4];
		in_8 =  integer_pixels [8+16*4];
		in_9 =  integer_pixels [9+16*4];
		in_10 = integer_pixels [10+16*4];
		in_11 = integer_pixels [11+16*4];
		in_12 = integer_pixels [12+16*4];
		in_13 = integer_pixels [13+16*4];
		in_14 = integer_pixels [14+16*4];
		in_15 = integer_pixels [15+16*4];
		in_16 = integer_pixels [16+16*4];
		in_17 = integer_pixels [17+16*4];
		in_18 = integer_pixels [18+16*4];
		in_19 = integer_pixels [19+16*4];
		in_20 = integer_pixels [20+16*4];
		in_21 = integer_pixels [21+16*4];
		in_22 = integer_pixels [22+16*4];
		in_23 = integer_pixels [23+16*4];
		in_24 = integer_pixels [24+16*4];
		in_25 = integer_pixels [25+16*4];
		in_26 = integer_pixels [26+16*4];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*5];
		in_1 =  integer_pixels [1+16*5];
		in_2 =  integer_pixels [2+16*5];
		in_3 =  integer_pixels [3+16*5];
		in_4 =  integer_pixels [4+16*5];
		in_5 =  integer_pixels [5+16*5];
		in_6 =  integer_pixels [6+16*5];
		in_7 =  integer_pixels [7+16*5];
		in_8 =  integer_pixels [8+16*5];
		in_9 =  integer_pixels [9+16*5];
		in_10 = integer_pixels [10+16*5];
		in_11 = integer_pixels [11+16*5];
		in_12 = integer_pixels [12+16*5];
		in_13 = integer_pixels [13+16*5];
		in_14 = integer_pixels [14+16*5];
		in_15 = integer_pixels [15+16*5];
		in_16 = integer_pixels [16+16*5];
		in_17 = integer_pixels [17+16*5];
		in_18 = integer_pixels [18+16*5];
		in_19 = integer_pixels [19+16*5];
		in_20 = integer_pixels [20+16*5];
		in_21 = integer_pixels [21+16*5];
		in_22 = integer_pixels [22+16*5];
		in_23 = integer_pixels [23+16*5];
		in_24 = integer_pixels [24+16*5];
		in_25 = integer_pixels [25+16*5];
		in_26 = integer_pixels [26+16*5];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*6];
		in_1 =  integer_pixels [1+16*6];
		in_2 =  integer_pixels [2+16*6];
		in_3 =  integer_pixels [3+16*6];
		in_4 =  integer_pixels [4+16*6];
		in_5 =  integer_pixels [5+16*6];
		in_6 =  integer_pixels [6+16*6];
		in_7 =  integer_pixels [7+16*6];
		in_8 =  integer_pixels [8+16*6];
		in_9 =  integer_pixels [9+16*6];
		in_10 = integer_pixels [10+16*6];
		in_11 = integer_pixels [11+16*6];
		in_12 = integer_pixels [12+16*6];
		in_13 = integer_pixels [13+16*6];
		in_14 = integer_pixels [14+16*6];
		in_15 = integer_pixels [15+16*6];
		in_16 = integer_pixels [16+16*6];
		in_17 = integer_pixels [17+16*6];
		in_18 = integer_pixels [18+16*6];
		in_19 = integer_pixels [19+16*6];
		in_20 = integer_pixels [20+16*6];
		in_21 = integer_pixels [21+16*6];
		in_22 = integer_pixels [22+16*6];
		in_23 = integer_pixels [23+16*6];
		in_24 = integer_pixels [24+16*6];
		in_25 = integer_pixels [25+16*6];
		in_26 = integer_pixels [26+16*6];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*7];
		in_1 =  integer_pixels [1+16*7];
		in_2 =  integer_pixels [2+16*7];
		in_3 =  integer_pixels [3+16*7];
		in_4 =  integer_pixels [4+16*7];
		in_5 =  integer_pixels [5+16*7];
		in_6 =  integer_pixels [6+16*7];
		in_7 =  integer_pixels [7+16*7];
		in_8 =  integer_pixels [8+16*7];
		in_9 =  integer_pixels [9+16*7];
		in_10 = integer_pixels [10+16*7];
		in_11 = integer_pixels [11+16*7];
		in_12 = integer_pixels [12+16*7];
		in_13 = integer_pixels [13+16*7];
		in_14 = integer_pixels [14+16*7];
		in_15 = integer_pixels [15+16*7];
		in_16 = integer_pixels [16+16*7];
		in_17 = integer_pixels [17+16*7];
		in_18 = integer_pixels [18+16*7];
		in_19 = integer_pixels [19+16*7];
		in_20 = integer_pixels [20+16*7];
		in_21 = integer_pixels [21+16*7];
		in_22 = integer_pixels [22+16*7];
		in_23 = integer_pixels [23+16*7];
		in_24 = integer_pixels [24+16*7];
		in_25 = integer_pixels [25+16*7];
		in_26 = integer_pixels [26+16*7];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*8];
		in_1 =  integer_pixels [1+16*8];
		in_2 =  integer_pixels [2+16*8];
		in_3 =  integer_pixels [3+16*8];
		in_4 =  integer_pixels [4+16*8];
		in_5 =  integer_pixels [5+16*8];
		in_6 =  integer_pixels [6+16*8];
		in_7 =  integer_pixels [7+16*8];
		in_8 =  integer_pixels [8+16*8];
		in_9 =  integer_pixels [9+16*8];
		in_10 = integer_pixels [10+16*8];
		in_11 = integer_pixels [11+16*8];
		in_12 = integer_pixels [12+16*8];
		in_13 = integer_pixels [13+16*8];
		in_14 = integer_pixels [14+16*8];
		in_15 = integer_pixels [15+16*8];
		in_16 = integer_pixels [16+16*8];
		in_17 = integer_pixels [17+16*8];
		in_18 = integer_pixels [18+16*8];
		in_19 = integer_pixels [19+16*8];
		in_20 = integer_pixels [20+16*8];
		in_21 = integer_pixels [21+16*8];
		in_22 = integer_pixels [22+16*8];
		in_23 = integer_pixels [23+16*8];
		in_24 = integer_pixels [24+16*8];
		in_25 = integer_pixels [25+16*8];
		in_26 = integer_pixels [26+16*8];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*9];
		in_1 =  integer_pixels [1+16*9];
		in_2 =  integer_pixels [2+16*9];
		in_3 =  integer_pixels [3+16*9];
		in_4 =  integer_pixels [4+16*9];
		in_5 =  integer_pixels [5+16*9];
		in_6 =  integer_pixels [6+16*9];
		in_7 =  integer_pixels [7+16*9];
		in_8 =  integer_pixels [8+16*9];
		in_9 =  integer_pixels [9+16*9];
		in_10 = integer_pixels [10+16*9];
		in_11 = integer_pixels [11+16*9];
		in_12 = integer_pixels [12+16*9];
		in_13 = integer_pixels [13+16*9];
		in_14 = integer_pixels [14+16*9];
		in_15 = integer_pixels [15+16*9];
		in_16 = integer_pixels [16+16*9];
		in_17 = integer_pixels [17+16*9];
		in_18 = integer_pixels [18+16*9];
		in_19 = integer_pixels [19+16*9];
		in_20 = integer_pixels [20+16*9];
		in_21 = integer_pixels [21+16*9];
		in_22 = integer_pixels [22+16*9];
		in_23 = integer_pixels [23+16*9];
		in_24 = integer_pixels [24+16*9];
		in_25 = integer_pixels [25+16*9];
		in_26 = integer_pixels [26+16*9];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*10];
		in_1 =  integer_pixels [1+16*10];
		in_2 =  integer_pixels [2+16*10];
		in_3 =  integer_pixels [3+16*10];
		in_4 =  integer_pixels [4+16*10];
		in_5 =  integer_pixels [5+16*10];
		in_6 =  integer_pixels [6+16*10];
		in_7 =  integer_pixels [7+16*10];
		in_8 =  integer_pixels [8+16*10];
		in_9 =  integer_pixels [9+16*10];
		in_10 = integer_pixels [10+16*10];
		in_11 = integer_pixels [11+16*10];
		in_12 = integer_pixels [12+16*10];
		in_13 = integer_pixels [13+16*10];
		in_14 = integer_pixels [14+16*10];
		in_15 = integer_pixels [15+16*10];
		in_16 = integer_pixels [16+16*10];
		in_17 = integer_pixels [17+16*10];
		in_18 = integer_pixels [18+16*10];
		in_19 = integer_pixels [19+16*10];
		in_20 = integer_pixels [20+16*10];
		in_21 = integer_pixels [21+16*10];
		in_22 = integer_pixels [22+16*10];
		in_23 = integer_pixels [23+16*10];
		in_24 = integer_pixels [24+16*10];
		in_25 = integer_pixels [25+16*10];
		in_26 = integer_pixels [26+16*10];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*11];
		in_1 =  integer_pixels [1+16*11];
		in_2 =  integer_pixels [2+16*11];
		in_3 =  integer_pixels [3+16*11];
		in_4 =  integer_pixels [4+16*11];
		in_5 =  integer_pixels [5+16*11];
		in_6 =  integer_pixels [6+16*11];
		in_7 =  integer_pixels [7+16*11];
		in_8 =  integer_pixels [8+16*11];
		in_9 =  integer_pixels [9+16*11];
		in_10 = integer_pixels [10+16*11];
		in_11 = integer_pixels [11+16*11];
		in_12 = integer_pixels [12+16*11];
		in_13 = integer_pixels [13+16*11];
		in_14 = integer_pixels [14+16*11];
		in_15 = integer_pixels [15+16*11];
		in_16 = integer_pixels [16+16*11];
		in_17 = integer_pixels [17+16*11];
		in_18 = integer_pixels [18+16*11];
		in_19 = integer_pixels [19+16*11];
		in_20 = integer_pixels [20+16*11];
		in_21 = integer_pixels [21+16*11];
		in_22 = integer_pixels [22+16*11];
		in_23 = integer_pixels [23+16*11];
		in_24 = integer_pixels [24+16*11];
		in_25 = integer_pixels [25+16*11];
		in_26 = integer_pixels [26+16*11];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*0];
		in_1 =  integer_pixels [1+16*0];
		in_2 =  integer_pixels [2+16*0];
		in_3 =  integer_pixels [3+16*0];
		in_4 =  integer_pixels [4+16*0];
		in_5 =  integer_pixels [5+16*0];
		in_6 =  integer_pixels [6+16*0];
		in_7 =  integer_pixels [7+16*0];
		in_8 =  integer_pixels [8+16*0];
		in_9 =  integer_pixels [9+16*0];
		in_10 = integer_pixels [10+16*0];
		in_11 = integer_pixels [11+16*0];
		in_12 = integer_pixels [12+16*0];
		in_13 = integer_pixels [13+16*0];
		in_14 = integer_pixels [14+16*0];
		in_15 = integer_pixels [15+16*0];
		in_16 = integer_pixels [16+16*0];
		in_17 = integer_pixels [17+16*0];
		in_18 = integer_pixels [18+16*0];
		in_19 = integer_pixels [19+16*0];
		in_20 = integer_pixels [20+16*0];
		in_21 = integer_pixels [21+16*0];
		in_22 = integer_pixels [22+16*0];
		in_23 = integer_pixels [23+16*0];
		in_24 = integer_pixels [24+16*0];
		in_25 = integer_pixels [25+16*0];
		in_26 = integer_pixels [26+16*0];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*1];
		in_1 =  integer_pixels [1+16*1];
		in_2 =  integer_pixels [2+16*1];
		in_3 =  integer_pixels [3+16*1];
		in_4 =  integer_pixels [4+16*1];
		in_5 =  integer_pixels [5+16*1];
		in_6 =  integer_pixels [6+16*1];
		in_7 =  integer_pixels [7+16*1];
		in_8 =  integer_pixels [8+16*1];
		in_9 =  integer_pixels [9+16*1];
		in_10 = integer_pixels [10+16*1];
		in_11 = integer_pixels [11+16*1];
		in_12 = integer_pixels [12+16*1];
		in_13 = integer_pixels [13+16*1];
		in_14 = integer_pixels [14+16*1];
		in_15 = integer_pixels [15+16*1];
		in_16 = integer_pixels [16+16*1];
		in_17 = integer_pixels [17+16*1];
		in_18 = integer_pixels [18+16*1];
		in_19 = integer_pixels [19+16*1];
		in_20 = integer_pixels [20+16*1];
		in_21 = integer_pixels [21+16*1];
		in_22 = integer_pixels [22+16*1];
		in_23 = integer_pixels [23+16*1];
		in_24 = integer_pixels [24+16*1];
		in_25 = integer_pixels [25+16*1];
		in_26 = integer_pixels [26+16*1];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*2];
		in_1 =  integer_pixels [1+16*2];
		in_2 =  integer_pixels [2+16*2];
		in_3 =  integer_pixels [3+16*2];
		in_4 =  integer_pixels [4+16*2];
		in_5 =  integer_pixels [5+16*2];
		in_6 =  integer_pixels [6+16*2];
		in_7 =  integer_pixels [7+16*2];
		in_8 =  integer_pixels [8+16*2];
		in_9 =  integer_pixels [9+16*2];
		in_10 = integer_pixels [10+16*2];
		in_11 = integer_pixels [11+16*2];
		in_12 = integer_pixels [12+16*2];
		in_13 = integer_pixels [13+16*2];
		in_14 = integer_pixels [14+16*2];
		in_15 = integer_pixels [15+16*2];
		in_16 = integer_pixels [16+16*2];
		in_17 = integer_pixels [17+16*2];
		in_18 = integer_pixels [18+16*2];
		in_19 = integer_pixels [19+16*2];
		in_20 = integer_pixels [20+16*2];
		in_21 = integer_pixels [21+16*2];
		in_22 = integer_pixels [22+16*2];
		in_23 = integer_pixels [23+16*2];
		in_24 = integer_pixels [24+16*2];
		in_25 = integer_pixels [25+16*2];
		in_26 = integer_pixels [26+16*2];

		#CLK_PERIOD;
		in_0 =  integer_pixels [0+16*3];
		in_1 =  integer_pixels [1+16*3];
		in_2 =  integer_pixels [2+16*3];
		in_3 =  integer_pixels [3+16*3];
		in_4 =  integer_pixels [4+16*3];
		in_5 =  integer_pixels [5+16*3];
		in_6 =  integer_pixels [6+16*3];
		in_7 =  integer_pixels [7+16*3];
		in_8 =  integer_pixels [8+16*3];
		in_9 =  integer_pixels [9+16*3];
		in_10 = integer_pixels [10+16*3];
		in_11 = integer_pixels [11+16*3];
		in_12 = integer_pixels [12+16*3];
		in_13 = integer_pixels [13+16*3];
		in_14 = integer_pixels [14+16*3];
		in_15 = integer_pixels [15+16*3];
		in_16 = integer_pixels [16+16*3];
		in_17 = integer_pixels [17+16*3];
		in_18 = integer_pixels [18+16*3];
		in_19 = integer_pixels [19+16*3];
		in_20 = integer_pixels [20+16*3];
		in_21 = integer_pixels [21+16*3];
		in_22 = integer_pixels [22+16*3];
		in_23 = integer_pixels [23+16*3];
		in_24 = integer_pixels [24+16*3];
		in_25 = integer_pixels [25+16*3];
		in_26 = integer_pixels [26+16*3];
		enable_read = 1; 

		#CLK_PERIOD;
		enable = 0;
		// coloca as linhas nas posições no valor iniciais
		#CLK_PERIOD 
		// enable = 1; // começa a ler as colunas da memoria

		#262;
		reset = 1;
		enable = 0;

		#30;
		$display("Sucessfull interpolation");
		$finish;
		
	end

endmodule