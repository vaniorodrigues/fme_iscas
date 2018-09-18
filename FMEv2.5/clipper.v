module clipper(
	clock,
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

parameter DATAWIDTH = 8;

input clock, enable;
input signed [DATAWIDTH+1:0] in_0,in_1,in_2,in_3,in_4,in_5,in_6,in_7,in_8,in_18,in_19,in_20,in_21,in_22,in_23,in_24,in_25,in_26;
input signed [DATAWIDTH+2:0] in_9,in_10,in_11,in_12,in_13,in_14,in_15,in_16,in_17;

output [DATAWIDTH-1:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_8,out_9,out_10,out_11,out_12,out_13,out_14,out_15,out_16,out_17,out_18,out_19,out_20,out_21,out_22,out_23,out_24,out_25,out_26;

clip10 #(DATAWIDTH) cell_00(clock,enable,in_0,out_0);
clip10 #(DATAWIDTH) cell_01(clock,enable,in_1,out_1);
clip10 #(DATAWIDTH) cell_02(clock,enable,in_2,out_2);
clip10 #(DATAWIDTH) cell_03(clock,enable,in_3,out_3);
clip10 #(DATAWIDTH) cell_04(clock,enable,in_4,out_4);
clip10 #(DATAWIDTH) cell_05(clock,enable,in_5,out_5);
clip10 #(DATAWIDTH) cell_06(clock,enable,in_6,out_6);
clip10 #(DATAWIDTH) cell_07(clock,enable,in_7,out_7);
clip10 #(DATAWIDTH) cell_08(clock,enable,in_8,out_8);

clip11 #(DATAWIDTH) cell_09(clock,enable,in_9,out_9);
clip11 #(DATAWIDTH) cell_10(clock,enable,in_10,out_10);
clip11 #(DATAWIDTH) cell_11(clock,enable,in_11,out_11);
clip11 #(DATAWIDTH) cell_12(clock,enable,in_12,out_12);
clip11 #(DATAWIDTH) cell_13(clock,enable,in_13,out_13);
clip11 #(DATAWIDTH) cell_14(clock,enable,in_14,out_14);
clip11 #(DATAWIDTH) cell_15(clock,enable,in_15,out_15);
clip11 #(DATAWIDTH) cell_16(clock,enable,in_16,out_16);
clip11 #(DATAWIDTH) cell_17(clock,enable,in_17,out_17);

clip10 #(DATAWIDTH) cell_18(clock,enable,in_18,out_18);
clip10 #(DATAWIDTH) cell_19(clock,enable,in_19,out_19);
clip10 #(DATAWIDTH) cell_20(clock,enable,in_20,out_20);
clip10 #(DATAWIDTH) cell_21(clock,enable,in_21,out_21);
clip10 #(DATAWIDTH) cell_22(clock,enable,in_22,out_22);
clip10 #(DATAWIDTH) cell_23(clock,enable,in_23,out_23);
clip10 #(DATAWIDTH) cell_24(clock,enable,in_24,out_24);
clip10 #(DATAWIDTH) cell_25(clock,enable,in_25,out_25);
clip10 #(DATAWIDTH) cell_26(clock,enable,in_26,out_26);

endmodule
