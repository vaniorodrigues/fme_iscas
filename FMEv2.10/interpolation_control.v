/*
* @Author: Vanio Rodrigues Filho
* @Date:   2018-03-19 18:16:57
* @Last Modified by:   VanioRodrigues
* @Last Modified time: 2018-04-05 14:01:15
*/
module interpolation_control(
	clock,
	reset,
	enable,
	PH_INTERPOLATION_finished,
	PVPO_INTERPOLATION_finished,
	PVSO_INTERPOLATION_finished,
	enable_reg_int,
	enable_SR_integer,
	enable_SR_horizontal,
	enable_read_integer, 
	enable_read_horizontal,
	mux_c0,
	mux_c1,
	enable_clip,
	clip_pvso
	);


//--------------------------------- Parameters -----------------------------//

parameter DATAWIDTH = 8;

//--------------------------------- Input ports -----------------------------//

input clock, reset, enable, PH_INTERPOLATION_finished, PVPO_INTERPOLATION_finished, PVSO_INTERPOLATION_finished;

//--------------------------------- Output ports -----------------------------//

output reg enable_reg_int,enable_SR_integer,enable_SR_horizontal,enable_read_integer,enable_read_horizontal,mux_c0,mux_c1,enable_clip,clip_pvso;

//--------------------------------- States -----------------------------//

reg [2:0] state;
parameter
IDLE = 0,
BEGINNING = 1,
PH_INTERPOLATION = 2,
PVPO_INTERPOLATION_SETUP = 3,
PVPO_INTERPOLATION = 4,
PVSO_INTERPOLATION_SETUP = 5,
PVSO_INTERPOLATION = 6,
BEGINNING_and_PVSO_INTERPOLATION = 7;


always @ (state) begin
	case (state)
		IDLE:begin // S0
			enable_reg_int = 1'b0;
			enable_SR_integer = 1'b0;
			enable_read_integer = 1'b0;
			enable_SR_horizontal = 1'b0;
			enable_read_horizontal = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b0;
			clip_pvso = 1'b0;
		end
		BEGINNING:begin //S1
			enable_reg_int = 1'b1;
			enable_SR_integer = 1'b0;
			enable_read_integer = 1'b0; 
			enable_SR_horizontal = 1'b0;
			enable_read_horizontal = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b0;
			clip_pvso = 1'b0;
		end
		PH_INTERPOLATION:begin // S2 16 cycles
			enable_reg_int = 1'b1;
			enable_SR_integer = 1'b1;
			enable_read_integer = 1'b0; 
			enable_SR_horizontal = 1'b1;
			enable_read_horizontal = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b1;
			clip_pvso = 1'b0;
		end
		PVPO_INTERPOLATION_SETUP:begin // S3 1 cycle
			enable_reg_int = 1'b1;
			enable_SR_integer = 1'b1;
			enable_read_integer = 1'b1; 
			enable_SR_horizontal = 1'b1;
			enable_read_horizontal = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b1;
			clip_pvso = 1'b0;
		end
		PVPO_INTERPOLATION:begin // S4 6 cycles
			enable_reg_int = 1'b0;
			enable_SR_integer = 1'b0;
			enable_read_integer = 1'b1; 
			enable_SR_horizontal = 1'b0;
			enable_read_horizontal = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b1;
			enable_clip = 1'b1;
			clip_pvso = 1'b0;
		end
		PVSO_INTERPOLATION_SETUP:begin // S4 1 cycles
			enable_reg_int = 1'b0;
			enable_SR_integer = 1'b0;
			enable_read_integer = 1'b1; 
			enable_SR_horizontal = 1'b0;
			enable_read_horizontal = 1'b1;
			mux_c0 = 1'b0;
			mux_c1 = 1'b1;
			enable_clip = 1'b1;
			clip_pvso = 1'b0;
		end
		PVSO_INTERPOLATION:begin // S5 26 cycles
			enable_reg_int = 1'b0;
			enable_SR_integer = 1'b0;
			enable_read_integer = 1'b0; 
			enable_SR_horizontal = 1'b0;
			enable_read_horizontal = 1'b1;
			mux_c0 = 1'b1;
			mux_c1 = 1'b1;
			enable_clip = 1'b1;
			clip_pvso = 1'b1;
		end
		BEGINNING_and_PVSO_INTERPOLATION:begin // 1 cycle - New Inputs here.
			enable_reg_int = 1'b1;
			enable_SR_integer = 1'b0;
			enable_read_integer = 1'b0; 
			enable_SR_horizontal = 1'b0;
			enable_read_horizontal = 1'b1;
			mux_c0 = 1'b1;
			mux_c1 = 1'b1;
			enable_clip = 1'b1;
			clip_pvso = 1'b1;
		end
		default:begin // 
			enable_reg_int = 1'b0;
			enable_SR_integer = 1'b0;
			enable_read_integer = 1'b0;
			enable_SR_horizontal = 1'b0;
			enable_read_horizontal = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b0;
			clip_pvso = 1'b0;
		end
	endcase
end


always @ (posedge clock or posedge reset) begin
	if (reset)
		state <= IDLE;
	else
	case (state)
		IDLE: if(enable)
				state <= BEGINNING;
		BEGINNING: state <= PH_INTERPOLATION;
		PH_INTERPOLATION: if (PH_INTERPOLATION_finished)
				state <= PVPO_INTERPOLATION_SETUP;
		PVPO_INTERPOLATION_SETUP: state <= PVPO_INTERPOLATION;
		PVPO_INTERPOLATION: if (PVPO_INTERPOLATION_finished)
			state <= PVSO_INTERPOLATION_SETUP;
		PVSO_INTERPOLATION_SETUP: state <= PVSO_INTERPOLATION;
		PVSO_INTERPOLATION: if (PVSO_INTERPOLATION_finished)
			state <= BEGINNING_and_PVSO_INTERPOLATION;
		BEGINNING_and_PVSO_INTERPOLATION: state <= PH_INTERPOLATION;
	endcase
end


endmodule