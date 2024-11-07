module Displays(
	input [2:0] bits,
	input reset,
	input clk,
	input v1,
	input v2,
	output [11:0] segs
);
	
	wire Ndivided2;
	
	not(Ndivided2, clk);
	
	wire [11:0] display1_segs, display2_segs;
	
	Display1 display1(
		.A(bits[0]),
		.B(bits[1]),
		.C(bits[2]),
		.segs(display1_segs)
	);
	
	Display2 display2(
		.A(v1),
		.B(v2),
		.segs(display2_segs)
	);
	
	wire [11:0]acao;
	wire [11:0]temp;

	/* and(acao[11:0], display1_segs[11:0], {12{divided5}});
	and(temp[11:0], display2_segs[11:0], {12{Ndivided2}});
	or(segs[11:0], temp[11:0], acao[11:0]); */
	
	and(temp[0], display2_segs[0], divided5);
	and(acao[0], display1_segs[0], Ndivided2);
	or(segs[0], acao[0], temp[0]);

	and(temp[1], display2_segs[1], clk);
	and(acao[1], display1_segs[1], Ndivided2);
	or(segs[1], acao[1], temp[1]);

	and(temp[2], display2_segs[2], clk);
	and(acao[2], display1_segs[2], Ndivided2);
	or(segs[2], acao[2], temp[2]);

	and(temp[3], display2_segs[3], clk);
	and(acao[3], display1_segs[3], Ndivided2);
	or(segs[3], acao[3], temp[3]);

	and(temp[4], display2_segs[4], clk);
	and(acao[4], display1_segs[4], Ndivided2);
	or(segs[4], acao[4], temp[4]);

	and(temp[5], display2_segs[5], clk);
	and(acao[5], display1_segs[5], Ndivided2);
	or(segs[5], acao[5], temp[5]);

	and(temp[6], display2_segs[6], clk);
	and(acao[6], display1_segs[6], Ndivided2);
	or(segs[6], acao[6], temp[6]);

	and(temp[7], 0, clk);
	and(acao[7], 1, Ndivided2);
	or(segs[7], acao[7], temp[7]);

	and(temp[8], display2_segs[8], clk);
	and(acao[8], display1_segs[8], Ndivided2);
	or(segs[8], acao[8], temp[8]);

	and(temp[9], 1, clk);
	and(acao[9], 0, Ndivided2);
	or(segs[9], acao[9], temp[9]);

	and(temp[10], display2_segs[10], clk);
	and(acao[10], display1_segs[10], Ndivided2);
	or(segs[10], acao[10], temp[10]);

	and(temp[11], display2_segs[11], clk);
	and(acao[11], display1_segs[11], Ndivided2);
	or(segs[11], acao[11], temp[11]);



endmodule
