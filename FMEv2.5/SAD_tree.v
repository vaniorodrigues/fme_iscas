module SAD_tree(
	clock,
	reset,
	reset_right_sads,
	enable_left_side,
	enable_right_side,
	enable_out,
	sel,
	original_0,
	original_1,
	original_2,
	original_3,
	original_4,
	original_5,
	original_6,
	original_7,
	original_ante_0, //antecedent, which will be the original_0 from the last cicle.
	original_ante_1,
	original_ante_2,
	original_ante_3,
	original_ante_4,
	original_ante_5,
	original_ante_6,
	original_ante_7,
	a0,
	a1,
	a2,
	a3,
	a4,
	a5,
	a6,
	a7,
	a8,
	b0,
	b1,
	b2,
	b3,
	b4,
	b5,
	b6,
	b7,
	b8,
	c0,
	c1,
	c2,
	c3,
	c4,
	c5,
	c6,
	c7,
	c8,
	lambda_r_SAD_0,	
	lambda_r_SAD_1,
	lambda_r_SAD_2,
	lambda_r_SAD_3,	
	lambda_r_SAD_4,
	lambda_r_SAD_5,
	sad_0,
	sad_1,
	sad_2,
	sad_3,
	sad_4,
	sad_5,
	sad_6,
	sad_7,
	sad_8,
	sad_9,
	sad_10,
	sad_11		
);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input clock,reset, reset_right_sads, enable_left_side, enable_right_side, enable_out, sel;

input [DATAWIDTH-1:0] original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,original_ante_0,original_ante_1,original_ante_2,original_ante_3,original_ante_4,original_ante_5,original_ante_6,original_ante_7,a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8;

input [DATAWIDTH+7:0] lambda_r_SAD_0,lambda_r_SAD_1,lambda_r_SAD_2,lambda_r_SAD_3,lambda_r_SAD_4,lambda_r_SAD_5;

output [DATAWIDTH+8:0] sad_0,sad_1,sad_2,sad_3,sad_4,sad_5,sad_6,sad_7,sad_8,sad_9,sad_10,sad_11;

//----------------------  Internal Wires  ----------------------\\

reg enable_out_right,sel_right;

//----------------------  SAD_tree  ----------------------\\

 SAD #(DATAWIDTH) SAD_0(clock,reset,enable_left_side,enable_out,sel,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,a0,a1,a2,a3,a4,a5,a6,a7,lambda_r_SAD_0,sad_0);
 SAD #(DATAWIDTH) SAD_1(clock,reset,enable_left_side,enable_out,sel,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,b0,b1,b2,b3,b4,b5,b6,b7,lambda_r_SAD_1,sad_1);
 SAD #(DATAWIDTH) SAD_2(clock,reset,enable_left_side,enable_out,sel,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,c0,c1,c2,c3,c4,c5,c6,c7,lambda_r_SAD_2,sad_2);
 SAD #(DATAWIDTH) SAD_3(clock,reset,enable_left_side,enable_out,sel,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,a1,a2,a3,a4,a5,a6,a7,a8,lambda_r_SAD_3,sad_3);
 SAD #(DATAWIDTH) SAD_4(clock,reset,enable_left_side,enable_out,sel,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,b1,b2,b3,b4,b5,b6,b7,b8,lambda_r_SAD_4,sad_4);
 SAD #(DATAWIDTH) SAD_5(clock,reset,enable_left_side,enable_out,sel,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,c1,c2,c3,c4,c5,c6,c7,c8,lambda_r_SAD_5,sad_5);
 
 SAD #(DATAWIDTH) SAD_6(clock,reset_right_sads,enable_right_side,enable_out_right,sel_right,original_ante_0,original_ante_1,original_ante_2,original_ante_3,original_ante_4,original_ante_5,original_ante_6,original_ante_7,a0,a1,a2,a3,a4,a5,a6,a7,lambda_r_SAD_0,sad_6);
 SAD #(DATAWIDTH) SAD_7(clock,reset_right_sads,enable_right_side,enable_out_right,sel_right,original_ante_0,original_ante_1,original_ante_2,original_ante_3,original_ante_4,original_ante_5,original_ante_6,original_ante_7,b0,b1,b2,b3,b4,b5,b6,b7,lambda_r_SAD_1,sad_7);
 SAD #(DATAWIDTH) SAD_8(clock,reset_right_sads,enable_right_side,enable_out_right,sel_right,original_ante_0,original_ante_1,original_ante_2,original_ante_3,original_ante_4,original_ante_5,original_ante_6,original_ante_7,c0,c1,c2,c3,c4,c5,c6,c7,lambda_r_SAD_2,sad_8);
 SAD #(DATAWIDTH) SAD_9(clock,reset_right_sads,enable_right_side,enable_out_right,sel_right,original_ante_0,original_ante_1,original_ante_2,original_ante_3,original_ante_4,original_ante_5,original_ante_6,original_ante_7,a1,a2,a3,a4,a5,a6,a7,a8,lambda_r_SAD_3,sad_9);
 SAD #(DATAWIDTH) SAD_10(clock,reset_right_sads,enable_right_side,enable_out_right,sel_right,original_ante_0,original_ante_1,original_ante_2,original_ante_3,original_ante_4,original_ante_5,original_ante_6,original_ante_7,b1,b2,b3,b4,b5,b6,b7,b8,lambda_r_SAD_4,sad_10);
 SAD #(DATAWIDTH) SAD_11(clock,reset_right_sads,enable_right_side,enable_out_right,sel_right,original_ante_0,original_ante_1,original_ante_2,original_ante_3,original_ante_4,original_ante_5,original_ante_6,original_ante_7,c1,c2,c3,c4,c5,c6,c7,c8,lambda_r_SAD_5,sad_11);

 
always @(posedge clock or posedge reset)
		if (reset) 	begin
			enable_out_right <= 0;
			sel_right <= 0;

		end else if (enable_right_side) begin
			enable_out_right <= enable_out;
			sel_right <= sel;
		end

 /* ----------------------  Obs  ----------------------

	- SAD, upper case, stands for the block that calculates the sum of absolute difference,
 the lower case one is the output of the SAD block, or better putted, the actual sum of absolute
 difference.

 	- [4,5,144] Left_side is used during all the search (with exception of the dark cycles, no pun intended), 
 the Right_side is responsable for the "2D" aspect of the PVSO candidates, and therefore, is only used
 during the search on them.
	
	- [109] Register is used to delay the out of right_side SAD_trees, since their calculation start once cycle later, and therefore,
 finish once cycle after the left_side.

 	- We need 2 columns (or lines) of original pixels per cicle when calculating the PVSO, since we've 4 candidates. 

 	- Reset_right_sides é m sinal utilizado para zerar as sads durante o inicio das interações, quando estas sads ainda carregam valores da interação anterior.
 */

endmodule