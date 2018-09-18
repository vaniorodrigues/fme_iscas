module finder(
	clock,
	reset,
	enable,
	enable_out,
	left_or_right,
	best_sad_ime,
	sad_0,
	sad_1,
	sad_2,
	sad_3,
	sad_4,
	sad_5,
	sad_6,
	sad_7,
	sad_8,
	sad_9,
	sad_10,
	sad_11,
	address_best_of_6,
	msb_lr,
	best_sad,
	address_best_sad
	);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input clock, reset, enable, left_or_right,enable_out;

input [DATAWIDTH+8:0] sad_0,sad_1,sad_2,sad_3,sad_4,sad_5,sad_6,sad_7,sad_8,sad_9,sad_10,sad_11;

input [DATAWIDTH+8:0] best_sad_ime;

output msb_lr;

output [2:0] address_best_of_6;

output [5:0] address_best_sad;

output [DATAWIDTH+8:0] best_sad;

//----------------------  Internal Wires  ----------------------\\

wire msb_01,msb_23,msb_45,msb_01_23,msb_best_sad_cicle;

wire [5:0] address_new_best_sad, address_best_sad_cicle;

wire [DATAWIDTH+8:0] sad0,sad1,sad2,sad3,sad4,sad5,best_sad_01,best_sad_23,best_sad_45,best_sad_01_23,best_sad_cicle,best_sad_lr,new_best_sad;

reg [5:0] counter, interaction, address_last_best_sad;

reg [DATAWIDTH+8:0] last_best_sad;

//----------------------  Finder  ----------------------\\

// Select the input muxs

assign sad0 = (left_or_right) ? sad_6 : sad_0;

assign sad1 = (left_or_right) ? sad_7 : sad_1;

assign sad2 = (left_or_right) ? sad_8 : sad_2;

assign sad3 = (left_or_right) ? sad_9 : sad_3;

assign sad4 = (left_or_right) ? sad_10 : sad_4;

assign sad5 = (left_or_right) ? sad_11 : sad_5;

// Last Best SAD

always @ (posedge clock or posedge reset)
	if (reset) begin
 	last_best_sad <= best_sad_ime;
 	address_last_best_sad <= 6'b111111;
	end else if (enable) begin
  	last_best_sad <= new_best_sad;
 	address_last_best_sad <= address_new_best_sad;
	end 

//--- Difference ---\\

// Round 1
difference_finder #(DATAWIDTH) df_01 (sad0,sad1,best_sad_01,msb_01);
difference_finder #(DATAWIDTH) df_23 (sad2,sad3,best_sad_23,msb_23);
difference_finder #(DATAWIDTH) df_45 (sad4,sad5,best_sad_45,msb_45);

// Round 2
difference_finder #(DATAWIDTH) df_01_23 (best_sad_01,best_sad_23,best_sad_01_23,msb_01_23);

// Round 3
difference_finder #(DATAWIDTH) df_0123_45 (best_sad_01_23,best_sad_45,best_sad_cicle,msb_best_sad_cicle);

// Last Round
difference_finder #(DATAWIDTH) df_last_round (last_best_sad,best_sad_cicle,best_sad_lr,msb_lr);

assign new_best_sad  = best_sad_lr; 

//--- Address ---\\

always @(posedge clock or posedge reset)
if (reset) begin
  counter <= 6'b0;
  interaction <= 0;
end else if (enable) begin
  counter <= counter + 1;
  if (counter == 7) begin
  	interaction <= interaction +1; // every 8 cycles, interaction += interaction
  	counter <= 6'b0;
  end
end

address_finder af (msb_01,msb_23,msb_45,msb_01_23,msb_best_sad_cicle,address_best_of_6);

assign address_best_sad_cicle = (left_or_right) ? address_best_of_6 +6 : address_best_of_6;

assign address_new_best_sad = (msb_lr) ? (address_best_sad_cicle+ 12*interaction) : address_last_best_sad;

//--- Output Finder ---\\

register #(17) out_best_sad_register (clock,reset,enable_out,new_best_sad,best_sad);
register #(6) out_add_best_sad_register (clock,reset,enable_out,address_new_best_sad,address_best_sad);


/* ----------------------  Obs  ----------------------

	- [67,72,75] Right_side is only used during when PVSO caculations are active. IF they are not active, the SADs output will be 0.
 Therefore, they wont be useful to the finder.  

*/


endmodule