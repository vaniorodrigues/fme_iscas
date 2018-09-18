module buffer_candidates(
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
	out_0,
	out_1,
	out_2,
	out_3,
	out_4,
	out_5,
	out_6,
	out_7,
	out_8
	);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input clock, reset, enable;

input [DATAWIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8;

output [DATAWIDTH-1:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8;

//----------------------  Internal Wires  ----------------------\\

wire [DATAWIDTH-1:0] out_of_0_0, out_of_0_1, out_of_0_2, out_of_0_3, out_of_0_4, out_of_0_5, out_of_0_6, out_of_0_7, out_of_0_8, out_of_1_0, out_of_1_1, out_of_1_2, out_of_1_3, out_of_1_4, out_of_1_5, out_of_1_6, out_of_1_7, out_of_1_8,  out_of_2_0, out_of_2_1, out_of_2_2, out_of_2_3, out_of_2_4, out_of_2_5, out_of_2_6, out_of_2_7, out_of_2_8, out_of_3_0, out_of_3_1, out_of_3_2, out_of_3_3, out_of_3_4, out_of_3_5, out_of_3_6, out_of_3_7, out_of_3_8,  out_of_4_0, out_of_4_1, out_of_4_2, out_of_4_3, out_of_4_4, out_of_4_5, out_of_4_6, out_of_4_7, out_of_4_8, out_of_5_0, out_of_5_1, out_of_5_2, out_of_5_3, out_of_5_4, out_of_5_5, out_of_5_6, out_of_5_7, out_of_5_8, out_of_6_0, out_of_6_1, out_of_6_2, out_of_6_3, out_of_6_4, out_of_6_5, out_of_6_6, out_of_6_7, out_of_6_8, out_of_7_0, out_of_7_1, out_of_7_2, out_of_7_3, out_of_7_4, out_of_7_5, out_of_7_6, out_of_7_7, out_of_7_8, out_of_8_0, out_of_8_1, out_of_8_2, out_of_8_3, out_of_8_4, out_of_8_5, out_of_8_6, out_of_8_7, out_of_8_8, out_of_0_9, out_of_1_9, out_of_2_9, out_of_3_9, out_of_4_9, out_of_5_9, out_of_6_9, out_of_7_9, out_of_8_9;

//----------------------  Buffer  ----------------------\\

register #(DATAWIDTH) cell_0_0(clock, reset, enable, in_0, out_of_0_0);
register #(DATAWIDTH) cell_1_0(clock, reset, enable, in_1, out_of_1_0);
register #(DATAWIDTH) cell_2_0(clock, reset, enable, in_2, out_of_2_0);
register #(DATAWIDTH) cell_3_0(clock, reset, enable, in_3, out_of_3_0);
register #(DATAWIDTH) cell_4_0(clock, reset, enable, in_4, out_of_4_0);
register #(DATAWIDTH) cell_5_0(clock, reset, enable, in_5, out_of_5_0);
register #(DATAWIDTH) cell_6_0(clock, reset, enable, in_6, out_of_6_0);
register #(DATAWIDTH) cell_7_0(clock, reset, enable, in_7, out_of_7_0);
register #(DATAWIDTH) cell_8_0(clock, reset, enable, in_8, out_of_8_0);

register #(DATAWIDTH) cell_0_1(clock, reset, enable,  out_of_0_0,   out_of_0_1);
register #(DATAWIDTH) cell_1_1(clock, reset, enable,  out_of_1_0,   out_of_1_1);
register #(DATAWIDTH) cell_2_1(clock, reset, enable,  out_of_2_0,   out_of_2_1);
register #(DATAWIDTH) cell_3_1(clock, reset, enable,  out_of_3_0,   out_of_3_1);
register #(DATAWIDTH) cell_4_1(clock, reset, enable,  out_of_4_0,   out_of_4_1);
register #(DATAWIDTH) cell_5_1(clock, reset, enable,  out_of_5_0,   out_of_5_1);
register #(DATAWIDTH) cell_6_1(clock, reset, enable,  out_of_6_0,   out_of_6_1);
register #(DATAWIDTH) cell_7_1(clock, reset, enable,  out_of_7_0,   out_of_7_1);
register #(DATAWIDTH) cell_8_1(clock, reset, enable,  out_of_8_0,   out_of_8_1);

register #(DATAWIDTH) cell_0_2(clock, reset, enable,   out_of_0_1,  out_of_0_2);
register #(DATAWIDTH) cell_1_2(clock, reset, enable,   out_of_1_1,  out_of_1_2);
register #(DATAWIDTH) cell_2_2(clock, reset, enable,   out_of_2_1,  out_of_2_2);
register #(DATAWIDTH) cell_3_2(clock, reset, enable,   out_of_3_1,  out_of_3_2);
register #(DATAWIDTH) cell_4_2(clock, reset, enable,   out_of_4_1,  out_of_4_2);
register #(DATAWIDTH) cell_5_2(clock, reset, enable,   out_of_5_1,  out_of_5_2);
register #(DATAWIDTH) cell_6_2(clock, reset, enable,   out_of_6_1,  out_of_6_2);
register #(DATAWIDTH) cell_7_2(clock, reset, enable,   out_of_7_1,  out_of_7_2);
register #(DATAWIDTH) cell_8_2(clock, reset, enable,   out_of_8_1,  out_of_8_2);

register #(DATAWIDTH) cell_0_3(clock, reset, enable,   out_of_0_2,  out_of_0_3);
register #(DATAWIDTH) cell_1_3(clock, reset, enable,   out_of_1_2,  out_of_1_3);
register #(DATAWIDTH) cell_2_3(clock, reset, enable,   out_of_2_2,  out_of_2_3);
register #(DATAWIDTH) cell_3_3(clock, reset, enable,   out_of_3_2,  out_of_3_3);
register #(DATAWIDTH) cell_4_3(clock, reset, enable,   out_of_4_2,  out_of_4_3);
register #(DATAWIDTH) cell_5_3(clock, reset, enable,   out_of_5_2,  out_of_5_3);
register #(DATAWIDTH) cell_6_3(clock, reset, enable,   out_of_6_2,  out_of_6_3);
register #(DATAWIDTH) cell_7_3(clock, reset, enable,   out_of_7_2,  out_of_7_3);
register #(DATAWIDTH) cell_8_3(clock, reset, enable,   out_of_8_2,  out_of_8_3);

register #(DATAWIDTH) cell_0_4(clock, reset, enable,   out_of_0_3,  out_of_0_4);
register #(DATAWIDTH) cell_1_4(clock, reset, enable,   out_of_1_3,  out_of_1_4);
register #(DATAWIDTH) cell_2_4(clock, reset, enable,   out_of_2_3,  out_of_2_4);
register #(DATAWIDTH) cell_3_4(clock, reset, enable,   out_of_3_3,  out_of_3_4);
register #(DATAWIDTH) cell_4_4(clock, reset, enable,   out_of_4_3,  out_of_4_4);
register #(DATAWIDTH) cell_5_4(clock, reset, enable,   out_of_5_3,  out_of_5_4);
register #(DATAWIDTH) cell_6_4(clock, reset, enable,   out_of_6_3,  out_of_6_4);
register #(DATAWIDTH) cell_7_4(clock, reset, enable,   out_of_7_3,  out_of_7_4);
register #(DATAWIDTH) cell_8_4(clock, reset, enable,   out_of_8_3,  out_of_8_4);

register #(DATAWIDTH) cell_0_5(clock, reset, enable,   out_of_0_4,  out_of_0_5);
register #(DATAWIDTH) cell_1_5(clock, reset, enable,   out_of_1_4,  out_of_1_5);
register #(DATAWIDTH) cell_2_5(clock, reset, enable,   out_of_2_4,  out_of_2_5);
register #(DATAWIDTH) cell_3_5(clock, reset, enable,   out_of_3_4,  out_of_3_5);
register #(DATAWIDTH) cell_4_5(clock, reset, enable,   out_of_4_4,  out_of_4_5);
register #(DATAWIDTH) cell_5_5(clock, reset, enable,   out_of_5_4,  out_of_5_5);
register #(DATAWIDTH) cell_6_5(clock, reset, enable,   out_of_6_4,  out_of_6_5);
register #(DATAWIDTH) cell_7_5(clock, reset, enable,   out_of_7_4,  out_of_7_5);
register #(DATAWIDTH) cell_8_5(clock, reset, enable,   out_of_8_4,  out_of_8_5);

register #(DATAWIDTH) cell_0_6(clock, reset, enable,   out_of_0_5,  out_of_0_6);
register #(DATAWIDTH) cell_1_6(clock, reset, enable,   out_of_1_5,  out_of_1_6);
register #(DATAWIDTH) cell_2_6(clock, reset, enable,   out_of_2_5,  out_of_2_6);
register #(DATAWIDTH) cell_3_6(clock, reset, enable,   out_of_3_5,  out_of_3_6);
register #(DATAWIDTH) cell_4_6(clock, reset, enable,   out_of_4_5,  out_of_4_6);
register #(DATAWIDTH) cell_5_6(clock, reset, enable,   out_of_5_5,  out_of_5_6);
register #(DATAWIDTH) cell_6_6(clock, reset, enable,   out_of_6_5,  out_of_6_6);
register #(DATAWIDTH) cell_7_6(clock, reset, enable,   out_of_7_5,  out_of_7_6);
register #(DATAWIDTH) cell_8_6(clock, reset, enable,   out_of_8_5,  out_of_8_6);

register #(DATAWIDTH) cell_0_7(clock, reset, enable,   out_of_0_6,  out_of_0_7);
register #(DATAWIDTH) cell_1_7(clock, reset, enable,   out_of_1_6,  out_of_1_7);
register #(DATAWIDTH) cell_2_7(clock, reset, enable,   out_of_2_6,  out_of_2_7);
register #(DATAWIDTH) cell_3_7(clock, reset, enable,   out_of_3_6,  out_of_3_7);
register #(DATAWIDTH) cell_4_7(clock, reset, enable,   out_of_4_6,  out_of_4_7);
register #(DATAWIDTH) cell_5_7(clock, reset, enable,   out_of_5_6,  out_of_5_7);
register #(DATAWIDTH) cell_6_7(clock, reset, enable,   out_of_6_6,  out_of_6_7);
register #(DATAWIDTH) cell_7_7(clock, reset, enable,   out_of_7_6,  out_of_7_7);
register #(DATAWIDTH) cell_8_7(clock, reset, enable,   out_of_8_6,  out_of_8_7);

register #(DATAWIDTH) cell_0_8(clock, reset, enable,   out_of_0_7,  out_of_0_8);
register #(DATAWIDTH) cell_1_8(clock, reset, enable,   out_of_1_7,  out_of_1_8);
register #(DATAWIDTH) cell_2_8(clock, reset, enable,   out_of_2_7,  out_of_2_8);
register #(DATAWIDTH) cell_3_8(clock, reset, enable,   out_of_3_7,  out_of_3_8);
register #(DATAWIDTH) cell_4_8(clock, reset, enable,   out_of_4_7,  out_of_4_8);
register #(DATAWIDTH) cell_5_8(clock, reset, enable,   out_of_5_7,  out_of_5_8);
register #(DATAWIDTH) cell_6_8(clock, reset, enable,   out_of_6_7,  out_of_6_8);
register #(DATAWIDTH) cell_7_8(clock, reset, enable,   out_of_7_7,  out_of_7_8);
register #(DATAWIDTH) cell_8_8(clock, reset, enable,   out_of_8_7,  out_of_8_8);

register #(DATAWIDTH) cell_0_9(clock, reset, enable,   out_of_0_8,  out_of_0_9);
register #(DATAWIDTH) cell_1_9(clock, reset, enable,   out_of_1_8,  out_of_1_9);
register #(DATAWIDTH) cell_2_9(clock, reset, enable,   out_of_2_8,  out_of_2_9);
register #(DATAWIDTH) cell_3_9(clock, reset, enable,   out_of_3_8,  out_of_3_9);
register #(DATAWIDTH) cell_4_9(clock, reset, enable,   out_of_4_8,  out_of_4_9);
register #(DATAWIDTH) cell_5_9(clock, reset, enable,   out_of_5_8,  out_of_5_9);
register #(DATAWIDTH) cell_6_9(clock, reset, enable,   out_of_6_8,  out_of_6_9);
register #(DATAWIDTH) cell_7_9(clock, reset, enable,   out_of_7_8,  out_of_7_9);
register #(DATAWIDTH) cell_8_9(clock, reset, enable,   out_of_8_8,  out_of_8_9);

assign out_0 = out_of_0_9;
assign out_1 = out_of_1_9;
assign out_2 = out_of_2_9;
assign out_3 = out_of_3_9;
assign out_4 = out_of_4_9;
assign out_5 = out_of_5_9;
assign out_6 = out_of_6_9;
assign out_7 = out_of_7_9;
assign out_8 = out_of_8_9;

endmodule
