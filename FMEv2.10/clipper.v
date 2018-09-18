/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-24 10:52:48
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-04-02 15:05:53
*/
module clipper(
	clock,
	enable,
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
	in_16,
	in_17,
	in_18,
	in_19,
	in_20,
	in_21,
	in_22,
	in_23,
	in_24,
	in_25,
	in_26,
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

input clock, enable, clip_pvso;

input signed [DATAWIDTH+13:0] in_0,in_1,in_2,in_3,in_4,in_5,in_6,in_7,in_8,in_18,in_19,in_20,in_21,in_22,in_23,in_24,in_25,in_26;

input signed [DATAWIDTH+14:0] in_9,in_10,in_11,in_12,in_13,in_14,in_15,in_16,in_17;

//--------------------------------- Output ports -----------------------------//

output [DATAWIDTH-1:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_8,out_9,out_10,out_11,out_12,out_13,out_14,out_15,out_16,out_17,out_18,out_19,out_20,out_21,out_22,out_23,out_24,out_25,out_26;

//--------------------------------- Internal Wires -----------------------------//

wire signed [DATAWIDTH+7:0] sr_in_0,sr_in_1,sr_in_2,sr_in_3,sr_in_4,sr_in_5,sr_in_6,sr_in_7,sr_in_8,sr_in_18,sr_in_19,sr_in_20,sr_in_21,sr_in_22,sr_in_23,sr_in_24,sr_in_25,sr_in_26;

wire signed [DATAWIDTH+8:0] sr_in_9,sr_in_10,sr_in_11,sr_in_12,sr_in_13,sr_in_14,sr_in_15,sr_in_16,sr_in_17;

wire signed [DATAWIDTH+7:0] mux_0,mux_1,mux_2,mux_3,mux_4,mux_5,mux_6,mux_7,mux_8,mux_18,mux_19,mux_20,mux_21,mux_22,mux_23,mux_24,mux_25,mux_26;

wire signed [DATAWIDTH+8:0] mux_9,mux_10,mux_11,mux_12,mux_13,mux_14,mux_15,mux_16,mux_17;

wire signed [DATAWIDTH+1:0] clip_0,clip_1,clip_2,clip_3,clip_4,clip_5,clip_6,clip_7,clip_8,clip_18,clip_19,clip_20,clip_21,clip_22,clip_23,clip_24,clip_25,clip_26;

wire signed [DATAWIDTH+2:0] clip_9,clip_10,clip_11,clip_12,clip_13,clip_14,clip_15,clip_16,clip_17;

//--------------------------------- Clipper -----------------------------//

// Shift 6
assign sr_in_0 = in_0 >> 6;
assign sr_in_1 = in_1 >> 6;
assign sr_in_2 = in_2 >> 6;
assign sr_in_3 = in_3 >> 6;
assign sr_in_4 = in_4 >> 6;
assign sr_in_5 = in_5 >> 6;
assign sr_in_6 = in_6 >> 6;
assign sr_in_7 = in_7 >> 6;
assign sr_in_8 = in_8 >> 6;
assign sr_in_9 = in_9 >> 6;
assign sr_in_10 = in_10 >> 6;
assign sr_in_11 = in_11 >> 6;
assign sr_in_12 = in_12 >> 6;
assign sr_in_13 = in_13 >> 6;
assign sr_in_14 = in_14 >> 6;
assign sr_in_15 = in_15 >> 6;
assign sr_in_16 = in_16 >> 6;
assign sr_in_17 = in_17 >> 6;
assign sr_in_18 = in_18 >> 6;
assign sr_in_19 = in_19 >> 6;
assign sr_in_20 = in_20 >> 6;
assign sr_in_21 = in_21 >> 6;
assign sr_in_22 = in_22 >> 6;
assign sr_in_23 = in_23 >> 6;
assign sr_in_24 = in_24 >> 6;
assign sr_in_25 = in_25 >> 6;
assign sr_in_26 = in_26 >> 6;
 
// Mux
assign mux_0  = (clip_pvso) ? sr_in_0 : in_0[15:0];
assign mux_1  = (clip_pvso) ? sr_in_1 : in_1[15:0];
assign mux_2  = (clip_pvso) ? sr_in_2 : in_2[15:0];
assign mux_3  = (clip_pvso) ? sr_in_3 : in_3[15:0];
assign mux_4  = (clip_pvso) ? sr_in_4 : in_4[15:0];
assign mux_5  = (clip_pvso) ? sr_in_5 : in_5[15:0];
assign mux_6  = (clip_pvso) ? sr_in_6 : in_6[15:0];
assign mux_7  = (clip_pvso) ? sr_in_7 : in_7[15:0];
assign mux_8  = (clip_pvso) ? sr_in_8 : in_8[15:0];

assign mux_9  = (clip_pvso) ? sr_in_9  : in_9[16:0];
assign mux_10 = (clip_pvso) ? sr_in_10 : in_10[16:0];
assign mux_11 = (clip_pvso) ? sr_in_11 : in_11[16:0];
assign mux_12 = (clip_pvso) ? sr_in_12 : in_12[16:0];
assign mux_13 = (clip_pvso) ? sr_in_13 : in_13[16:0];
assign mux_14 = (clip_pvso) ? sr_in_14 : in_14[16:0];
assign mux_15 = (clip_pvso) ? sr_in_15 : in_15[16:0];
assign mux_16 = (clip_pvso) ? sr_in_16 : in_16[16:0];
assign mux_17 = (clip_pvso) ? sr_in_17 : in_17[16:0];

assign mux_18 = (clip_pvso) ? sr_in_18 : in_18[15:0];
assign mux_19 = (clip_pvso) ? sr_in_19 : in_19[15:0];
assign mux_20 = (clip_pvso) ? sr_in_20 : in_20[15:0];
assign mux_21 = (clip_pvso) ? sr_in_21 : in_21[15:0];
assign mux_22 = (clip_pvso) ? sr_in_22 : in_22[15:0];
assign mux_23 = (clip_pvso) ? sr_in_23 : in_23[15:0];
assign mux_24 = (clip_pvso) ? sr_in_24 : in_24[15:0];
assign mux_25 = (clip_pvso) ? sr_in_25 : in_25[15:0];
assign mux_26 = (clip_pvso) ? sr_in_26 : in_26[15:0];

// Plus one Shift

plus1shift #(DATAWIDTH+8) plus1_00(mux_0,clip_0);
plus1shift #(DATAWIDTH+8) plus1_01(mux_1,clip_1);
plus1shift #(DATAWIDTH+8) plus1_02(mux_2,clip_2);
plus1shift #(DATAWIDTH+8) plus1_03(mux_3,clip_3);
plus1shift #(DATAWIDTH+8) plus1_04(mux_4,clip_4);
plus1shift #(DATAWIDTH+8) plus1_05(mux_5,clip_5);
plus1shift #(DATAWIDTH+8) plus1_06(mux_6,clip_6);
plus1shift #(DATAWIDTH+8) plus1_07(mux_7,clip_7);
plus1shift #(DATAWIDTH+8) plus1_08(mux_8,clip_8);

plus1shift #(DATAWIDTH+9) plus1_09(mux_9, clip_9);
plus1shift #(DATAWIDTH+9) plus1_10(mux_10,clip_10);
plus1shift #(DATAWIDTH+9) plus1_11(mux_11,clip_11);
plus1shift #(DATAWIDTH+9) plus1_12(mux_12,clip_12);
plus1shift #(DATAWIDTH+9) plus1_13(mux_13,clip_13);
plus1shift #(DATAWIDTH+9) plus1_14(mux_14,clip_14);
plus1shift #(DATAWIDTH+9) plus1_15(mux_15,clip_15);
plus1shift #(DATAWIDTH+9) plus1_16(mux_16,clip_16);
plus1shift #(DATAWIDTH+9) plus1_17(mux_17,clip_17);

plus1shift #(DATAWIDTH+8) plus1_18(mux_18,clip_18);
plus1shift #(DATAWIDTH+8) plus1_19(mux_19,clip_19);
plus1shift #(DATAWIDTH+8) plus1_20(mux_20,clip_20);
plus1shift #(DATAWIDTH+8) plus1_21(mux_21,clip_21);
plus1shift #(DATAWIDTH+8) plus1_22(mux_22,clip_22);
plus1shift #(DATAWIDTH+8) plus1_23(mux_23,clip_23);
plus1shift #(DATAWIDTH+8) plus1_24(mux_24,clip_24);
plus1shift #(DATAWIDTH+8) plus1_25(mux_25,clip_25);
plus1shift #(DATAWIDTH+8) plus1_26(mux_26,clip_26);

// Clipping
clip10 #(DATAWIDTH) cell_00(clock,enable,clip_0,out_0);
clip10 #(DATAWIDTH) cell_01(clock,enable,clip_1,out_1);
clip10 #(DATAWIDTH) cell_02(clock,enable,clip_2,out_2);
clip10 #(DATAWIDTH) cell_03(clock,enable,clip_3,out_3);
clip10 #(DATAWIDTH) cell_04(clock,enable,clip_4,out_4);
clip10 #(DATAWIDTH) cell_05(clock,enable,clip_5,out_5);
clip10 #(DATAWIDTH) cell_06(clock,enable,clip_6,out_6);
clip10 #(DATAWIDTH) cell_07(clock,enable,clip_7,out_7);
clip10 #(DATAWIDTH) cell_08(clock,enable,clip_8,out_8);

clip11 #(DATAWIDTH) cell_09(clock,enable,clip_9,out_9);
clip11 #(DATAWIDTH) cell_10(clock,enable,clip_10,out_10);
clip11 #(DATAWIDTH) cell_11(clock,enable,clip_11,out_11);
clip11 #(DATAWIDTH) cell_12(clock,enable,clip_12,out_12);
clip11 #(DATAWIDTH) cell_13(clock,enable,clip_13,out_13);
clip11 #(DATAWIDTH) cell_14(clock,enable,clip_14,out_14);
clip11 #(DATAWIDTH) cell_15(clock,enable,clip_15,out_15);
clip11 #(DATAWIDTH) cell_16(clock,enable,clip_16,out_16);
clip11 #(DATAWIDTH) cell_17(clock,enable,clip_17,out_17);

clip10 #(DATAWIDTH) cell_18(clock,enable,clip_18,out_18);
clip10 #(DATAWIDTH) cell_19(clock,enable,clip_19,out_19);
clip10 #(DATAWIDTH) cell_20(clock,enable,clip_20,out_20);
clip10 #(DATAWIDTH) cell_21(clock,enable,clip_21,out_21);
clip10 #(DATAWIDTH) cell_22(clock,enable,clip_22,out_22);
clip10 #(DATAWIDTH) cell_23(clock,enable,clip_23,out_23);
clip10 #(DATAWIDTH) cell_24(clock,enable,clip_24,out_24);
clip10 #(DATAWIDTH) cell_25(clock,enable,clip_25,out_25);
clip10 #(DATAWIDTH) cell_26(clock,enable,clip_26,out_26);

endmodule
