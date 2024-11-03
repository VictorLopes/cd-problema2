module Display1Bkp(A, B, C,segs[11:0]);
	input A;
	input B;
	input C;

	// output segA, segB, segC, segD, segE, segF, segG, segH, segI, des1, des2, des3;
	output [11:0] segs;
	not(NA, A);
	not(NB, B);
	not(NC, C);
	 
	// saida A
	wire orA, orB, orC;

	and(orA, NB, NA, NC);
	and(orB, NA, B, C);
	and(orC, NB, A, C);

	or (segs[0], orA, orB, orC);
	
	// saida B
	or (segs[1], A, B, NC);
	
	// saida C
	wire orA2, orB2, orC2;
	
	and (orA2, NA, NC);
	and (orB2, NA, B);
	and (orC2, B, C);

	or (segs[2], orA2, orB2, orC2);
	
	// saida D
	and (segs[3], NA, NB);
	
	// saida E
	and (segs[4], NB, NC);

	// saida F
	and (segs[5], NA, NB, NC);

	// saida G
	wire orA6, orB6, orC6;

	and(orA6, NA, B);
	and(orB6, B, NC);
	and(orC6, NA, NC);
	
	or(segs[6], orA6, orB6, orC6);
	

	// saida H ( nao precisa, ele vai ficar sempre ligado -> 0)
	not (segs[7], 1);

	// saida I ( ponto sempre desligado)
	not (segs[8], 0);

	// desliga saidas de display( isso tem que mudar porque tem o de veloidade
	not (segs[9], 0);
	not (segs[10], 0);
	not (segs[11], 0);	

endmodule

