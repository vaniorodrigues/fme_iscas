module Adder_cell(
	in_a,
	in_b,
	out
	);

parameter DATAWIDTH = 8;

input [DATAWIDTH-1:0] in_a, in_b;
output [DATAWIDTH:0]  out;


assign out = in_a + in_b;

endmodule
