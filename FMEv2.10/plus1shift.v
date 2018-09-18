/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-04-02 14:11:50
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-04-02 15:10:14
*/
module plus1shift(
	in,
	out
	);

parameter DATAWIDTH = 8; // Input number of bits.

input signed [DATAWIDTH-1:0] in;
output signed [DATAWIDTH-7:0] out; // Out has 6 less bits than input.


assign out = ((in >> 5) +1) >> 1;

endmodule
