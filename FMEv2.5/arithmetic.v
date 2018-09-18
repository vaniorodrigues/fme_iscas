module arithmetic(
	A0,
	A1,
	A2,
	A3,
	A4,
	A5,
	A6,
	A7,
	A8,
	A9,
	A10,
	A11,
	A12,
	A13,
	A14,
	A15,
	a3,
	a4,
	a5,
	a6,
	a7,
	a8,
	a9,
	a10,
	a11,
	b3,
	b4,
	b5,
	b6,
	b7,
	b8,
	b9,
	b10,
	b11,
	c3,
	c4,
	c5,
	c6,
	c7,
	c8,
	c9,
	c10,
	c11
	);

	parameter DATAWIDTH = 8;

	// Port mode declarations:

	input signed [DATAWIDTH+1:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15; 
	output signed [DATAWIDTH+1:0] a3, a4, a5, a6, a7, a8, a9, a10, a11, c3, c4, c5, c6, c7, c8, c9, c10, c11; // Q-filter
	output signed [DATAWIDTH+2:0] b3, b4, b5, b6, b7, b8, b9, b10, b11; // H-fitrer
	 

	wire signed [DATAWIDTH+10:0]
	A0_,A1_,A1_4,
	A2_,A2_4,A2_5,A2_10,A2_11,
	A3_,A3_4,A3_5,A3_10,A3_11,A3_17,A3_40,A3_58,
	A4_,A4_4,A4_5,A4_10,A4_11,A4_17,A4_40,A4_58,
	A5_,A5_4,A5_5,A5_10,A5_11,A5_17,A5_40,A5_58,
	A6_,A6_4,A6_5,A6_10,A6_11,A6_17,A6_40,A6_58,
	A7_,A7_4,A7_5,A7_10,A7_11,A7_17,A7_40,A7_58,
	A8_,A8_4,A8_5,A8_10,A8_11,A8_17,A8_40,A8_58,
	A9_,A9_4,A9_5,A9_10,A9_11,A9_17,A9_40,A9_58,
	A10_,A10_4,A10_5,A10_10,A10_11,A10_17,A10_40,A10_58,
	A11_,A11_4,A11_5,A11_10,A11_11,A11_17,A11_40,A11_58,
	A12_,A12_4,A12_5,A12_10,A12_11,A12_17,A12_40,A12_58,
	A13_,A13_4,A13_5,A13_10,A13_11,
	A14_,A14_4,A15_,
	p_a3, p_a4, p_a5, p_a6, p_a7, p_a8, p_a9, p_a10, p_a11, p_b3, p_b4, p_b5, p_b6, p_b7, p_b8, p_b9, p_b10, p_b11, p_c3, p_c4, p_c5, p_c6, p_c7, p_c8, p_c9, p_c10, p_c11;

	// Spiral Multiplier Generator:

	datapath1 #(DATAWIDTH) dp1_0(A0,A0_);
	datapath2 #(DATAWIDTH) dp2_0(A1,A1_,A1_4);
	datapath5 #(DATAWIDTH) dp5_0(A2,A2_,A2_4,A2_5,A2_10,A2_11);

	datapath8 #(DATAWIDTH) dp8_0(A3,A3_,A3_4,A3_5,A3_10,A3_11,A3_17,A3_40,A3_58);
	datapath8 #(DATAWIDTH) dp8_1(A4,A4_,A4_4,A4_5,A4_10,A4_11,A4_17,A4_40,A4_58);
	datapath8 #(DATAWIDTH) dp8_2(A5,A5_,A5_4,A5_5,A5_10,A5_11,A5_17,A5_40,A5_58);
	datapath8 #(DATAWIDTH) dp8_3(A6,A6_,A6_4,A6_5,A6_10,A6_11,A6_17,A6_40,A6_58);
	datapath8 #(DATAWIDTH) dp8_4(A7,A7_,A7_4,A7_5,A7_10,A7_11,A7_17,A7_40,A7_58);
	datapath8 #(DATAWIDTH) dp8_5(A8,A8_,A8_4,A8_5,A8_10,A8_11,A8_17,A8_40,A8_58);
	datapath8 #(DATAWIDTH) dp8_6(A9,A9_,A9_4,A9_5,A9_10,A9_11,A9_17,A9_40,A9_58);
	datapath8 #(DATAWIDTH) dp8_7(A10,A10_,A10_4,A10_5,A10_10,A10_11,A10_17,A10_40,A10_58);
	datapath8 #(DATAWIDTH) dp8_8(A11,A11_,A11_4,A11_5,A11_10,A11_11,A11_17,A11_40,A11_58);
	datapath8 #(DATAWIDTH) dp8_9(A12,A12_,A12_4,A12_5,A12_10,A12_11,A12_17,A12_40,A12_58);

	datapath5 #(DATAWIDTH) dp5_1(A13,A13_,A13_4,A13_5,A13_10,A13_11);
	datapath2 #(DATAWIDTH) dp2_1(A14,A14_,A14_4);
	datapath1 #(DATAWIDTH) dp1_1(A15,A15_);


	// Adders:

	assign p_a3 = A0_ + A1_4 + A2_10 + A3_58 + A4_17 + A5_5 + A6; // Tentar colocar os delocadores aqui, depois de estar funcionando
	assign p_a4 = A1_ + A2_4 + A3_10 + A4_58 + A5_17 + A6_5 + A7;
	assign p_a5 = A2_ + A3_4 + A4_10 + A5_58 + A6_17 + A7_5 + A8;
	assign p_a6 = A3_ + A4_4 + A5_10 + A6_58 + A7_17 + A8_5 + A9;
	assign p_a7 = A4_ + A5_4 + A6_10 + A7_58 + A8_17 + A9_5 + A10;
	assign p_a8 = A5_ + A6_4 + A7_10 + A8_58 + A9_17 + A10_5 + A11;
	assign p_a9 = A6_ + A7_4 + A8_10 + A9_58 + A10_17 + A11_5 + A12;
	assign p_a10 = A7_ + A8_4 + A9_10 + A10_58 + A11_17 + A12_5 + A13;
	assign p_a11 = A8_ + A9_4 + A10_10 + A11_58 + A12_17 + A13_5 + A14;

	assign p_b3 = A0_ + A1_4 + A2_11 + A3_40 + A4_40 + A5_11 + A6_4 + A7_;
	assign p_b4 = A1_ + A2_4 + A3_11 + A4_40 + A5_40 + A6_11 + A7_4 + A8_;
	assign p_b5 = A2_ + A3_4 + A4_11 + A5_40 + A6_40 + A7_11 + A8_4 + A9_;
	assign p_b6 = A3_ + A4_4 + A5_11 + A6_40 + A7_40 + A8_11 + A9_4 + A10_;
	assign p_b7 = A4_ + A5_4 + A6_11 + A7_40 + A8_40 + A9_11 + A10_4 + A11_;
	assign p_b8 = A5_ + A6_4 + A7_11 + A8_40 + A9_40 + A10_11 + A11_4 + A12_;
	assign p_b9 = A6_ + A7_4 + A8_11 + A9_40 + A10_40 + A11_11 + A12_4 + A13_;
	assign p_b10 = A7_ + A8_4 + A9_11 + A10_40 + A11_40 + A12_11 + A13_4 + A14_;
	assign p_b11 = A8_ + A9_4 + A10_11 + A11_40 + A12_40 + A13_11 + A14_4 + A15_;

	assign p_c3 = A1 + A2_5 + A3_17 + A4_58 + A5_10 + A6_4 + A7_;
	assign p_c4 = A2 + A3_5 + A4_17 + A5_58 + A6_10 + A7_4 + A8_;
	assign p_c5 = A3 + A4_5 + A5_17 + A6_58 + A7_10 + A8_4 + A9_;
	assign p_c6 = A4 + A5_5 + A6_17 + A7_58 + A8_10 + A9_4 + A10_;
	assign p_c7 = A5 + A6_5 + A7_17 + A8_58 + A9_10 + A10_4 + A11_;
	assign p_c8 = A6 + A7_5 + A8_17 + A9_58 + A10_10 + A11_4 + A12_;
	assign p_c9 = A7 + A8_5 + A9_17 + A10_58 + A11_10 + A12_4 + A13_;
	assign p_c10 = A8 + A9_5 + A10_17 + A11_58 + A12_10 + A13_4 + A14_;
	assign p_c11 = A9 + A10_5 + A11_17 + A12_58 + A13_10 + A14_4 + A15_;


	// Outputs

	assign a3 = p_a3 >> 6;
	assign a4 = p_a4 >> 6;
	assign a5 = p_a5 >> 6;
	assign a6 = p_a6 >> 6;
	assign a7 = p_a7 >> 6;
	assign a8 = p_a8 >> 6;
	assign a9 = p_a9 >> 6;
	assign a10 = p_a10 >> 6;
	assign a11 = p_a11 >> 6;
	assign b3 = p_b3 >> 6;
	assign b4 = p_b4 >> 6;
	assign b5 = p_b5 >> 6;
	assign b6 = p_b6 >> 6;
	assign b7 = p_b7 >> 6;
	assign b8 = p_b8 >> 6;
	assign b9 = p_b9 >> 6;
	assign b10 = p_b10 >> 6;
	assign b11 = p_b11 >> 6;
	assign c3 = p_c3 >> 6;
	assign c4 = p_c4 >> 6;
	assign c5 = p_c5 >> 6;
	assign c6 = p_c6 >> 6;
	assign c7 = p_c7 >> 6;
	assign c8 = p_c8 >> 6;
	assign c9 = p_c9 >> 6;
	assign c10 = p_c10 >> 6;
	assign c11 = p_c11 >> 6;

endmodule