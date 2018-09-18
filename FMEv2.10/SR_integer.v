/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-20 18:40:38
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-04-05 14:21:50
*/
module SR_integer(
	clock, 
	reset,
	enable,
	enable_read,
	in_0,
	in_1,
	in_2,
	in_3,
	in_4,
	in_5,
	in_6,
	in_7,
	out_0,
	out_1,
	out_2,
	out_3,
	out_4,
	out_5,
	out_6,
	out_7,
	out_8,
	out_9,
	out_10,
	out_11,
	out_12,
	out_13,
	out_14,
	out_15
);

//--------------------------------- Parameters -----------------------------//

parameter DATAWIDTH = 8;

//--------------------------------- Input ports -----------------------------//

input clock, reset, enable, enable_read;

input [DATAWIDTH-1:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7;

//--------------------------------- Output ports -----------------------------//

output reg [DATAWIDTH-1:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15;

//--------------------------------- Internal Wires -----------------------------//

wire [DATAWIDTH-1:0] out_of_0_0, out_of_0_1, out_of_0_2, out_of_0_3, out_of_0_4, out_of_0_5, out_of_0_6, out_of_0_7,out_of_1_0, out_of_1_1, out_of_1_2, out_of_1_3, out_of_1_4, out_of_1_5, out_of_1_6, out_of_1_7,out_of_2_0, out_of_2_1, out_of_2_2, out_of_2_3, out_of_2_4, out_of_2_5, out_of_2_6, out_of_2_7, out_of_3_0, out_of_3_1, out_of_3_2, out_of_3_3, out_of_3_4, out_of_3_5, out_of_3_6, out_of_3_7,out_of_4_0, out_of_4_1, out_of_4_2, out_of_4_3, out_of_4_4, out_of_4_5, out_of_4_6, out_of_4_7, out_of_5_0, out_of_5_1, out_of_5_2, out_of_5_3, out_of_5_4, out_of_5_5, out_of_5_6, out_of_5_7,  out_of_6_0, out_of_6_1, out_of_6_2, out_of_6_3, out_of_6_4, out_of_6_5, out_of_6_6, out_of_6_7, out_of_7_0, out_of_7_1, out_of_7_2, out_of_7_3, out_of_7_4, out_of_7_5, out_of_7_6, out_of_7_7,  out_of_8_0, out_of_8_1, out_of_8_2, out_of_8_3, out_of_8_4, out_of_8_5, out_of_8_6, out_of_8_7, out_of_9_0, out_of_9_1, out_of_9_2, out_of_9_3, out_of_9_4, out_of_9_5, out_of_9_6, out_of_9_7,   out_of_10_0, out_of_10_1, out_of_10_2, out_of_10_3, out_of_10_4, out_of_10_5, out_of_10_6, out_of_10_7, out_of_11_0, out_of_11_1, out_of_11_2, out_of_11_3, out_of_11_4, out_of_11_5, out_of_11_6, out_of_11_7,out_of_12_0, out_of_12_1, out_of_12_2, out_of_12_3, out_of_12_4, out_of_12_5, out_of_12_6, out_of_12_7,out_of_13_0, out_of_13_1, out_of_13_2, out_of_13_3, out_of_13_4, out_of_13_5, out_of_13_6, out_of_13_7, out_of_14_0, out_of_14_1, out_of_14_2, out_of_14_3, out_of_14_4, out_of_14_5, out_of_14_6, out_of_14_7, out_of_15_0, out_of_15_1, out_of_15_2, out_of_15_3, out_of_15_4, out_of_15_5, out_of_15_6, out_of_15_7;

reg [3:0] counter; // 8 cases, 8 differents sets of outputs all vertical.

//--------------------------------- Shift Register Integer -----------------------------//

register #(DATAWIDTH) cell_0_0(clock, reset, enable, in_7, out_of_0_0);
register #(DATAWIDTH) cell_0_1(clock, reset, enable, in_6, out_of_0_1);
register #(DATAWIDTH) cell_0_2(clock, reset, enable, in_5, out_of_0_2);
register #(DATAWIDTH) cell_0_3(clock, reset, enable, in_4, out_of_0_3);
register #(DATAWIDTH) cell_0_4(clock, reset, enable, in_3, out_of_0_4);
register #(DATAWIDTH) cell_0_5(clock, reset, enable, in_2, out_of_0_5);
register #(DATAWIDTH) cell_0_6(clock, reset, enable, in_1, out_of_0_6);
register #(DATAWIDTH) cell_0_7(clock, reset, enable, in_0, out_of_0_7);

register #(DATAWIDTH) cell_1_0(clock, reset, enable, out_of_0_0, out_of_1_0);
register #(DATAWIDTH) cell_1_1(clock, reset, enable, out_of_0_1, out_of_1_1);
register #(DATAWIDTH) cell_1_2(clock, reset, enable, out_of_0_2, out_of_1_2);
register #(DATAWIDTH) cell_1_3(clock, reset, enable, out_of_0_3, out_of_1_3);
register #(DATAWIDTH) cell_1_4(clock, reset, enable, out_of_0_4, out_of_1_4);
register #(DATAWIDTH) cell_1_5(clock, reset, enable, out_of_0_5, out_of_1_5);
register #(DATAWIDTH) cell_1_6(clock, reset, enable, out_of_0_6, out_of_1_6);
register #(DATAWIDTH) cell_1_7(clock, reset, enable, out_of_0_7, out_of_1_7);

register #(DATAWIDTH) cell_2_0(clock, reset, enable, out_of_1_0, out_of_2_0);
register #(DATAWIDTH) cell_2_1(clock, reset, enable, out_of_1_1, out_of_2_1);
register #(DATAWIDTH) cell_2_2(clock, reset, enable, out_of_1_2, out_of_2_2);
register #(DATAWIDTH) cell_2_3(clock, reset, enable, out_of_1_3, out_of_2_3);
register #(DATAWIDTH) cell_2_4(clock, reset, enable, out_of_1_4, out_of_2_4);
register #(DATAWIDTH) cell_2_5(clock, reset, enable, out_of_1_5, out_of_2_5);
register #(DATAWIDTH) cell_2_6(clock, reset, enable, out_of_1_6, out_of_2_6);
register #(DATAWIDTH) cell_2_7(clock, reset, enable, out_of_1_7, out_of_2_7);

register #(DATAWIDTH) cell_3_0(clock, reset, enable, out_of_2_0, out_of_3_0);
register #(DATAWIDTH) cell_3_1(clock, reset, enable, out_of_2_1, out_of_3_1);
register #(DATAWIDTH) cell_3_2(clock, reset, enable, out_of_2_2, out_of_3_2);
register #(DATAWIDTH) cell_3_3(clock, reset, enable, out_of_2_3, out_of_3_3);
register #(DATAWIDTH) cell_3_4(clock, reset, enable, out_of_2_4, out_of_3_4);
register #(DATAWIDTH) cell_3_5(clock, reset, enable, out_of_2_5, out_of_3_5);
register #(DATAWIDTH) cell_3_6(clock, reset, enable, out_of_2_6, out_of_3_6);
register #(DATAWIDTH) cell_3_7(clock, reset, enable, out_of_2_7, out_of_3_7);

register #(DATAWIDTH) cell_4_0(clock, reset, enable, out_of_3_0, out_of_4_0);
register #(DATAWIDTH) cell_4_1(clock, reset, enable, out_of_3_1, out_of_4_1);
register #(DATAWIDTH) cell_4_2(clock, reset, enable, out_of_3_2, out_of_4_2);
register #(DATAWIDTH) cell_4_3(clock, reset, enable, out_of_3_3, out_of_4_3);
register #(DATAWIDTH) cell_4_4(clock, reset, enable, out_of_3_4, out_of_4_4);
register #(DATAWIDTH) cell_4_5(clock, reset, enable, out_of_3_5, out_of_4_5);
register #(DATAWIDTH) cell_4_6(clock, reset, enable, out_of_3_6, out_of_4_6);
register #(DATAWIDTH) cell_4_7(clock, reset, enable, out_of_3_7, out_of_4_7);

register #(DATAWIDTH) cell_5_0(clock, reset, enable, out_of_4_0, out_of_5_0);
register #(DATAWIDTH) cell_5_1(clock, reset, enable, out_of_4_1, out_of_5_1);
register #(DATAWIDTH) cell_5_2(clock, reset, enable, out_of_4_2, out_of_5_2);
register #(DATAWIDTH) cell_5_3(clock, reset, enable, out_of_4_3, out_of_5_3);
register #(DATAWIDTH) cell_5_4(clock, reset, enable, out_of_4_4, out_of_5_4);
register #(DATAWIDTH) cell_5_5(clock, reset, enable, out_of_4_5, out_of_5_5);
register #(DATAWIDTH) cell_5_6(clock, reset, enable, out_of_4_6, out_of_5_6);
register #(DATAWIDTH) cell_5_7(clock, reset, enable, out_of_4_7, out_of_5_7);

register #(DATAWIDTH) cell_6_0(clock, reset, enable, out_of_5_0, out_of_6_0);
register #(DATAWIDTH) cell_6_1(clock, reset, enable, out_of_5_1, out_of_6_1);
register #(DATAWIDTH) cell_6_2(clock, reset, enable, out_of_5_2, out_of_6_2);
register #(DATAWIDTH) cell_6_3(clock, reset, enable, out_of_5_3, out_of_6_3);
register #(DATAWIDTH) cell_6_4(clock, reset, enable, out_of_5_4, out_of_6_4);
register #(DATAWIDTH) cell_6_5(clock, reset, enable, out_of_5_5, out_of_6_5);
register #(DATAWIDTH) cell_6_6(clock, reset, enable, out_of_5_6, out_of_6_6);
register #(DATAWIDTH) cell_6_7(clock, reset, enable, out_of_5_7, out_of_6_7);

register #(DATAWIDTH) cell_7_0(clock, reset, enable, out_of_6_0, out_of_7_0);
register #(DATAWIDTH) cell_7_1(clock, reset, enable, out_of_6_1, out_of_7_1);
register #(DATAWIDTH) cell_7_2(clock, reset, enable, out_of_6_2, out_of_7_2);
register #(DATAWIDTH) cell_7_3(clock, reset, enable, out_of_6_3, out_of_7_3);
register #(DATAWIDTH) cell_7_4(clock, reset, enable, out_of_6_4, out_of_7_4);
register #(DATAWIDTH) cell_7_5(clock, reset, enable, out_of_6_5, out_of_7_5);
register #(DATAWIDTH) cell_7_6(clock, reset, enable, out_of_6_6, out_of_7_6);
register #(DATAWIDTH) cell_7_7(clock, reset, enable, out_of_6_7, out_of_7_7);

register #(DATAWIDTH) cell_8_0(clock, reset, enable, out_of_7_0, out_of_8_0);
register #(DATAWIDTH) cell_8_1(clock, reset, enable, out_of_7_1, out_of_8_1);
register #(DATAWIDTH) cell_8_2(clock, reset, enable, out_of_7_2, out_of_8_2);
register #(DATAWIDTH) cell_8_3(clock, reset, enable, out_of_7_3, out_of_8_3);
register #(DATAWIDTH) cell_8_4(clock, reset, enable, out_of_7_4, out_of_8_4);
register #(DATAWIDTH) cell_8_5(clock, reset, enable, out_of_7_5, out_of_8_5);
register #(DATAWIDTH) cell_8_6(clock, reset, enable, out_of_7_6, out_of_8_6);
register #(DATAWIDTH) cell_8_7(clock, reset, enable, out_of_7_7, out_of_8_7);

register #(DATAWIDTH) cell_9_0(clock, reset, enable, out_of_8_0, out_of_9_0);
register #(DATAWIDTH) cell_9_1(clock, reset, enable, out_of_8_1, out_of_9_1);
register #(DATAWIDTH) cell_9_2(clock, reset, enable, out_of_8_2, out_of_9_2);
register #(DATAWIDTH) cell_9_3(clock, reset, enable, out_of_8_3, out_of_9_3);
register #(DATAWIDTH) cell_9_4(clock, reset, enable, out_of_8_4, out_of_9_4);
register #(DATAWIDTH) cell_9_5(clock, reset, enable, out_of_8_5, out_of_9_5);
register #(DATAWIDTH) cell_9_6(clock, reset, enable, out_of_8_6, out_of_9_6);
register #(DATAWIDTH) cell_9_7(clock, reset, enable, out_of_8_7, out_of_9_7);

register #(DATAWIDTH) cell_10_0(clock, reset, enable, out_of_9_0, out_of_10_0);
register #(DATAWIDTH) cell_10_1(clock, reset, enable, out_of_9_1, out_of_10_1);
register #(DATAWIDTH) cell_10_2(clock, reset, enable, out_of_9_2, out_of_10_2);
register #(DATAWIDTH) cell_10_3(clock, reset, enable, out_of_9_3, out_of_10_3);
register #(DATAWIDTH) cell_10_4(clock, reset, enable, out_of_9_4, out_of_10_4);
register #(DATAWIDTH) cell_10_5(clock, reset, enable, out_of_9_5, out_of_10_5);
register #(DATAWIDTH) cell_10_6(clock, reset, enable, out_of_9_6, out_of_10_6);
register #(DATAWIDTH) cell_10_7(clock, reset, enable, out_of_9_7, out_of_10_7);

register #(DATAWIDTH) cell_11_0(clock, reset, enable, out_of_10_0, out_of_11_0);
register #(DATAWIDTH) cell_11_1(clock, reset, enable, out_of_10_1, out_of_11_1);
register #(DATAWIDTH) cell_11_2(clock, reset, enable, out_of_10_2, out_of_11_2);
register #(DATAWIDTH) cell_11_3(clock, reset, enable, out_of_10_3, out_of_11_3);
register #(DATAWIDTH) cell_11_4(clock, reset, enable, out_of_10_4, out_of_11_4);
register #(DATAWIDTH) cell_11_5(clock, reset, enable, out_of_10_5, out_of_11_5);
register #(DATAWIDTH) cell_11_6(clock, reset, enable, out_of_10_6, out_of_11_6);
register #(DATAWIDTH) cell_11_7(clock, reset, enable, out_of_10_7, out_of_11_7);

register #(DATAWIDTH) cell_12_0(clock, reset, enable, out_of_11_0, out_of_12_0);
register #(DATAWIDTH) cell_12_1(clock, reset, enable, out_of_11_1, out_of_12_1);
register #(DATAWIDTH) cell_12_2(clock, reset, enable, out_of_11_2, out_of_12_2);
register #(DATAWIDTH) cell_12_3(clock, reset, enable, out_of_11_3, out_of_12_3);
register #(DATAWIDTH) cell_12_4(clock, reset, enable, out_of_11_4, out_of_12_4);
register #(DATAWIDTH) cell_12_5(clock, reset, enable, out_of_11_5, out_of_12_5);
register #(DATAWIDTH) cell_12_6(clock, reset, enable, out_of_11_6, out_of_12_6);
register #(DATAWIDTH) cell_12_7(clock, reset, enable, out_of_11_7, out_of_12_7);

register #(DATAWIDTH) cell_13_0(clock, reset, enable, out_of_12_0, out_of_13_0);
register #(DATAWIDTH) cell_13_1(clock, reset, enable, out_of_12_1, out_of_13_1);
register #(DATAWIDTH) cell_13_2(clock, reset, enable, out_of_12_2, out_of_13_2);
register #(DATAWIDTH) cell_13_3(clock, reset, enable, out_of_12_3, out_of_13_3);
register #(DATAWIDTH) cell_13_4(clock, reset, enable, out_of_12_4, out_of_13_4);
register #(DATAWIDTH) cell_13_5(clock, reset, enable, out_of_12_5, out_of_13_5);
register #(DATAWIDTH) cell_13_6(clock, reset, enable, out_of_12_6, out_of_13_6);
register #(DATAWIDTH) cell_13_7(clock, reset, enable, out_of_12_7, out_of_13_7);

register #(DATAWIDTH) cell_14_0(clock, reset, enable, out_of_13_0, out_of_14_0);
register #(DATAWIDTH) cell_14_1(clock, reset, enable, out_of_13_1, out_of_14_1);
register #(DATAWIDTH) cell_14_2(clock, reset, enable, out_of_13_2, out_of_14_2);
register #(DATAWIDTH) cell_14_3(clock, reset, enable, out_of_13_3, out_of_14_3);
register #(DATAWIDTH) cell_14_4(clock, reset, enable, out_of_13_4, out_of_14_4);
register #(DATAWIDTH) cell_14_5(clock, reset, enable, out_of_13_5, out_of_14_5);
register #(DATAWIDTH) cell_14_6(clock, reset, enable, out_of_13_6, out_of_14_6);
register #(DATAWIDTH) cell_14_7(clock, reset, enable, out_of_13_7, out_of_14_7);

register #(DATAWIDTH) cell_15_0(clock, reset, enable, out_of_14_0, out_of_15_0);
register #(DATAWIDTH) cell_15_1(clock, reset, enable, out_of_14_1, out_of_15_1);
register #(DATAWIDTH) cell_15_2(clock, reset, enable, out_of_14_2, out_of_15_2);
register #(DATAWIDTH) cell_15_3(clock, reset, enable, out_of_14_3, out_of_15_3);
register #(DATAWIDTH) cell_15_4(clock, reset, enable, out_of_14_4, out_of_15_4);
register #(DATAWIDTH) cell_15_5(clock, reset, enable, out_of_14_5, out_of_15_5);
register #(DATAWIDTH) cell_15_6(clock, reset, enable, out_of_14_6, out_of_15_6);
register #(DATAWIDTH) cell_15_7(clock, reset, enable, out_of_14_7, out_of_15_7);

// Desligar o enable dos buffers no testbench uma vez que os valroes forem escritos, já que as saídas estaram todas carregadas com os valores atuais.

always @(posedge clock or posedge reset) begin 
 	if (reset) begin
 		counter <= 0;
 	end
 	else if (enable_read) begin
 		counter <= counter +1;
 	end
 	else begin
 		counter <= 0;
 	end
end

always @ *
case (counter)
	4'd1 :
		begin
			out_0  <=  out_of_0_7; 
			out_1  <=  out_of_1_7; 
			out_2  <=  out_of_2_7; 
			out_3  <=  out_of_3_7; 
			out_4  <=  out_of_4_7; 
			out_5  <=  out_of_5_7; 
			out_6  <=  out_of_6_7; 
			out_7  <=  out_of_7_7; 
			out_8  <=  out_of_8_7; 
			out_9  <=  out_of_9_7; 
			out_10 <= out_of_10_7; 
			out_11 <= out_of_11_7; 
			out_12 <= out_of_12_7; 
			out_13 <= out_of_13_7; 
			out_14 <= out_of_14_7; 
			out_15 <= out_of_15_7; 
		end
	4'd2 :
		begin
			out_0  <=  out_of_0_6; 
			out_1  <=  out_of_1_6; 
			out_2  <=  out_of_2_6; 
			out_3  <=  out_of_3_6; 
			out_4  <=  out_of_4_6; 
			out_5  <=  out_of_5_6; 
			out_6  <=  out_of_6_6; 
			out_7  <=  out_of_7_6; 
			out_8  <=  out_of_8_6; 
			out_9  <=  out_of_9_6; 
			out_10 <= out_of_10_6; 
			out_11 <= out_of_11_6; 
			out_12 <= out_of_12_6; 
			out_13 <= out_of_13_6; 
			out_14 <= out_of_14_6; 
			out_15 <= out_of_15_6; 
		end
	4'd3 :
		begin
			out_0  <=  out_of_0_5; 
			out_1  <=  out_of_1_5; 
			out_2  <=  out_of_2_5; 
			out_3  <=  out_of_3_5; 
			out_4  <=  out_of_4_5; 
			out_5  <=  out_of_5_5; 
			out_6  <=  out_of_6_5; 
			out_7  <=  out_of_7_5; 
			out_8  <=  out_of_8_5; 
			out_9  <=  out_of_9_5; 
			out_10 <= out_of_10_5; 
			out_11 <= out_of_11_5; 
			out_12 <= out_of_12_5; 
			out_13 <= out_of_13_5; 
			out_14 <= out_of_14_5; 
			out_15 <= out_of_15_5; 
		end
	4'd4 :
		begin
			out_0  <=  out_of_0_4; 
			out_1  <=  out_of_1_4; 
			out_2  <=  out_of_2_4; 
			out_3  <=  out_of_3_4; 
			out_4  <=  out_of_4_4; 
			out_5  <=  out_of_5_4; 
			out_6  <=  out_of_6_4; 
			out_7  <=  out_of_7_4; 
			out_8  <=  out_of_8_4; 
			out_9  <=  out_of_9_4; 
			out_10 <= out_of_10_4; 
			out_11 <= out_of_11_4; 
			out_12 <= out_of_12_4; 
			out_13 <= out_of_13_4; 
			out_14 <= out_of_14_4; 
			out_15 <= out_of_15_4; 
		end
	4'd5 :
		begin
			out_0  <=  out_of_0_3; 
			out_1  <=  out_of_1_3; 
			out_2  <=  out_of_2_3; 
			out_3  <=  out_of_3_3; 
			out_4  <=  out_of_4_3; 
			out_5  <=  out_of_5_3; 
			out_6  <=  out_of_6_3; 
			out_7  <=  out_of_7_3; 
			out_8  <=  out_of_8_3; 
			out_9  <=  out_of_9_3; 
			out_10 <= out_of_10_3; 
			out_11 <= out_of_11_3; 
			out_12 <= out_of_12_3; 
			out_13 <= out_of_13_3; 
			out_14 <= out_of_14_3; 
			out_15 <= out_of_15_3; 
		end
	4'd6 :
		begin
			out_0  <=  out_of_0_2; 
			out_1  <=  out_of_1_2; 
			out_2  <=  out_of_2_2; 
			out_3  <=  out_of_3_2; 
			out_4  <=  out_of_4_2; 
			out_5  <=  out_of_5_2; 
			out_6  <=  out_of_6_2; 
			out_7  <=  out_of_7_2; 
			out_8  <=  out_of_8_2; 
			out_9  <=  out_of_9_2; 
			out_10 <= out_of_10_2; 
			out_11 <= out_of_11_2; 
			out_12 <= out_of_12_2; 
			out_13 <= out_of_13_2; 
			out_14 <= out_of_14_2; 
			out_15 <= out_of_15_2; 
		end
	4'd7 :
		begin
			out_0  <=  out_of_0_1; 
			out_1  <=  out_of_1_1; 
			out_2  <=  out_of_2_1; 
			out_3  <=  out_of_3_1; 
			out_4  <=  out_of_4_1; 
			out_5  <=  out_of_5_1; 
			out_6  <=  out_of_6_1; 
			out_7  <=  out_of_7_1; 
			out_8  <=  out_of_8_1; 
			out_9  <=  out_of_9_1; 
			out_10 <= out_of_10_1; 
			out_11 <= out_of_11_1; 
			out_12 <= out_of_12_1; 
			out_13 <= out_of_13_1; 
			out_14 <= out_of_14_1; 
			out_15 <= out_of_15_1; 
		end
	4'd8 :
		begin
			out_0  <=  out_of_0_0; 
			out_1  <=  out_of_1_0; 
			out_2  <=  out_of_2_0; 
			out_3  <=  out_of_3_0; 
			out_4  <=  out_of_4_0; 
			out_5  <=  out_of_5_0; 
			out_6  <=  out_of_6_0; 
			out_7  <=  out_of_7_0; 
			out_8  <=  out_of_8_0; 
			out_9  <=  out_of_9_0; 
			out_10 <= out_of_10_0; 
			out_11 <= out_of_11_0; 
			out_12 <= out_of_12_0; 
			out_13 <= out_of_13_0; 
			out_14 <= out_of_14_0; 
			out_15 <= out_of_15_0; 
		end
	default :
		begin
			out_0  <= 0; 
			out_1  <= 0; 
			out_2  <= 0; 
			out_3  <= 0; 
			out_4  <= 0; 
			out_5  <= 0; 
			out_6  <= 0; 
			out_7  <= 0; 
			out_8  <= 0; 
			out_9  <= 0; 
			out_10 <= 0; 
			out_11 <= 0; 
			out_12 <= 0; 
			out_13 <= 0; 
			out_14 <= 0; 
			out_15 <= 0; 
		end
endcase

endmodule