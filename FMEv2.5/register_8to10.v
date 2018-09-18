module register_8to10(
	clock,
	reset,
	enable,
	in,
	out
	);

	parameter DATAWIDTH = 8;
	
	input clock, reset, enable;
	input  [DATAWIDTH-1:0] in;

	reg [DATAWIDTH-1:0] value;

	output [DATAWIDTH+1:0] out;

	assign out = {2'b00, value};

	always @ (posedge clock or posedge reset)
	if (reset) begin
 		value <= 8'b0;
	end else if (enable) begin 
  		value <= in;
	end 

endmodule
