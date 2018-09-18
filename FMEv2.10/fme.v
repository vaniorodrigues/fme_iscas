/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-19 18:16:57
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-04-04 14:46:16
*/
`include "AbsoluteDifference.v"
`include "AbsoluteDifference_cell.v"
`include "Accumulator.v"
`include "Adder.v"
`include "Adder_cell.v"
`include "address_finder.v"
`include "arithmetic.v"
`include "buffer_best_candidates.v"
`include "buffer_candidates.v"
`include "clip10.v"
`include "clip11.v"
`include "clipper.v"
`include "datapath1.v"
`include "datapath2.v"
`include "datapath5.v"
`include "datapath8.v"
`include "difference_finder.v"
`include "finder.v"
`include "interpolation.v"
`include "interpolation_control.v"
`include "interpolation_operative.v"
`include "mux3x1_48inputs.v"
`include "mux_best_candidate.v"
`include "plus1shift.v"
`include "reg_barrier.v"
`include "reg_int.v"
`include "register.v"
`include "residual.v"
`include "SAD.v"
`include "SAD_tree.v"
`include "search.v"
`include "search_control.v"
`include "search_operative.v"
`include "SR_integer.v"
`include "SR_horizontal.v"
`include "SR_original.v"


module fme(
	clock,
	reset,
	enable,
	best_sad_ime,
	in_0,
	in_1,
	in_2,
	in_3,
	in_4,
	in_5,
	in_6,
	in_7,
	in_8,
	in_9,
	in_10,
	in_11,
	in_12,
	in_13,
	in_14,
	in_15,
	original_0,
	original_1,
	original_2,
	original_3,
	original_4,
	original_5,
	original_6,
	original_7,
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

//--------------------------------- Parameters -----------------------------//

parameter DATAWIDTH = 8;

//--------------------------------- Input ports -----------------------------//

input clock, reset, enable;

input [DATAWIDTH+8:0] best_sad_ime;

input [DATAWIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7;

input [DATAWIDTH+7:0] lambda_r_SAD_0,lambda_r_SAD_1,lambda_r_SAD_2,lambda_r_SAD_3,lambda_r_SAD_4,lambda_r_SAD_5;

//--------------------------------- Output ports -----------------------------//

output [5:0] address_best_sad;

output [DATAWIDTH+8:0] best_sad;

output [DATAWIDTH:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7;

//--------------------------------- Internal Wires -----------------------------//

wire [DATAWIDTH-1:0] a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8;

reg enable_search;

reg [2:0] counter_enable_search;

//--------------------------------- Fractional Motion Estimation -----------------------------//

interpolation #(DATAWIDTH) interpolation_cell (clock,reset,enable,in_0,in_1,in_2,in_3,in_4,in_5,in_6,in_7,in_8,in_9,in_10,in_11,in_12,in_13,in_14,in_15,a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8);

search #(DATAWIDTH) search_cell (clock,reset,enable_search,best_sad_ime,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8,lambda_r_SAD_0,lambda_r_SAD_1,lambda_r_SAD_2,lambda_r_SAD_3,lambda_r_SAD_4,lambda_r_SAD_5,address_best_sad,best_sad,out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7); 

always @ (posedge reset or posedge clock)
    if (reset) begin
        enable_search <= 0;
        counter_enable_search <= 2;
    end else if (enable) begin
    	counter_enable_search <= counter_enable_search +1;
        	if (counter_enable_search > 4) begin // ou 3
            enable_search <= 1;
            end
    end 
    else begin
        counter_enable_search <= counter_enable_search -1;
            if (counter_enable_search < 5) begin // ou 3
            enable_search <= 0;
            end
    end 
endmodule