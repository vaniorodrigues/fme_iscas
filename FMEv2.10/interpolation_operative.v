/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-19 18:16:57
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-04-04 14:41:50
*/
module interpolation_operative(
	clock, 
	reset,
	enable,
	enable_reg_int,
	enable_SR_integer,
	enable_SR_horizontal,
	enable_read_integer,
	enable_read_horizontal, //direction_PH,
	mux_c0,
	mux_c1,
	enable_clip,
	clip_pvso,
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
	PH_INTERPOLATION_finished,
	PVPO_INTERPOLATION_finished,
	PVSO_INTERPOLATION_finished,
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

input clock, reset, enable, enable_reg_int, enable_SR_integer, enable_read_integer, enable_SR_horizontal, enable_read_horizontal, mux_c0, mux_c1, enable_clip,clip_pvso;
input [DATAWIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15;

//--------------------------------- Output ports -----------------------------//

output reg PH_INTERPOLATION_finished, PVPO_INTERPOLATION_finished, PVSO_INTERPOLATION_finished;
output [DATAWIDTH-1:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_8,out_9,out_10,out_11,out_12,out_13,out_14,out_15,out_16,out_17,out_18,out_19,out_20,out_21,out_22,out_23,out_24,out_25,out_26;

//--------------------------------- Internal Wires -----------------------------//

wire [DATAWIDTH-1:0] out_reg_barrier_0,out_reg_barrier_1,out_reg_barrier_2,out_reg_barrier_3,out_reg_barrier_4,out_reg_barrier_5,out_reg_barrier_6,out_reg_barrier_7,out_reg_barrier_8,out_reg_barrier_9,out_reg_barrier_10,out_reg_barrier_11,out_reg_barrier_12,out_reg_barrier_13,out_reg_barrier_14,out_reg_barrier_15,out_TB_int_0,out_TB_int_1,out_TB_int_2,out_TB_int_3,out_TB_int_4,out_TB_int_5,out_TB_int_6,out_TB_int_7,out_TB_int_8,out_TB_int_9,out_TB_int_10,out_TB_int_11,out_TB_int_12,out_TB_int_13,out_TB_int_14,out_TB_int_15;
wire [DATAWIDTH+7:0] A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15, PH_0,PH_1,PH_2,PH_3,PH_4,PH_5,PH_6,PH_7,PH_8,PH_9,PH_10,PH_11,PH_12,PH_13,PH_14,PH_15; // outputs of mux 3x1, input artimetic
wire signed [DATAWIDTH+13:0] a3,a4,a5,a6,a7,a8,a9,a10,a11,c3,c4,c5,c6,c7,c8,c9,c10,c11;
wire signed [DATAWIDTH+14:0] b3,b4,b5,b6,b7,b8,b9,b10,b11;
wire [DATAWIDTH-1:0] out_clip_0, out_clip_1, out_clip_2, out_clip_3, out_clip_4, out_clip_5, out_clip_6, out_clip_7, out_clip_8, out_clip_9, out_clip_10, out_clip_11, out_clip_12, out_clip_13, out_clip_14, out_clip_15, out_clip_16, out_clip_17, out_clip_18, out_clip_19, out_clip_20, out_clip_21, out_clip_22, out_clip_23, out_clip_24, out_clip_25, out_clip_26;

reg [5:0] counter_operative;

//--------------------------------- Modules -----------------------------//

reg_int #(DATAWIDTH) reg_int_cell(clock,reset,enable_reg_int,in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15,out_reg_barrier_0,out_reg_barrier_1,out_reg_barrier_2,out_reg_barrier_3,out_reg_barrier_4,out_reg_barrier_5,out_reg_barrier_6,out_reg_barrier_7,out_reg_barrier_8,out_reg_barrier_9,out_reg_barrier_10,out_reg_barrier_11,out_reg_barrier_12,out_reg_barrier_13,out_reg_barrier_14,out_reg_barrier_15);

SR_integer #(DATAWIDTH) SR_integer_cell (clock,reset,enable_SR_integer,enable_read_integer,out_reg_barrier_4,out_reg_barrier_5,out_reg_barrier_6,out_reg_barrier_7,out_reg_barrier_8,out_reg_barrier_9,out_reg_barrier_10,out_reg_barrier_11,out_TB_int_0,out_TB_int_1,out_TB_int_2,out_TB_int_3,out_TB_int_4,out_TB_int_5,out_TB_int_6,out_TB_int_7,out_TB_int_8,out_TB_int_9,out_TB_int_10,out_TB_int_11,out_TB_int_12,out_TB_int_13,out_TB_int_14,out_TB_int_15);

SR_horizontal #(DATAWIDTH) SR_horizontal_cell (clock,reset,enable_SR_horizontal,enable_read_horizontal,a3[15:0],a4[15:0],a5[15:0],a6[15:0],a7[15:0],a8[15:0],a9[15:0],a10[15:0],a11[15:0],b3[15:0],b4[15:0],b5[15:0],b6[15:0],b7[15:0],b8[15:0],b9[15:0],b10[15:0],b11[15:0],c3[15:0],c4[15:0],c5[15:0],c6[15:0],c7[15:0],c8[15:0],c9[15:0],c10[15:0],c11[15:0],PH_0,PH_1,PH_2,PH_3,PH_4,PH_5,PH_6,PH_7,PH_8,PH_9,PH_10,PH_11,PH_12,PH_13,PH_14,PH_15);

mux3x1_48inputs #(DATAWIDTH+8) mux_cell (mux_c0,mux_c1,{8'b00, out_reg_barrier_0},{8'b00, out_reg_barrier_1},{8'b00, out_reg_barrier_2},{8'b00, out_reg_barrier_3},{8'b00, out_reg_barrier_4},{8'b00, out_reg_barrier_5},{8'b00, out_reg_barrier_6},{8'b00, out_reg_barrier_7},{8'b00, out_reg_barrier_8},{8'b00, out_reg_barrier_9},{8'b00, out_reg_barrier_10},{8'b00, out_reg_barrier_11},{8'b00, out_reg_barrier_12},{8'b00, out_reg_barrier_13},{8'b00, out_reg_barrier_14},{8'b00, out_reg_barrier_15}, {8'b00, out_TB_int_0},{8'b00, out_TB_int_1},{8'b00, out_TB_int_2},{8'b00, out_TB_int_3},{8'b00, out_TB_int_4},{8'b00, out_TB_int_5},{8'b00, out_TB_int_6},{8'b00, out_TB_int_7},{8'b00, out_TB_int_8},{8'b00, out_TB_int_9},{8'b00, out_TB_int_10},{8'b00, out_TB_int_11},{8'b00, out_TB_int_12},{8'b00, out_TB_int_13},{8'b00, out_TB_int_14},{8'b00, out_TB_int_15},PH_0,PH_1,PH_2,PH_3,PH_4,PH_5,PH_6,PH_7,PH_8,PH_9,PH_10,PH_11,PH_12,PH_13,PH_14,PH_15, A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15);

arithmetic #(DATAWIDTH) arithmetic_cell(A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,a3,a4,a5,a6,a7,a8,a9,a10,a11,b3,b4,b5,b6,b7,b8,b9,b10,b11,c3,c4,c5,c6,c7,c8,c9,c10,c11);

clipper #(DATAWIDTH) clipper_cell (clock,enable_clip,clip_pvso,a3,a4,a5,a6,a7,a8,a9,a10,a11,b3,b4,b5,b6,b7,b8,b9,b10,b11,c3,c4,c5,c6,c7,c8,c9,c10,c11,out_clip_0, out_clip_1, out_clip_2, out_clip_3, out_clip_4, out_clip_5, out_clip_6, out_clip_7, out_clip_8, out_clip_9, out_clip_10, out_clip_11, out_clip_12, out_clip_13, out_clip_14, out_clip_15, out_clip_16, out_clip_17, out_clip_18, out_clip_19, out_clip_20, out_clip_21, out_clip_22, out_clip_23, out_clip_24, out_clip_25, out_clip_26);

//--------------------------------- Outputs -----------------------------//

assign out_0  = out_clip_0;
assign out_1  = out_clip_1;
assign out_2  = out_clip_2;
assign out_3  = out_clip_3;
assign out_4  = out_clip_4;
assign out_5  = out_clip_5;
assign out_6  = out_clip_6;
assign out_7  = out_clip_7;
assign out_8  = out_clip_8;
assign out_9  = out_clip_9;
assign out_10 = out_clip_10;
assign out_11 = out_clip_11;
assign out_12 = out_clip_12;
assign out_13 = out_clip_13;
assign out_14 = out_clip_14;
assign out_15 = out_clip_15;
assign out_16 = out_clip_16;
assign out_17 = out_clip_17;
assign out_18 = out_clip_18;
assign out_19 = out_clip_19;
assign out_20 = out_clip_20;
assign out_21 = out_clip_21;
assign out_22 = out_clip_22;
assign out_23 = out_clip_23;
assign out_24 = out_clip_24;
assign out_25 = out_clip_25;
assign out_26 = out_clip_26;

//--------------------------------- Clock count -----------------------------//

always @ (posedge clock) begin
	if (reset) begin
	PH_INTERPOLATION_finished <= 0;
	PVPO_INTERPOLATION_finished <= 0;
	PVSO_INTERPOLATION_finished <= 0;
	counter_operative <= 6'b0;
	end
 	else if (enable) begin
 		counter_operative <= counter_operative + 1;
 		if (counter_operative == 15) begin
 			PH_INTERPOLATION_finished <= 1;
 			PVSO_INTERPOLATION_finished <= 0;
 		end
 		else if (counter_operative == 23) begin
 			PVPO_INTERPOLATION_finished  <= 1;
 		end
 		else if (counter_operative == 50) begin
 			PVSO_INTERPOLATION_finished <= 1;
 			PH_INTERPOLATION_finished <= 0;
			PVPO_INTERPOLATION_finished <= 0;
			counter_operative <= 6'b0;
 		end
 	end
end


endmodule