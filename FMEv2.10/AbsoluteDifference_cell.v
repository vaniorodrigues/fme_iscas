/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-19 18:16:57
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-03-23 11:51:58
*/
module AbsoluteDifference_cell(
	in_a,
	in_b,
	out
	);

parameter DATAWIDTH = 8;

input [DATAWIDTH-1:0] in_a, in_b;
output [DATAWIDTH-1:0]  out;

	assign out = (in_a < in_b ) ? in_b - in_a : in_a - in_b;

endmodule
