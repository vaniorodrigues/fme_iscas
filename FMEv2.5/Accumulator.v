module Accumulator(
	clock,
	reset,
	enable,
	sel,
	in,
	lambda_r,
	out
	);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input clock, reset, enable, sel;
input [DATAWIDTH+7:0] lambda_r;
input [DATAWIDTH+2:0] in;

output reg [DATAWIDTH+8:0] out; 

//----------------------  Internal Wires  ----------------------\\

wire [DATAWIDTH+2:0] wire_1;
wire [DATAWIDTH+9:0] wire_2;

//----------------------  Accumulator  ----------------------\\

assign wire_1 = {1'b0,lambda_r} + {5'b0,in};
assign wire_2 = (sel) ? out + {6'b0,in} :wire_1;

	always @(posedge clock or posedge reset)
		if (reset) 	begin
			out <= 0;
		end else if (enable) begin
			out <= wire_2;
		end
			  
endmodule
