module Button (
    input clk,
	 input reset,
	 input B,
    output Q1,
	 output Q2
);

	// Debounce (Clock entra com 15 divisões)	 
	 wire ClockAndButton;
	 and(ClockAndButton, clk, B);
	 
	 // Counter
	 T_FlipFlop TFF1(
        .T(B),
        .clk(clk),
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
