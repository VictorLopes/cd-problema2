module ClockDivider10 (
    input clk,
    input reset,
	 input T,
    output Q
);
    wire Q0;

	ClockDivider5 DIV1(
		.clk(clk),
		.reset(reset),
		.T(T),
		.Q(Q0)
	);
	
	ClockDivider5 DIV2(
		.clk(Q0),
		.reset(reset),
		.T(T),
		.Q(Q)
	);
	 
endmodule
