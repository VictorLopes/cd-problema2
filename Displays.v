module Displays(
	input [2:0] bits,
	input reset,
	input clk,
	output [11:0] segs
);

	wire divided20, divided1, divided2;

	ClockDivider10 div1 (
	  .clk(clk),
	  .reset(reset),
	  .T(1),
	  .Q(divided10)
	);
	
	T_FlipFlop div2(
		.clk(divided10),
		.reset(reset),
		.T(1),
		.Q(divided1)
	);
	
	T_FlipFlop div3(
		.clk(divided1),
		.reset(reset),
		.T(1),
		.Q(divided2)
	);
	
	wire Ndivided2;
	
	not (Ndivided2, divided2);
	
	wire [11:0] display1_segs, display2_segs;
	
	Display1 display1(
		.A(bits[0]),
		.B(bits[1]),
		.C(bits[2]),
		.on(divided2),
		.segs(display1_segs[11:0])
	);
	
	Display2 display2(
		.A(bits[0]),
		.B(bits[1]),
		.C(bits[2]),
		.on(Ndivided2),
		.segs(display2_segs[11:0])
	);
	
	or(segs[0], display1_segs[0], display2_segs[0]);
	or(segs[1], display1_segs[1], display2_segs[1]);
	or(segs[2], display1_segs[2], display2_segs[2]);
	or(segs[3], display1_segs[3], display2_segs[3]);
	or(segs[4], display1_segs[4], display2_segs[4]);
	or(segs[5], display1_segs[5], display2_segs[5]);
	or(segs[6], display1_segs[6], display2_segs[6]);
	or(segs[7], display1_segs[7], display2_segs[7]);
	or(segs[8], display1_segs[8], display2_segs[8]);
	or(segs[9], display1_segs[9], display2_segs[9]);
	or(segs[10], display1_segs[10], display2_segs[10]);
	or(segs[11], display1_segs[11], display2_segs[11]);
	
endmodule
