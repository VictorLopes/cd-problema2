module Multex (
    input A,
	 input B,
	 input [2:0] clk,
	 output Q
);
	
	wire NA, NB;
	
	not(NA, A);
	not(NB, B);
	
	wire Q1, Q2, Q3, NQ1, NQ2, NQ3;
	
	and(Q1, A, NB);
	and(Q2, NA, B);
	and(Q3, A, B);
	
	not(NQ1, Q1);
	not(NQ2, Q2);
	not(NQ3, Q3);
	
	wire M1, M2, M3;
	
	and(M1, Q1, NQ2, NQ3, clk[0]);
	and(M2, NQ1, Q2, NQ3, clk[1]);
	and(M3, NQ1, NQ2, Q3, clk[2]);
	
	or(Q, M1, M2, M3);
	
endmodule