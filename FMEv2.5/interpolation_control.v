module interpolation_control(
	clock,
	reset,
	enable,
	PH_INTERPOLATION_finished,
	PVPO_INTERPOLATION_finished,
	PVSO_INTERPOLATION_finished,
	enable_reg_int,
	enable_TB_int,
	enable_TB_PH,
	direction_int, 
	direction_PH,
	mux_c0,
	mux_c1,
	enable_clip
	);


//--------------------------------- Parameters -----------------------------//

parameter DATAWIDTH = 8;

//--------------------------------- Input ports -----------------------------//

input clock, reset, enable, PH_INTERPOLATION_finished, PVPO_INTERPOLATION_finished, PVSO_INTERPOLATION_finished;

//--------------------------------- Output ports -----------------------------//

output reg enable_reg_int,enable_TB_int,enable_TB_PH,direction_int,direction_PH,mux_c0,mux_c1,enable_clip;

//--------------------------------- States -----------------------------//

reg [2:0] state;
parameter
IDLE = 0,
BEGINNING = 1,
PH_INTERPOLATION = 2,
PVPO_INTERPOLATION_SETUP = 3,
PVPO_INTERPOLATION = 4,
PVSO_INTERPOLATION = 5;


always @ (state) begin
	case (state)
		IDLE:begin // S0
			enable_reg_int = 1'b0;
			enable_TB_int = 1'b0;
			enable_TB_PH = 1'b0;
			direction_int = 1'b0;
			direction_PH = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b0;
		end
		BEGINNING:begin //S1
			enable_reg_int = 1'b1;
			enable_TB_int = 1'b1;
			enable_TB_PH = 1'b0;
			direction_int = 1'b0; 
			direction_PH = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b0;
		end
		PH_INTERPOLATION:begin // S2 16 cycles
			enable_reg_int = 1'b1;
			enable_TB_int = 1'b1;
			enable_TB_PH = 1'b1;
			direction_int = 1'b0;
			direction_PH = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b1;
		end
		PVPO_INTERPOLATION_SETUP:begin // S3 1 cycle
			enable_reg_int = 1'b1;
			enable_TB_int = 1'b1;
			enable_TB_PH = 1'b1;
			direction_int = 1'b0;
			direction_PH = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b1;
		end
		PVPO_INTERPOLATION:begin // S4 7 cycles
			enable_reg_int = 1'b0;
			enable_TB_int = 1'b1;
			enable_TB_PH = 1'b0;
			direction_int = 1'b1;
			direction_PH = 1'b1;
			mux_c0 = 1'b0;
			mux_c1 = 1'b1;
			enable_clip = 1'b1;
		end
		PVSO_INTERPOLATION:begin // S5 27 cycles
			enable_reg_int = 1'b0;
			enable_TB_int = 1'b0;
			enable_TB_PH = 1'b1;
			direction_int = 1'b1;
			direction_PH = 1'b1;
			mux_c0 = 1'b1;
			mux_c1 = 1'b1;
			enable_clip = 1'b1;
		end
		default:begin // 
			enable_reg_int = 1'b0;
			enable_TB_int = 1'b0;
			enable_TB_PH = 1'b0;
			direction_int = 1'b0;
			direction_PH = 1'b0;
			mux_c0 = 1'b0;
			mux_c1 = 1'b0;
			enable_clip = 1'b0;
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
			state <= PVSO_INTERPOLATION;
		PVSO_INTERPOLATION: if (PVSO_INTERPOLATION_finished)
			state <= IDLE;
	endcase
end


endmodule