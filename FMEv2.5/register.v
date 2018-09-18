module register(
	clock,
	reset,
	enable,
	in,
	out
	);

	parameter DATAWIDTH = 8;
	
	input clock, enable, reset;
	input  [DATAWIDTH-1:0] in;
	output reg [DATAWIDTH-1:0] out;


	always @ (posedge clock or posedge reset)
	if (reset) begin
 		out <= 8'b0;
	end else if (enable) begin
  		out <= in;
	end 

endmodule
