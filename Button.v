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
		  .T(1),
        .Q(DQ1)
    );
	 
	 ClockDivider5 DIV2 (
		.clk(DQ1),
		.reset(reset),
		.T(1),
		.Q(DQ2)
	 );
	 
	 wire ClockAndButton;
	 and(ClockAndButton, DQ2, B);
	 
	 // Counter
	 T_FlipFlop TFF1(
        .T(B),
        .clk(DQ2),
        .reset(reset),
        .Q(Q1)
    );
	 
	 
	 T_FlipFlop TFF2(
        .T(Q1),
        .clk(ClockAndButton),
        .reset(reset),
        .Q(Q2)
    );

endmodule
