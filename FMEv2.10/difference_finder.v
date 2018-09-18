module difference_finder (
	sad_0,
	sad_1,
	best_sad,
	msb
	);

//----------------------  Parameters  ----------------------\\

parameter DATAWIDTH = 8;

//----------------------  Input & Output Ports  ----------------------\\

input [DATAWIDTH+8:0] sad_0,sad_1;

output [DATAWIDTH+8:0] best_sad;
output msb;

//----------------------  Internal Wires  ----------------------\\

wire [DATAWIDTH+9:0] wire_0; 

//----------------------  difference_finder  ----------------------\\

assign wire_0 = sad_1 - sad_0; // if MSB of wire_0 = 1, then the result is negative. Therefore, sad_0 is bigger then sad_1

assign msb = wire_0[17]; // msb will be letter used to find the address of the best choice

assign best_sad = (msb) ? sad_1 : sad_0; // best_sad is choosen using the MSB from the subtraction.

endmodule