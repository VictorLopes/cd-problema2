module out17seg(D, E, segs[11:0]);
	input D;
	input E;
    // output segA, segB, segC, segD, segE, segF, segG 0-6
	 // ponto, 7
	 // 8 ponto
	 // de 9 a 11, display 2, 3 e 4 respectivamente
    output [11:0] segs;
	
not(ND, D);
not(NE, E);

// saida A

	and(segs[0], D, NE);
	
// saida B

	not(segs[1], 1);
	
// saida C

	and(segs[2], ND,E);
	
// saida D

   and(segs[3], D, NE);
	
// saida E

   and(segs[4], D, NE);
	
// saida F

	and(segs[5], ND,E);

// saida G

	and(segs[6], ND, NE);		
	
// ponto sempre desligado

	not (segs[7], 0);
	
// display1
	not (segs[8], 0);
// display2
	not (segs[9], 0);
// display3
	not (segs[10], 0);
// display4
	not (segs[11], 1);
endmodule
