module interpolation(
	clock,
	reset,
	enable,
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
	out_0,
	out_1,
	out_2,
	out_3,
	out_4,
	out_5,
	out_6,
	out_7,
	out_8,
	out_9,
	out_10,
	out_11,
	out_12,
	out_13,
	out_14,
	out_15,
	out_16,
	out_17,
	out_18,
	out_19,
	out_20,
	out_21,
	out_22,
	out_23,
	out_24,
	out_25,
	out_26
	);


//--------------------------------- Parameters -----------------------------//

parameter DATAWIDTH = 8;

//--------------------------------- Input ports -----------------------------//

input clock, reset, enable;
input [DATAWIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15;

//--------------------------------- Output ports -----------------------------//

output [DATAWIDTH-1:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_8,out_9,out_10,out_11,out_12,out_13,out_14,out_15,out_16,out_17,out_18,out_19,out_20,out_21,out_22,out_23,out_24,out_25,out_26;

//--------------------------------- Internal Wires -----------------------------//

wire enable_reg_int, enable_TB_int, enable_TB_PH, direction_int, direction_PH, mux_c0, mux_c1, enable_clip, PH_INTERPOLATION_finished, PVPO_INTERPOLATION_finished, PVSO_INTERPOLATION_finished;

//--------------------------------- Interpolation -----------------------------//

interpolation_operative #(DATAWIDTH) interpolation_op (clock, reset,enable,enable_reg_int,enable_TB_int,enable_TB_PH,direction_int,direction_PH,mux_c0,mux_c1,enable_clip,in_0,in_1,in_2,in_3,in_4,in_5,in_6,in_7,in_8,in_9,in_10,in_11,in_12,in_13,in_14,in_15,PH_INTERPOLATION_finished,PVPO_INTERPOLATION_finished,PVSO_INTERPOLATION_finished,out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_8,out_9,out_10,out_11,out_12,out_13,out_14,out_15,out_16,out_17,out_18,out_19,out_20,out_21,out_22,out_23,out_24,out_25,out_26);

interpolation_control #(DATAWIDTH) interpolation_con(clock,reset,enable,PH_INTERPOLATION_finished,PVPO_INTERPOLATION_finished,PVSO_INTERPOLATION_finished,enable_reg_int,enable_TB_int,enable_TB_PH,direction_int,direction_PH,mux_c0,mux_c1,enable_clip);

endmodule