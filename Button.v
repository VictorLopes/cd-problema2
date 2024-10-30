module Button (
    input clk,
	 input reset,
	 input B,
    output Q1,
	 output Q2
);

	// Debounce
    wire DQ1, DQ2;
    ClockDivider10 DIV1 (
        .clk(clk),
        .reset(reset),
		  .T(1'b0),
        .Q(DQ1)
    );
	 
	 ClockDivider5 DIV2 (
		.clk(DQ1),
		.reset(reset),
		.T(1'b0),
		.Q(DQ2)
	 );
	 
	 
	 
	 // Counter
	 T_FlipFlop TFF1(
        .T(B),
        .clk(DQ2),
        .reset(reset),
        .Q(Q1)
    );
	 
	 // Multex
	 wire NotClock, FF2Clock;
	 not(NotClock, DQ2);
	 and(FF2Clock, NotClock, B);
	 
	 
	 T_FlipFlop TFF2(
        .T(Q1),
        .clk(FF2Clock),
        .reset(reset),
        .Q(Q2)
    );

endmodule
