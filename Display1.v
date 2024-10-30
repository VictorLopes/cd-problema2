module Display1 (
	 input Bit0,
	 input Bit1,
	 input Bit2,
    output QA,
	 output QB,
	 output QC,
	 output QD,
	 output QE,
	 output QF,
	 output QG,
	 output QP
);
	wire NBit0, NBit1, NBit2;
	
	not(NBit0, Bit0);
	not(NBit1, Bit1);
	not(NBit2, Bit2);
	
	// A
	wire AND0_A, AND1_A;

	and(AND0_A, NBit0, Bit1, Bit2);
	and(AND1_A, Bit0, NBit1, Bit2);
	or(QA, AND0_A, AND1_A);

	// B
	wire AND0_B, AND1_B, OR0_B;

	and(AND0_B, NBit0, Bit1);
	or(OR0_B, AND0_B, Bit1);
	and(AND1_B, Bit0, NBit1);
	or(QB, AND0_B, AND1_B);

	// C
	and(QC, NBit0, Bit1);

	// D
	and(QD, NBit0, NBit1, Bit2);

	// E
	and(QE, Bit0, NBit1, NBit2);


	// G
	wire AND0_G, AND1_G, AND2_G;
	and(AND0_G, NBit0, Bit1, NBit2);
	and(AND1_G, NBit0, Bit1, Bit2);
	and(AND2_G, Bit0, Bit1, NBit2);
	or(QG, AND0_G, AND1_G, AND2_G);

	// P
	or(QP, Bit0, Bit1, Bit2);
	 
	 
endmodule
