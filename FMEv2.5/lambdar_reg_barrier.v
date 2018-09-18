module lambdar_reg_barrier(
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
	out_11
	);

	parameter DATAWIDTH = 8;
	
	input clock, reset,enable;
	input [DATAWIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7,in_8,in_9,in_10,in_11;
	output [DATAWIDTH-1:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_8,out_9,out_10,out_11;

	register #(DATAWIDTH) reg_0(clock,reset,enable,in_0,out_0);
	register #(DATAWIDTH) reg_1(clock,reset,enable,in_1,out_1);
	register #(DATAWIDTH) reg_2(clock,reset,enable,in_2,out_2);
	register #(DATAWIDTH) reg_3(clock,reset,enable,in_3,out_3);
	register #(DATAWIDTH) reg_4(clock,reset,enable,in_4,out_4);
	register #(DATAWIDTH) reg_5(clock,reset,enable,in_5,out_5);
	register #(DATAWIDTH) reg_6(clock,reset,enable,in_6,out_6);
	register #(DATAWIDTH) reg_7(clock,reset,enable,in_7,out_7);
	register #(DATAWIDTH) reg_8(clock,reset,enable,in_8,out_8);
	register #(DATAWIDTH) reg_9(clock,reset,enable,in_9,out_9);
	register #(DATAWIDTH) reg_10(clock,reset,enable,in_10,out_10);
	register #(DATAWIDTH) reg_11(clock,reset,enable,in_11,out_11);

endmodule
