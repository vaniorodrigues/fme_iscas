module residual(
	clock,
	reset,
	enable, // not direction_tb_original
	original_0,
	original_1,
	original_2,
	original_3,
	original_4,
	original_5,
	original_6,
	original_7,
	best_candidate_0,
	best_candidate_1,
	best_candidate_2,
	best_candidate_3,
	best_candidate_4,
	best_candidate_5,
	best_candidate_6,
	best_candidate_7,
	out_0,
	out_1,
	out_2,
	out_3,
	out_4,
	out_5,
	out_6,
	out_7
	);

//--------------------------------- Parameters -----------------------------//

parameter DATAWIDTH = 8;

//--------------------------------- Input & Output Ports -----------------------------//

input clock, reset, enable;

input [DATAWIDTH-1:0] original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,best_candidate_0,best_candidate_1,best_candidate_2,best_candidate_3,best_candidate_4,best_candidate_5,best_candidate_6,best_candidate_7;

output signed [DATAWIDTH:0] out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7;

//--------------------------------- Internal Wires  -----------------------------//

wire [DATAWIDTH-1:0] roriginal_0,roriginal_1,roriginal_2,roriginal_3,roriginal_4,roriginal_5,roriginal_6,roriginal_7,rbest_0,rbest_1,rbest_2,rbest_3,rbest_4,rbest_5,rbest_6,rbest_7;

wire signed [DATAWIDTH:0] residual_0,residual_1,residual_2,residual_3,residual_4,residual_5,residual_6,residual_7;

reg enable_out; // Enable with a cycle of delay

//--------------------------------- Residual -----------------------------//

reg_barrier #(DATAWIDTH) reg_barrier_original (clock,reset,enable,original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,roriginal_0,roriginal_1,roriginal_2,roriginal_3,roriginal_4,roriginal_5,roriginal_6,roriginal_7);

reg_barrier #(DATAWIDTH) reg_barrier_best (clock,reset,enable,best_candidate_0,best_candidate_1,best_candidate_2,best_candidate_3,best_candidate_4,best_candidate_5,best_candidate_6,best_candidate_7,rbest_0,rbest_1,rbest_2,rbest_3,rbest_4,rbest_5,rbest_6,rbest_7);

assign residual_0 = roriginal_0 - rbest_0;
assign residual_1 = roriginal_1 - rbest_1;
assign residual_2 = roriginal_2 - rbest_2;
assign residual_3 = roriginal_3 - rbest_3;
assign residual_4 = roriginal_4 - rbest_4;
assign residual_5 = roriginal_5 - rbest_5;
assign residual_6 = roriginal_6 - rbest_6;
assign residual_7 = roriginal_7 - rbest_7;

reg_barrier #(DATAWIDTH+1) reg_barrier_residual (clock,reset,enable_out,residual_0,residual_1,residual_2,residual_3,residual_4,residual_5,residual_6,residual_7,out_0,out_1,out_2,out_3,out_4,out_5,out_6,out_7);

always @ (posedge clock or posedge reset)
	if (reset) begin
 		enable_out <= 1'b0;
	end else if (enable) begin
  		enable_out <= enable;
	end else begin
		enable_out <= 1'b0;
	end
endmodule