module Main(
	input clk,
	input reset,
	input btn,
	output [11:0] segs,
	output [2:0] leds
);
	
	wire BtnBit0, BtnBit1;
	
	assign leds[0] = Q0;
	assign leds[1] = Q1;
	assign leds[2] = Q2;
	
	Button button(
		.clk(clk),
		.reset(reset),
		.B(btn),
		.Q1(BtnBit0),
		.Q2(BtnBit1)
	);
	
	wire divided, divided1;
	
	ClockDivider20 DIV (
	  .clk(clk),
	  .reset(reset),
	  .T(1),
	  .Q(divided)
	);
	
	ClockDivider5 DIV1 (
	  .clk(divided),
	  .reset(reset),
	  .T(1),
	  .Q(divided1)
	);
	
	wire Q0, Q1, Q2;
 
	Counter3Bits C3Bits(
		.clk(divided1),
		.reset(reset),
		.Q0(Q0),
		.Q1(Q1),
		.Q2(Q2)
	);
	
	
	Display1 display1(
		.A(Q0),
		.B(Q1),
		.C(Q2),
		.segs(segs[11:0])
	);
	
endmodule
