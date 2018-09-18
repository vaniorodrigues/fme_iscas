/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-24 10:52:48
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-03-24 20:07:56
*/
module SAD(
	clock,
	reset,
	enable_calculation,
	enable_out,
	sel,
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
	lambda_r,
	sad
	);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input clock, reset, enable_calculation, enable_out, sel;

input [DATAWIDTH-1:0] original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,candidate_0,candidate_1,candidate_2,candidate_3,candidate_4,candidate_5,candidate_6,candidate_7;

input [DATAWIDTH+7:0] lambda_r;

output reg [DATAWIDTH+8:0] sad;

//----------------------  Internal Wires  ----------------------\\

wire [DATAWIDTH-1:0] ad_0,ad_1,ad_2,ad_3,ad_4,ad_5,ad_6,ad_7;
wire [DATAWIDTH+2:0] aad;
wire [DATAWIDTH+8:0] pre_sad;


//----------------------  SAD  ----------------------\\

AbsoluteDifference #(DATAWIDTH) AbsoluteDifference0 (original_0,original_1,original_2,original_3,original_4,original_5,original_6,original_7,candidate_0,candidate_1,candidate_2,candidate_3,candidate_4,candidate_5,candidate_6,candidate_7,ad_0,ad_1,ad_2,ad_3,ad_4,ad_5,ad_6,ad_7);

Adder #(DATAWIDTH) Adder0 (ad_0,ad_1,ad_2,ad_3,ad_4,ad_5,ad_6,ad_7,aad);

Accumulator #(DATAWIDTH) Accumulator0(clock,reset,enable_calculation,sel,aad,lambda_r,pre_sad);

always @(posedge clock or posedge reset)
		if (reset)begin
			sad <= 0;
		end else if (enable_out) begin
			sad <= pre_sad; // So that the output is not changing after each sad interation, byt only at the end of the calculation.
		end




/* ----------------------  Obs  ----------------------

	SAD, upper case, stands for the block that calculates the sum of absolute difference,
the lower case one is the output of the SAD block, or better putted, the actual sum of absolute
difference.

*/

endmodule
