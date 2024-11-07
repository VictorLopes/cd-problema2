module Display2 (
	input A, 
	input B, 

	output [11:0] segs
);	
	and(segs[0], B); // A
	and(segs[1], 0); // B
	and(segs[2], A); // C
	and(segs[3], B); // D
	and(segs[4], B); // E
	and(segs[5], A); // F
	and(segs[6], 0); // G
	

	// Saida H ( nao precisa, ele vai ficar sempre ligado -> 0)
	not (segs[9], 1);

	// Saida I ( ponto sempre desligado)
	not (segs[8], 0);
	
	// Desliga saidas de display( isso tem que mudar porque tem o de veloidade
	not (segs[7], 1);
	not (segs[10], 0);
	not (segs[11], 0);
	 
	 
endmodule
