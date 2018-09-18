/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-23 15:53:53
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-03-24 18:15:53
*/
module search(
	clock,
	reset,
	enable,
	best_sad_ime,
	original_0,
	original_1,
	original_2,
	original_3,
	original_4,
	original_5,
	original_6,
	original_7,
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
	address_best_sad,
	best_sad,
	out_0,
	out_1,
	out_2,
	out_3,
	out_4,
	out_5,
	out_6,
	out_7
	);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input clock, reset, enable;

input [DATAWIDTH-1:0] original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8;

input [DATAWIDTH+7:0] lambda_r_SAD_0,lambda_r_SAD_1,lambda_r_SAD_2,lambda_r_SAD_3,lambda_r_SAD_4,lambda_r_SAD_5;

input [DATAWIDTH+8:0] best_sad_ime;

output [5:0] address_best_sad;

output [DATAWIDTH+8:0] best_sad;

output [DATAWIDTH:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7;

//----------------------  Internal Wires  ----------------------\\

wire reset_right_sads,enable_reg_ori,enable_sr_ori,enable_read_ori,enable_left_side,enable_right_side,enable_out_sad_tree,sel_sad,enable_finder,enable_out_finder,reset_finder,left_or_right;

//----------------------  Search  ----------------------\\

search_control #(DATAWIDTH) SC_block (clock,reset,reset_right_sads,enable,enable_reg_ori,enable_sr_ori,enable_read_ori,enable_left_side,enable_right_side,enable_out_sad_tree,sel_sad,enable_finder,enable_out_finder,reset_finder,left_or_right);

search_operative #(DATAWIDTH) SO_block (clock,reset,enable,reset_right_sads,enable_reg_ori,enable_sr_ori,enable_read_ori,enable_left_side,enable_right_side,enable_out_sad_tree,sel_sad,enable_finder,enable_out_finder,reset_finder,left_or_right,best_sad_ime,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8,lambda_r_SAD_0,lambda_r_SAD_1,lambda_r_SAD_2,lambda_r_SAD_3,lambda_r_SAD_4,lambda_r_SAD_5,address_best_sad,best_sad,out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7);

endmodule