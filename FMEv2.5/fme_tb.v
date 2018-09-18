module fme_tb;

	parameter H_CLK_PERIOD = 100;
	parameter CLK_PERIOD = H_CLK_PERIOD*2;
	
	parameter DATAWIDTH = 8;

	reg clock, reset, enable;
	reg [DATAWIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7;
	reg [DATAWIDTH+7:0] lambda_r_SAD_0,lambda_r_SAD_1,lambda_r_SAD_2,lambda_r_SAD_3,lambda_r_SAD_4,lambda_r_SAD_5;
	reg [DATAWIDTH+8:0] best_sad_ime;
	wire [5:0] address_best_sad;
	wire [DATAWIDTH+8:0] best_sad;
	wire [DATAWIDTH:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7;

	reg [5:0] i,k; 
	reg [DATAWIDTH-1:0] integer_pixels [255:0];
	reg [DATAWIDTH-1:0] PH_a [143:0];
	reg [DATAWIDTH-1:0] PH_b [143:0];
	reg [DATAWIDTH-1:0] PH_c [143:0];
	reg [DATAWIDTH-1:0] PVPO [215:0];
	reg [DATAWIDTH-1:0] PVSO_a [242:0];
	reg [DATAWIDTH-1:0] PVSO_b [242:0];
	reg [DATAWIDTH-1:0] PVSO_c [242:0];
	reg [DATAWIDTH+7:0] lambda_r [47:0]; // 48 lambda_r, one for each candidate(SAD)
	reg [DATAWIDTH-1:0] Original_block [63:0]; // 64 pixels 8x8


	 fme #(DATAWIDTH) fme_1(
		.clock(clock),
		.reset(reset),
		.enable(enable),
		.best_sad_ime(best_sad_ime),
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
		.original_0(original_0),
		.original_1(original_1),
		.original_2(original_2),
		.original_3(original_3),
		.original_4(original_4),
		.original_5(original_5),
		.original_6(original_6),
		.original_7(original_7),
		.lambda_r_SAD_0(lambda_r_SAD_0),
		.lambda_r_SAD_1(lambda_r_SAD_1),
		.lambda_r_SAD_2(lambda_r_SAD_2),
		.lambda_r_SAD_3(lambda_r_SAD_3),
		.lambda_r_SAD_4(lambda_r_SAD_4),
		.lambda_r_SAD_5(lambda_r_SAD_5),
		.address_best_sad(address_best_sad),
		.best_sad(best_sad),
		.out_0(out_0),
		.out_1(out_1),
		.out_2(out_2),
		.out_3(out_3),
		.out_4(out_4),
		.out_5(out_5),
		.out_6(out_6),
		.out_7(out_7)
	);



	initial $readmemh(".././fprintf_referencia/integer_pixels.txt", integer_pixels);
	initial $readmemh(".././fprintf_referencia/PH_a.txt", PH_a);
	initial $readmemh(".././fprintf_referencia/PH_b.txt", PH_b);
	initial $readmemh(".././fprintf_referencia/PH_c.txt", PH_c);
	initial $readmemh(".././fprintf_referencia/PVPO.txt", PVPO);
	initial $readmemh(".././fprintf_referencia/PVSO_a.txt", PVSO_a);
	initial $readmemh(".././fprintf_referencia/PVSO_b.txt", PVSO_b);
	initial $readmemh(".././fprintf_referencia/PVSO_c.txt", PVSO_c);
	initial $readmemh(".././fprintf_referencia/lambda_r.txt", lambda_r);
	initial $readmemh(".././fprintf_referencia/Original_block.txt", Original_block);
	
	

	always 
		#H_CLK_PERIOD clock = !clock;


	initial begin
		$dumpfile ("fme_tb.vcd");
		$dumpvars;

				// Inicializaçao //
		clock = 0;
		reset = 0;
		enable = 0;

		best_sad_ime = 17'b11111111111111111;

		i = 0;
		k = 0;

		in_0  = 0;
		in_1  = 0;
		in_2  = 0;
		in_3  = 0;
		in_4  = 0;
		in_5  = 0;
		in_6  = 0;
		in_7  = 0;
		in_8  = 0;
		in_9  = 0;
		in_10 = 0;
		in_11 = 0;
		in_12 = 0;
		in_13 = 0;
		in_14 = 0;
		in_15 = 0;

		original_0 = 0;
		original_1 = 0;
		original_2 = 0;
		original_3 = 0;
		original_4 = 0;
		original_5 = 0;
		original_6 = 0;
		original_7 = 0;

		lambda_r_SAD_0 = 0;
		lambda_r_SAD_1 = 0;
		lambda_r_SAD_2 = 0;
		lambda_r_SAD_3 = 0;
		lambda_r_SAD_4 = 0;
		lambda_r_SAD_5 = 0;
	

		#CLK_PERIOD
			reset = 1;
			// @ (negedge clock);
			// 	reset = 1;
			// @ (posedge clock); 
			// 	reset = 0;
		#CLK_PERIOD
			reset = 0;

		#CLK_PERIOD 

		enable = 1;

		lambda_r_SAD_0 = lambda_r [21]; // This lambda_r are mapped to the old system.
		lambda_r_SAD_1 = lambda_r [22];
		lambda_r_SAD_2 = lambda_r [23];
		lambda_r_SAD_3 = lambda_r [24];
		lambda_r_SAD_4 = lambda_r [25];
		lambda_r_SAD_5 = lambda_r [26];

		#CLK_PERIOD

			in_0  = integer_pixels [0];
			in_1  = integer_pixels [0+16*1];
			in_2  = integer_pixels [0+16*2];
			in_3  = integer_pixels [0+16*3];
			in_4  = integer_pixels [0+16*4];
			in_5  = integer_pixels [0+16*5];
			in_6  = integer_pixels [0+16*6];
			in_7  = integer_pixels [0+16*7];
			in_8  = integer_pixels [0+16*8];
			in_9  = integer_pixels [0+16*9];
			in_10 = integer_pixels [0+16*10];
			in_11 = integer_pixels [0+16*11];
			in_12 = integer_pixels [0+16*12];
			in_13 = integer_pixels [0+16*13];
			in_14 = integer_pixels [0+16*14];
			in_15 = integer_pixels [0+16*15];

		

		for (k = 1; k < 5; k = k +1) begin
			#CLK_PERIOD;
			in_0  = integer_pixels [k];
			in_1  = integer_pixels [k+16*1];
			in_2  = integer_pixels [k+16*2];
			in_3  = integer_pixels [k+16*3];
			in_4  = integer_pixels [k+16*4];
			in_5  = integer_pixels [k+16*5];
			in_6  = integer_pixels [k+16*6];
			in_7  = integer_pixels [k+16*7];
			in_8  = integer_pixels [k+16*8];
			in_9  = integer_pixels [k+16*9];
			in_10 = integer_pixels [k+16*10];
			in_11 = integer_pixels [k+16*11];
			in_12 = integer_pixels [k+16*12];
			in_13 = integer_pixels [k+16*13];
			in_14 = integer_pixels [k+16*14];
			in_15 = integer_pixels [k+16*15];
		end
		
//		#CLK_PERIOD
		original_0  = Original_block [0];
		original_1  = Original_block [0+8*1];
		original_2  = Original_block [0+8*2];
		original_3  = Original_block [0+8*3];
		original_4  = Original_block [0+8*4];
		original_5  = Original_block [0+8*5];
		original_6  = Original_block [0+8*6];
		original_7  = Original_block [0+8*7];

		for (k = 5; k < 13; k = k +1) begin
			#CLK_PERIOD;
			in_0  = integer_pixels [k];
			in_1  = integer_pixels [k+16*1];
			in_2  = integer_pixels [k+16*2];
			in_3  = integer_pixels [k+16*3];
			in_4  = integer_pixels [k+16*4];
			in_5  = integer_pixels [k+16*5];
			in_6  = integer_pixels [k+16*6];
			in_7  = integer_pixels [k+16*7];
			in_8  = integer_pixels [k+16*8];
			in_9  = integer_pixels [k+16*9];
			in_10 = integer_pixels [k+16*10];
			in_11 = integer_pixels [k+16*11];
			in_12 = integer_pixels [k+16*12];
			in_13 = integer_pixels [k+16*13];
			in_14 = integer_pixels [k+16*14];
			in_15 = integer_pixels [k+16*15];

			original_0  = Original_block [i];
			original_1  = Original_block [i+8*1];
			original_2  = Original_block [i+8*2];
			original_3  = Original_block [i+8*3];
			original_4  = Original_block [i+8*4];
			original_5  = Original_block [i+8*5];
			original_6  = Original_block [i+8*6];
			original_7  = Original_block [i+8*7];

			i = i +1;
		end

		i = 0;

		for (k = 13; k < 16; k = k +1) begin
			#CLK_PERIOD;
			in_0  = integer_pixels [k];
			in_1  = integer_pixels [k+16*1];
			in_2  = integer_pixels [k+16*2];
			in_3  = integer_pixels [k+16*3];
			in_4  = integer_pixels [k+16*4];
			in_5  = integer_pixels [k+16*5];
			in_6  = integer_pixels [k+16*6];
			in_7  = integer_pixels [k+16*7];
			in_8  = integer_pixels [k+16*8];
			in_9  = integer_pixels [k+16*9];
			in_10 = integer_pixels [k+16*10];
			in_11 = integer_pixels [k+16*11];
			in_12 = integer_pixels [k+16*12];
			in_13 = integer_pixels [k+16*13];
			in_14 = integer_pixels [k+16*14];
			in_15 = integer_pixels [k+16*15];
		end
		


		for (i = 0; i <=7 ; i = i +1) begin
			#CLK_PERIOD;
			lambda_r_SAD_0 = lambda_r [3];	
			lambda_r_SAD_1 = lambda_r [10];
			lambda_r_SAD_2 = lambda_r [17];
			lambda_r_SAD_3 = lambda_r [30];	
			lambda_r_SAD_4 = lambda_r [37];
			lambda_r_SAD_5 = lambda_r [44];

		end
			
			#CLK_PERIOD;
			#CLK_PERIOD;
			#CLK_PERIOD;
			lambda_r_SAD_0 = lambda_r [0];	
			lambda_r_SAD_1 = lambda_r [7];
			lambda_r_SAD_2 = lambda_r [14];
			lambda_r_SAD_3 = lambda_r [27];	
			lambda_r_SAD_4 = lambda_r [34];
			lambda_r_SAD_5 = lambda_r [41];

		for (i = 0; i <=7 ; i = i +1) begin
			#CLK_PERIOD;

			lambda_r_SAD_0 = lambda_r [4];	
			lambda_r_SAD_1 = lambda_r [11];
			lambda_r_SAD_2 = lambda_r [18];
			lambda_r_SAD_3 = lambda_r [31];	
			lambda_r_SAD_4 = lambda_r [38];
			lambda_r_SAD_5 = lambda_r [45];
		end

			#CLK_PERIOD;
			lambda_r_SAD_0 = lambda_r [1];	
			lambda_r_SAD_1 = lambda_r [8];
			lambda_r_SAD_2 = lambda_r [15];
			lambda_r_SAD_3 = lambda_r [28];	
			lambda_r_SAD_4 = lambda_r [35];
			lambda_r_SAD_5 = lambda_r [42];

		for (i = 0; i <=7 ; i = i +1) begin
			#CLK_PERIOD;
			lambda_r_SAD_0 = lambda_r [5];	
			lambda_r_SAD_1 = lambda_r [12];
			lambda_r_SAD_2 = lambda_r [19];
			lambda_r_SAD_3 = lambda_r [32];	
			lambda_r_SAD_4 = lambda_r [39];
			lambda_r_SAD_5 = lambda_r [46];
		end

			#CLK_PERIOD;
			lambda_r_SAD_0 = lambda_r [2];	
			lambda_r_SAD_1 = lambda_r [9];
			lambda_r_SAD_2 = lambda_r [16];
			lambda_r_SAD_3 = lambda_r [29];	
			lambda_r_SAD_4 = lambda_r [36];
			lambda_r_SAD_5 = lambda_r [43];

		for (i = 0; i <=7 ; i = i +1) begin
			#CLK_PERIOD;

			lambda_r_SAD_0 = lambda_r [6];	
			lambda_r_SAD_1 = lambda_r [13];
			lambda_r_SAD_2 = lambda_r [20];
			lambda_r_SAD_3 = lambda_r [33];	
			lambda_r_SAD_4 = lambda_r [40];
			lambda_r_SAD_5 = lambda_r [47];
		end

		#CLK_PERIOD;
		enable = 0;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;
		#CLK_PERIOD;

		$display("Best SAD: %d, Best SAD Addr: %d", best_sad, address_best_sad);
	    $display("Sucessfull Fractional Motion Estimation");
	 	$finish;

	end
endmodule