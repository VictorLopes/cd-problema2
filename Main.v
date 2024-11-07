module Main(
	input clk,
	input reset,
	input btn,
	output [11:0] segs
);
	wire NBtn, BtnBit0, BtnBit1;
	wire Qbit1, Qbit2;
	wire [3:0] spd;
	
	not(NBtn, btn);
	
	Button button(
		.clk(spd[0]),
		.reset(reset),
		.B(NBtn),
		.Q1(BtnBit0),
		.Q2(BtnBit1)
	);
	
	
	Speed speed(
		.reset(NBtn),
		.clk(clk),
		.speed(spd)
	);
	
	wire divided_clk;
	
	Multex multex(
		.A(BtnBit0),
		.B(BtnBit1),
		.clk(spd),
		.Qbit1(Qbit1),
		.Qbit2(Qbit2),
		.Q(divided_clk)
	);
	
	wire [2:0] Q;
 
	
	
	Counter3Bits C3Bits(
		.clk(divided_clk),
		.reset(reset),
		.Q(Q)
	);
	
	Displays displays(
		.bits(Q),
		.segs(segs),
		.v1(Qbit1),
		.v2(Qbit2),
		.clk(spd[0])
	);
	
endmodule
