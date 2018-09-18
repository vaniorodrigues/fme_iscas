module clip11(
	clock,
	enable,
	in,
	out
	);

parameter DATAWIDTH = 8;

input clock, enable;
input signed [DATAWIDTH+2:0] in;
output [DATAWIDTH-1:0] out;

reg [DATAWIDTH-1:0] in_8bits;


always @ (posedge clock) begin

	if (enable) begin
		if (in[10] == 1'b1 ) begin
		in_8bits <= 8'b0;
		end else if (in[8] == 1'b1) begin
	  	in_8bits <= 8'b11111111;
	  	end else begin
		in_8bits <= in[7:0];
	  	end
	end

end

assign out = in_8bits;

endmodule
