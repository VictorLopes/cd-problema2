module Main(
	input clk,
	input reset,
	input btn,
	output [11:0] segs,
	output [2:0] Q
);
	
	wire BtnBit0, BtnBit1;
	
	/* assign leds[0] = Q0;
	assign leds[1] = Q1;
	assign leds[2] = Q2;*/
	
	Button button(
		.clk(clk),
		.reset(reset),
		.B(btn),
		.Q1(BtnBit0),
		.Q2(BtnBit1)
	);
	
	wire [3:0] spd;
	
	Speed speed(
		.reset(btn),
		.clk(clk),
		.speed(spd[3:0])
	);
	
	wire divided_clk;
	
	Multex multex(
		.A(BtnBit0),
		.B(BtnBit1),
		.clk(spd[2:0]),
		.Q(divided_clk)
	);
	
	wire Q0, Q1, Q2;
 
	Counter3Bits C3Bits(
		.clk(divided_clk),
		.reset(reset),
		.Q(Q)
	);
	
	
	Displays displays(
		.bits(Q),
		.reset(reset),
		.clk(clk),
		.segs(segs[11:0])
	);
	
	
	
endmodule
