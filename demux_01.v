module demux_01(
	input D, E,
	input Q23, Q24, Q25,
	output Q
);

not(ND, D);
not(NE, E);

and(S1, ND, NE);
and(S2, D, NE);
and(S3, ND, E);
and(S4, D, E);

and(T1, S1, 1'b1);
and(T2, S2, Q23);
and(T3, S3, Q24);
and(T4, S4, Q25);


or(Q, T1, T2, T3, T4);

endmodule