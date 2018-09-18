module Adder(
	in_0,
	in_1,
	in_2,
	in_3,
	in_4,
	in_5,
	in_6,
	in_7,
	out
	);

parameter DATAWIDTH = 8;

input [DATAWIDTH-1:0] in_0,in_1,in_2,in_3,in_4,in_5,in_6,in_7;
output [DATAWIDTH+2:0] out;

wire [DATAWIDTH:0] wire_a, wire_b, wire_c, wire_d; 
wire [DATAWIDTH+1:0] wire_e, wire_f;
wire [DATAWIDTH+2:0] wire_g;

Adder_cell #(DATAWIDTH) Adder_cell_a (in_0,in_1,wire_a);
Adder_cell #(DATAWIDTH) Adder_cell_b (in_2,in_3,wire_b);
Adder_cell #(DATAWIDTH) Adder_cell_c (in_4,in_5,wire_c);
Adder_cell #(DATAWIDTH) Adder_cell_d (in_6,in_7,wire_d);

Adder_cell #(DATAWIDTH+1) Adder_cell_e (wire_a,wire_b,wire_e);
Adder_cell #(DATAWIDTH+1) Adder_cell_f (wire_c,wire_d,wire_f);

Adder_cell #(DATAWIDTH+2) Adder_cell_g (wire_e,wire_f,wire_g);

assign out = wire_g;

endmodule
