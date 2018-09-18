module address_finder (
	msb_01,
	msb_23,
	msb_45,
	msb_01_23,
	msb_0123_45,
	address_best_sad_cicle
	);

//----------------------  Parameters  ----------------------\\

//parameter DATAWIDTH = 8; // YOU HAVE NO POWER HERE!

//----------------------  Input & Output Ports  ----------------------\\

input msb_01,msb_23,msb_45,msb_01_23,msb_0123_45;

output [2:0] address_best_sad_cicle;

//----------------------  Internal Wires  ----------------------\\

wire [5:0] wire_add_0,wire_add_1,wire_add_2,wire_add_3,wire_add_4,wire_add_5,wire_01,wire_23, wire_45,wire_0123;

//----------------------  difference_finder  ----------------------\\

//Round 0
assign wire_add_0 = 3'b000; // address of sad_0 or sad_6
assign wire_add_1 = 3'b001;
assign wire_add_2 = 3'b010;
assign wire_add_3 = 3'b011;
assign wire_add_4 = 3'b100;
assign wire_add_5 = 3'b101;

//Round 1 
assign wire_01 = (msb_01) ? wire_add_1 : wire_add_0;
assign wire_23 = (msb_23) ? wire_add_3 : wire_add_2;
assign wire_45 = (msb_45) ? wire_add_5 : wire_add_4;

//Round 2
assign wire_0123 = (msb_01_23) ? wire_23 : wire_01;

//Round 3
assign address_best_sad_cicle = (msb_0123_45) ? wire_45 : wire_0123;

/* ----------------------  Obs  ----------------------

*/

endmodule
