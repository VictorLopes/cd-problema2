module Display1 (
	input A, 
	input B, 
	input C, 
	input on, 
	output [11:0] segs
);		
	wire NA, NB, NC;
	
	not(NA, A);
	not(NB, B);
	not(NC, C);
	
	// A
	wire AND0_A, AND1_A;

	and(AND0_A, NA, B, C);
	and(AND1_A, A, NB, C);
	or(segs[0], AND0_A, AND1_A);

	// B
	wire AND0_B, AND1_B, OR0_B;

	and(AND0_B, NA, B);
	or(OR0_B, AND0_B, B);
	and(AND1_B, A, NB);
	or(segs[1], AND0_B, AND1_B);

	// C
	and(segs[2], NA, B);

	// D
	and(segs[3], NA, NB, C);

	// E
	and(segs[4], A, NB, NC);
	
	// F ( nao precisa, ele vai ficar sempre ligado -> 0)
	not (segs[5], 0);

	// G
	wire AND0_G, AND1_G, AND2_G;
	and(AND0_G, NA, B, NC);
	and(AND1_G, NA, B, C);
	and(AND2_G, A, B, NC);
	or(segs[6], AND0_G, AND1_G, AND2_G);

	// Saida H (nao precisa, ele vai ficar sempre ligado -> 0)
	not (segs[7], 1);

	// Saida I ( ponto sempre desligado)
	not (segs[8], 0);
	
	// Desliga saidas de display(isso tem que mudar porque tem o de velocidade
	not (segs[9], 0);
	not (segs[10], 0);
	not (segs[11], 0);
	
	// Desliga todos quando o clock for 0
	
	 
	 
endmodule
