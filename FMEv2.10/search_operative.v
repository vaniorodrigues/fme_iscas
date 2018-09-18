/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-23 15:53:53
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-03-24 18:14:57
*/
module search_operative (
	clock,
	reset,
	enable,
	reset_right_sads,
	enable_reg_ori,
	enable_sr_ori,
	enable_read_ori,
	enable_left_side,
	enable_right_side,
	enable_out_sad_tree,
	sel_sad,
	enable_finder,
	enable_out_finder,
	reset_finder,
	left_or_right,
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

input clock,reset,enable,reset_finder,reset_right_sads,enable_reg_ori,enable_sr_ori,enable_read_ori,enable_left_side,enable_right_side,enable_out_sad_tree,sel_sad,enable_finder,enable_out_finder,left_or_right;

input [DATAWIDTH-1:0] original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8;

input [DATAWIDTH+7:0] lambda_r_SAD_0,lambda_r_SAD_1,lambda_r_SAD_2,lambda_r_SAD_3,lambda_r_SAD_4,lambda_r_SAD_5;

input [DATAWIDTH+8:0] best_sad_ime;

output [DATAWIDTH+8:0] best_sad;

output [5:0] address_best_sad;

output [DATAWIDTH:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7;

//----------------------  Internal Wires  ----------------------\\

wire msb_lr;
wire [2:0] address_best_of_6;
wire [DATAWIDTH+8:0] sad_0,sad_1,sad_2,sad_3,sad_4,sad_5,sad_6,sad_7,sad_8,sad_9,sad_10,sad_11;
wire [DATAWIDTH-1:0] reg_ori_out_0,reg_ori_out_1,reg_ori_out_2,reg_ori_out_3,reg_ori_out_4,reg_ori_out_5,reg_ori_out_6,reg_ori_out_7,tb_out_0,tb_out_1,tb_out_2,tb_out_3,tb_out_4,tb_out_5,tb_out_6,tb_out_7,tb_out_8,tb_out_9,tb_out_10,tb_out_11,tb_out_12,tb_out_13,tb_out_14,tb_out_15,best_candidate_0,best_candidate_1,best_candidate_2,best_candidate_3,best_candidate_4,best_candidate_5,best_candidate_6,best_candidate_7;
wire [DATAWIDTH-1:0] sad_tree_input_0, sad_tree_input_1, sad_tree_input_2, sad_tree_input_3, sad_tree_input_4, sad_tree_input_5, sad_tree_input_6, sad_tree_input_7,out_buf_candi_a0,out_buf_candi_a1,out_buf_candi_a2,out_buf_candi_a3,out_buf_candi_a4,out_buf_candi_a5,out_buf_candi_a6,out_buf_candi_a7,out_buf_candi_a8,out_buf_candi_b0,out_buf_candi_b1,out_buf_candi_b2,out_buf_candi_b3,out_buf_candi_b4,out_buf_candi_b5,out_buf_candi_b6,out_buf_candi_b7,out_buf_candi_b8,out_buf_candi_c0,out_buf_candi_c1,out_buf_candi_c2,out_buf_candi_c3,out_buf_candi_c4,out_buf_candi_c5,out_buf_candi_c6,out_buf_candi_c7,out_buf_candi_c8,in_buffer_best_candidate_0,in_buffer_best_candidate_1,in_buffer_best_candidate_2,in_buffer_best_candidate_3,in_buffer_best_candidate_4,in_buffer_best_candidate_5,in_buffer_best_candidate_6,in_buffer_best_candidate_7;
reg [3:0] counter_buffer_best;
reg enable_best_buffer;

//----------------------  Search Operative ----------------------\\
 
 buffer_candidates #(DATAWIDTH) buffer_candidates_a(clock,reset,enable,a0,a1,a2,a3,a4,a5,a6,a7,a8,out_buf_candi_a0,out_buf_candi_a1,out_buf_candi_a2,out_buf_candi_a3,out_buf_candi_a4,out_buf_candi_a5,out_buf_candi_a6,out_buf_candi_a7,out_buf_candi_a8);
 buffer_candidates #(DATAWIDTH) buffer_candidates_b(clock,reset,enable,b0,b1,b2,b3,b4,b5,b6,b7,b8,out_buf_candi_b0,out_buf_candi_b1,out_buf_candi_b2,out_buf_candi_b3,out_buf_candi_b4,out_buf_candi_b5,out_buf_candi_b6,out_buf_candi_b7,out_buf_candi_b8);
 buffer_candidates #(DATAWIDTH) buffer_candidates_c(clock,reset,enable,c0,c1,c2,c3,c4,c5,c6,c7,c8,out_buf_candi_c0,out_buf_candi_c1,out_buf_candi_c2,out_buf_candi_c3,out_buf_candi_c4,out_buf_candi_c5,out_buf_candi_c6,out_buf_candi_c7,out_buf_candi_c8);

 mux_best_candidate #(DATAWIDTH) mux_best_candidate_block(address_best_of_6,out_buf_candi_a0,out_buf_candi_a1,out_buf_candi_a2,out_buf_candi_a3,out_buf_candi_a4,out_buf_candi_a5,out_buf_candi_a6,out_buf_candi_a7,out_buf_candi_a8,out_buf_candi_b0,out_buf_candi_b1,out_buf_candi_b2,out_buf_candi_b3,out_buf_candi_b4,out_buf_candi_b5,out_buf_candi_b6,out_buf_candi_b7,out_buf_candi_b8,out_buf_candi_c0,out_buf_candi_c1,out_buf_candi_c2,out_buf_candi_c3,out_buf_candi_c4,out_buf_candi_c5,out_buf_candi_c6,out_buf_candi_c7,out_buf_candi_c8,in_buffer_best_candidate_0,in_buffer_best_candidate_1,in_buffer_best_candidate_2,in_buffer_best_candidate_3,in_buffer_best_candidate_4,in_buffer_best_candidate_5,in_buffer_best_candidate_6,in_buffer_best_candidate_7);

 buffer_best_candidates  #(DATAWIDTH) buffer_best_candidate_block(clock,reset,enable_best_buffer,in_buffer_best_candidate_0,in_buffer_best_candidate_1,in_buffer_best_candidate_2,in_buffer_best_candidate_3,in_buffer_best_candidate_4,in_buffer_best_candidate_5,in_buffer_best_candidate_6,in_buffer_best_candidate_7,best_candidate_0,best_candidate_1,best_candidate_2,best_candidate_3,best_candidate_4,best_candidate_5,best_candidate_6,best_candidate_7);
 
 reg_barrier #(DATAWIDTH) reg_original_block(clock,reset,enable_reg_ori,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,reg_ori_out_0,reg_ori_out_1,reg_ori_out_2,reg_ori_out_3,reg_ori_out_4,reg_ori_out_5,reg_ori_out_6,reg_ori_out_7);

 SR_original #(DATAWIDTH) SR_original_block(clock,reset,enable_sr_ori,enable_read_ori,reg_ori_out_0,reg_ori_out_1,reg_ori_out_2,reg_ori_out_3,reg_ori_out_4,reg_ori_out_5,reg_ori_out_6,reg_ori_out_7,tb_out_0,tb_out_1,tb_out_2,tb_out_3,tb_out_4,tb_out_5,tb_out_6,tb_out_7,tb_out_8,tb_out_9,tb_out_10,tb_out_11,tb_out_12,tb_out_13,tb_out_14,tb_out_15);

 SAD_tree #(DATAWIDTH) SAD_tree_block(clock,reset,reset_right_sads,enable_left_side,enable_right_side,enable_out_sad_tree,sel_sad,sad_tree_input_0,sad_tree_input_1,sad_tree_input_2,sad_tree_input_3,sad_tree_input_4,sad_tree_input_5,sad_tree_input_6,sad_tree_input_7,tb_out_8,tb_out_9,tb_out_10,tb_out_11,tb_out_12,tb_out_13,tb_out_14,tb_out_15,a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8,lambda_r_SAD_0,lambda_r_SAD_1,lambda_r_SAD_2,lambda_r_SAD_3,lambda_r_SAD_4,lambda_r_SAD_5,sad_0,sad_1,sad_2,sad_3,sad_4,sad_5,sad_6,sad_7,sad_8,sad_9,sad_10,sad_11);

 finder #(DATAWIDTH) finder_block(clock,reset_finder,enable_finder,enable_out_finder,left_or_right,best_sad_ime,sad_0,sad_1,sad_2,sad_3,sad_4,sad_5,sad_6,sad_7,sad_8,sad_9,sad_10,sad_11,address_best_of_6,msb_lr,best_sad,address_best_sad);
 
 residual #(DATAWIDTH) residual_block(clock,reset,enable_reg_ori,tb_out_0,tb_out_1,tb_out_2,tb_out_3,tb_out_4,tb_out_5,tb_out_6,tb_out_7,best_candidate_0,best_candidate_1,best_candidate_2,best_candidate_3,best_candidate_4,best_candidate_5,best_candidate_6,best_candidate_7,out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7);

//----------------------  Mux input SAD_tree ----------------------\\
 
 assign sad_tree_input_0 = (enable_reg_ori) ? reg_ori_out_0 : tb_out_0;
 assign sad_tree_input_1 = (enable_reg_ori) ? reg_ori_out_1 : tb_out_1;
 assign sad_tree_input_2 = (enable_reg_ori) ? reg_ori_out_2 : tb_out_2;
 assign sad_tree_input_3 = (enable_reg_ori) ? reg_ori_out_3 : tb_out_3;
 assign sad_tree_input_4 = (enable_reg_ori) ? reg_ori_out_4 : tb_out_4;
 assign sad_tree_input_5 = (enable_reg_ori) ? reg_ori_out_5 : tb_out_5;
 assign sad_tree_input_6 = (enable_reg_ori) ? reg_ori_out_6 : tb_out_6;
 assign sad_tree_input_7 = (enable_reg_ori) ? reg_ori_out_7 : tb_out_7;

always @ (posedge reset or posedge clock)
    if (reset) begin
        counter_buffer_best <= 0;
        enable_best_buffer <= 0;
    end else if (enable) begin
        if (msb_lr) begin
            counter_buffer_best <= 6;
             enable_best_buffer <= 1;
        end
        else if(counter_buffer_best > 0)begin
            counter_buffer_best <= counter_buffer_best -1;
            enable_best_buffer <= 1;
        end 
    end else begin
        enable_best_buffer <= 0;
        counter_buffer_best <= 0;
    end

endmodule
