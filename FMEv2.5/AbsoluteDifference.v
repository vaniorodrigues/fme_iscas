module AbsoluteDifference(
	original_0,
	original_1,
	original_2,
	original_3,
	original_4,
	original_5,
	original_6,
	original_7,
	candidate_0,
	candidate_1,
	candidate_2,
	candidate_3,
	candidate_4,
	candidate_5,
	candidate_6,
	candidate_7,
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

input [DATAWIDTH-1:0] original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,candidate_0,candidate_1,candidate_2,candidate_3,candidate_4,candidate_5,candidate_6,candidate_7;
output [DATAWIDTH-1:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7;

//----------------------  AbsoluteDifference  ----------------------\\

AbsoluteDifference_cell #(DATAWIDTH) AbsoluteDifference_cell_0 (original_0,candidate_0,out_0);
AbsoluteDifference_cell #(DATAWIDTH) AbsoluteDifference_cell_1 (original_1,candidate_1,out_1);
AbsoluteDifference_cell #(DATAWIDTH) AbsoluteDifference_cell_2 (original_2,candidate_2,out_2);
AbsoluteDifference_cell #(DATAWIDTH) AbsoluteDifference_cell_3 (original_3,candidate_3,out_3);
AbsoluteDifference_cell #(DATAWIDTH) AbsoluteDifference_cell_4 (original_4,candidate_4,out_4);
AbsoluteDifference_cell #(DATAWIDTH) AbsoluteDifference_cell_5 (original_5,candidate_5,out_5);
AbsoluteDifference_cell #(DATAWIDTH) AbsoluteDifference_cell_6 (original_6,candidate_6,out_6);
AbsoluteDifference_cell #(DATAWIDTH) AbsoluteDifference_cell_7 (original_7,candidate_7,out_7);

endmodule
