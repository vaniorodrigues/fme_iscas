module mux_best_candidate(
	select,
	a0,
	a1,
	a2,
	a3,
	a4,
	a5,
	a6,
	a7,
	a8,
	b0,
	b1,
	b2,
	b3,
	b4,
	b5,
	b6,
	b7,
	b8,
	c0,
	c1,
	c2,
	c3,
	c4,
	c5,
	c6,
	c7,
	c8,
	out_0,
	out_1,
	out_2,
	out_3,
	out_4,
	out_5,
	out_6,
	out_7
	);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input [2:0] select;

input [DATAWIDTH-1:0] a0,a1,a2,a3,a4,a5,a6,a7,a8,b0,b1,b2,b3,b4,b5,b6,b7,b8,c0,c1,c2,c3,c4,c5,c6,c7,c8;

output reg [DATAWIDTH-1:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7;

//----------------------  Input Mux  ----------------------\\

always @(a0 or a1 or a2 or a3 or a4 or a5 or a6 or a7 or a8 or b0 or b1 or b2 or b3 or b4 or b5 or b6 or b7 or b8 or c0 or c1 or c2 or c3 or c4 or c5 or c6 or c7 or c8 or select)

 if (select == 3'b000) begin
 	out_0 <= a0; out_1 <= a1; out_2 <= a2; out_3 <= a3; out_4 <= a4; out_5 <= a5; out_6 <= a6; out_7 <= a7;
 end else if (select == 3'b001) begin
 	out_0 <= b0; out_1 <= b1; out_2 <= b2; out_3 <= b3; out_4 <= b4; out_5 <= b5; out_6 <= b6; out_7 <= b7;
 end else if (select == 3'b010) begin 
 	out_0 <= c0; out_1 <= c1; out_2 <= c2; out_3 <= c3; out_4 <= c4; out_5 <= c5; out_6 <= c6; out_7 <= c7;
 end else if (select == 3'b011) begin 
 	out_0 <= a1; out_1 <= a2; out_2 <= a3; out_3 <= a4; out_4 <= a5; out_5 <= a6; out_6 <= a7; out_7 <= a8;
 end else if (select == 3'b100) begin 
 	out_0 <= b1; out_1 <= b2; out_2 <= b3; out_3 <= b4; out_4 <= b5; out_5 <= b6; out_6 <= b7; out_7 <= b8;
 end else if (select == 3'b101) begin 
 	out_0 <= c1; out_1 <= c2; out_2 <= c3; out_3 <= c4; out_4 <= c5; out_5 <= c6; out_6 <= c7; out_7 <= c8;
 end else if (select == 3'b110) begin 
 	out_0 <= 8'bz; out_1 <= 8'bz; out_2 <= 8'bz; out_3 <= 8'bz; out_4 <= 8'bz; out_5 <= 8'bz; out_6 <= 8'bz; out_7 <= 8'bz;
 end else if (select == 3'b111) begin 
 	out_0 <= 8'bz; out_1 <= 8'bz; out_2 <= 8'bz; out_3 <= 8'bz; out_4 <= 8'bz; out_5 <= 8'bz; out_6 <= 8'bz; out_7 <= 8'bz;
 end

endmodule
