module Main(
	input clk,
	input reset,
	input btn,
	output A,
	output B,
	output C,
	output D,
	output E,
	output F,
	output G,
	output P
);

	wire BtnBit0, BtnBit1;
	
	Button button(
		.clk(clk),
		.reset(reset),
		.B(btn),
		.Q1(BtnBit0),
		.Q2(BtnBit1)
	);
	
	wire divided;
	
	ClockDivider20 DIV (
	  .clk(clk),
	  .reset(reset),
	  .T(T),
	  .Q(divided)
	);
	
	wire Q0, Q1, Q2;
 
	Counter3Bits C3Bits(
		.clk(divided),
		.reset(reset),
		.T(1'b0),
		.Q0(Q0),
		.Q1(Q1),
		.Q2(Q2)
	);
	
	
	Display1 display1(
		.Bit0(Q0),
		.Bit1(Q1),
		.Bit2(Q2),
		.QA(A),
		.QB(B),
		.QC(C),
		.QD(D),
		.QE(E),
		.QF(F),
		.QG(G),
		.QP(P)
	);
	
endmodule
