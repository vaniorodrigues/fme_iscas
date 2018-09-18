/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-23 15:53:53
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-03-24 18:19:55
*/
module search_control(
	clock,
	reset,
	reset_right_sads,
	enable,
	enable_reg_ori,
	enable_sr_ori,
	enable_read_original,
	enable_left_side,
	enable_right_side,
	enable_out_sad_tree,
	sel_sad,
	enable_finder,
	enable_out_finder,
	reset_finder,
	left_or_right
	);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input clock, reset, enable;

output reg reset_right_sads,enable_reg_ori,enable_sr_ori,enable_read_original,enable_left_side,enable_right_side,enable_out_sad_tree,sel_sad,enable_finder,enable_out_finder,reset_finder,left_or_right;

//----------------------  States  ----------------------\\

reg [5:0] state;
parameter
IDLE = 0,
LOAD_NEW_INPUTS = 1,
LOAD_NEW_INPUTS_0  = 2,
SAD_CALCULATION_RIGHT_OFF_0 = 3, 
SAD_CALCULATION_RIGHT_OFF_1 = 4,
SAD_CALCULATION_RIGHT_OFF_2 = 5,
SAD_CALCULATION_RIGHT_OFF_3 = 6,
SAD_CALCULATION_RIGHT_OFF_4 = 7,
SAD_CALCULATION_RIGHT_OFF_5 = 8,
SAD_CALCULATION_RIGHT_OFF_6 = 9,
LOAD_NEW_INPUTS_1 = 10,
SAD_CALCULATION_RIGHT_OFF_8 = 11,
SAD_CALCULATION_RIGHT_OFF_9 = 12,
SAD_CALCULATION_RIGHT_OFF_10 = 13,
SAD_CALCULATION_RIGHT_OFF_11 = 14,
SAD_CALCULATION_RIGHT_OFF_12 = 15,
SAD_CALCULATION_RIGHT_OFF_13 = 16,
SAD_CALCULATION_RIGHT_OFF_14 = 17,
LOAD_NEW_INPUTS_2 = 18,
SAD_CALCULATION_RIGHT_ON_0 = 19,
SAD_CALCULATION_RIGHT_ON_1 = 20,
SAD_CALCULATION_RIGHT_ON_2 = 21,
SAD_CALCULATION_RIGHT_ON_3 = 22,
SAD_CALCULATION_RIGHT_ON_4 = 23,
SAD_CALCULATION_RIGHT_ON_5 = 24,
SAD_CALCULATION_RIGHT_ON_6 = 25,
SAD_CALCULATION_RIGHT_ON_7 = 26,
LOAD_NEW_INPUTS_3 = 27,
SAD_CALCULATION_RIGHT_ON_9 = 28,
SAD_CALCULATION_RIGHT_ON_10 = 29,
SAD_CALCULATION_RIGHT_ON_11 = 30,
SAD_CALCULATION_RIGHT_ON_12 = 31,
SAD_CALCULATION_RIGHT_ON_13 = 32,
SAD_CALCULATION_RIGHT_ON_14 = 33,
SAD_CALCULATION_RIGHT_ON_15 = 34,
SAD_CALCULATION_RIGHT_ON_16 = 35,
LOAD_NEW_INPUTS_4 = 36,
SAD_CALCULATION_RIGHT_ON_18 = 37,
SAD_CALCULATION_RIGHT_ON_19 = 38,
SAD_CALCULATION_RIGHT_ON_20 = 39,
SAD_CALCULATION_RIGHT_ON_21 = 40,
SAD_CALCULATION_RIGHT_ON_22 = 41,
SAD_CALCULATION_RIGHT_ON_23 = 42,
SAD_CALCULATION_RIGHT_ON_24 = 43,
SAD_CALCULATION_RIGHT_ON_25 = 44,
LAST_PART_0 = 45,
LAST_PART_1 = 46,
LAST_PART_2 = 47,
STALL_0 = 48,
STALL_1 = 49,
STALL_2 = 50,
STALL_3 = 51;



always @ (state) begin
	case (state)
		IDLE:begin 
			enable_left_side = 1'b0;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;
			reset_finder = 1'b0;
			reset_right_sads  = 1'b0;

		end

		LOAD_NEW_INPUTS:begin // Only for the first interation, so it can load the values of the originals into the input register.
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b1;
			reset_finder = 1'b0;
		end
		LOAD_NEW_INPUTS_0:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0; // Change from the single version
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b1;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b1;
		end

		SAD_CALCULATION_RIGHT_OFF_0:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b1;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b1;
		end
		SAD_CALCULATION_RIGHT_OFF_1:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b1;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_2:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b1;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_3:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b1;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_4:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b1;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_5:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b1;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_6:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b1;
			enable_sr_ori = 1'b1;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
		end
		
		
		LOAD_NEW_INPUTS_1:begin // We need new lamba_r em new imputs
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b1;
			sel_sad = 1'b0;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b1;
		end

		STALL_0:begin // During the interpolation of the lower samples of horizontals, the sad is in stall mode.
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
			reset_finder = 1'b0;
		end

		STALL_1:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
		end

		STALL_2:begin
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		STALL_3:begin
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end


		SAD_CALCULATION_RIGHT_OFF_8:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_9:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_10:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_11:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_12:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_13:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_OFF_14:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end


		LOAD_NEW_INPUTS_2:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b1;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		SAD_CALCULATION_RIGHT_ON_0:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_1:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_2:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_3:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_4:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_5:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_6:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_7:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b1;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		LOAD_NEW_INPUTS_3:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		SAD_CALCULATION_RIGHT_ON_9:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_10:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_11:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_12:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_13:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_14:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_15:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_16:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b1;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		LOAD_NEW_INPUTS_4:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		SAD_CALCULATION_RIGHT_ON_18:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_19:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_20:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_21:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_22:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_23:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_24:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end
		SAD_CALCULATION_RIGHT_ON_25:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b1;
			enable_out_sad_tree = 1'b1;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		LAST_PART_0:begin 
			enable_left_side = 1'b0;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		LAST_PART_1:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b1;
			enable_out_finder = 1'b1;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b1;
			reset_right_sads  = 1'b0;
		end

		LAST_PART_2:begin 
			enable_left_side = 1'b1;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b1;
			enable_finder = 1'b1;
			enable_out_finder = 1'b0;
			left_or_right = 1'b1;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;
			reset_right_sads  = 1'b0;
		end

		default:begin 
			enable_left_side = 1'b0;
			enable_right_side = 1'b0;
			enable_out_sad_tree = 1'b0;
			sel_sad = 1'b0;
			enable_finder = 1'b0;
			enable_out_finder = 1'b0;
			left_or_right = 1'b0;
			enable_reg_ori = 1'b0;
			enable_sr_ori = 1'b0;
			enable_read_original = 1'b0;		
		end
	endcase
end



always @ (posedge clock or posedge reset) begin
	if (reset)
		state <= IDLE;
	else
	case (state)
		IDLE: if(enable)
				state <=  LOAD_NEW_INPUTS;
		LOAD_NEW_INPUTS: if (enable)  state <=  LOAD_NEW_INPUTS_0;
		LOAD_NEW_INPUTS_0: if (enable)  state <=  SAD_CALCULATION_RIGHT_OFF_0;
		SAD_CALCULATION_RIGHT_OFF_0: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_1;  
		SAD_CALCULATION_RIGHT_OFF_1: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_2;
		SAD_CALCULATION_RIGHT_OFF_2: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_3;
		SAD_CALCULATION_RIGHT_OFF_3: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_4;
		SAD_CALCULATION_RIGHT_OFF_4: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_5;
		SAD_CALCULATION_RIGHT_OFF_5: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_6;
		SAD_CALCULATION_RIGHT_OFF_6: if (enable) state <= LOAD_NEW_INPUTS_1;
		//LOAD_NEW_INPUTS_1: if (enable)  state <= SAD_CALCULATION_RIGHT_OFF_8;
		LOAD_NEW_INPUTS_1: state <= STALL_0;
		STALL_0:  state <= STALL_1;
		STALL_1:  state <= STALL_2;
		STALL_2:  state <= STALL_3;
		STALL_3:  state <= SAD_CALCULATION_RIGHT_OFF_8;

		SAD_CALCULATION_RIGHT_OFF_8: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_9;
		SAD_CALCULATION_RIGHT_OFF_9: if (enable)  state <= SAD_CALCULATION_RIGHT_OFF_10;
		SAD_CALCULATION_RIGHT_OFF_10: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_11;
		SAD_CALCULATION_RIGHT_OFF_11: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_12;
		SAD_CALCULATION_RIGHT_OFF_12: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_13;
		SAD_CALCULATION_RIGHT_OFF_13: if (enable) state <= SAD_CALCULATION_RIGHT_OFF_14;
		SAD_CALCULATION_RIGHT_OFF_14: if (enable) state <= LOAD_NEW_INPUTS_2;
		LOAD_NEW_INPUTS_2: if (enable)  state <= SAD_CALCULATION_RIGHT_ON_0;
		SAD_CALCULATION_RIGHT_ON_0: if (enable) state <= SAD_CALCULATION_RIGHT_ON_1;
		SAD_CALCULATION_RIGHT_ON_1: if (enable) state <= SAD_CALCULATION_RIGHT_ON_2;
		SAD_CALCULATION_RIGHT_ON_2: if (enable) state <= SAD_CALCULATION_RIGHT_ON_3;
		SAD_CALCULATION_RIGHT_ON_3: if (enable) state <= SAD_CALCULATION_RIGHT_ON_4;
		SAD_CALCULATION_RIGHT_ON_4: if (enable) state <= SAD_CALCULATION_RIGHT_ON_5;
		SAD_CALCULATION_RIGHT_ON_5: if (enable) state <= SAD_CALCULATION_RIGHT_ON_6;
		SAD_CALCULATION_RIGHT_ON_6: if (enable) state <= SAD_CALCULATION_RIGHT_ON_7;
		SAD_CALCULATION_RIGHT_ON_7: if (enable) state <= LOAD_NEW_INPUTS_3;
		LOAD_NEW_INPUTS_3: if (enable)  state <= SAD_CALCULATION_RIGHT_ON_9;
		SAD_CALCULATION_RIGHT_ON_9: if (enable) state <= SAD_CALCULATION_RIGHT_ON_10;
		SAD_CALCULATION_RIGHT_ON_10: if (enable) state <= SAD_CALCULATION_RIGHT_ON_11;
		SAD_CALCULATION_RIGHT_ON_11: if (enable) state <= SAD_CALCULATION_RIGHT_ON_12;
		SAD_CALCULATION_RIGHT_ON_12: if (enable) state <= SAD_CALCULATION_RIGHT_ON_13;
		SAD_CALCULATION_RIGHT_ON_13: if (enable) state <= SAD_CALCULATION_RIGHT_ON_14;
		SAD_CALCULATION_RIGHT_ON_14: if (enable) state <= SAD_CALCULATION_RIGHT_ON_15;
		SAD_CALCULATION_RIGHT_ON_15: if (enable) state <= SAD_CALCULATION_RIGHT_ON_16;
		SAD_CALCULATION_RIGHT_ON_16: if (enable) state <= LOAD_NEW_INPUTS_4;
		LOAD_NEW_INPUTS_4: if (enable)  state <= SAD_CALCULATION_RIGHT_ON_18;
		SAD_CALCULATION_RIGHT_ON_18: if (enable) state <= SAD_CALCULATION_RIGHT_ON_19;
		SAD_CALCULATION_RIGHT_ON_19: if (enable) state <= SAD_CALCULATION_RIGHT_ON_20;
		SAD_CALCULATION_RIGHT_ON_20: if (enable) state <= SAD_CALCULATION_RIGHT_ON_21;
		SAD_CALCULATION_RIGHT_ON_21: if (enable) state <= SAD_CALCULATION_RIGHT_ON_22;
		SAD_CALCULATION_RIGHT_ON_22: if (enable) state <= SAD_CALCULATION_RIGHT_ON_23;
		SAD_CALCULATION_RIGHT_ON_23: if (enable) state <= SAD_CALCULATION_RIGHT_ON_24;
		SAD_CALCULATION_RIGHT_ON_24: if (enable) state <= SAD_CALCULATION_RIGHT_ON_25;
		SAD_CALCULATION_RIGHT_ON_25: if (enable) state <= LAST_PART_0;
		LAST_PART_0: state <= LAST_PART_1;
		LAST_PART_1: state <= LAST_PART_2;
		LAST_PART_2 : state <= LOAD_NEW_INPUTS;
	endcase
end


endmodule












