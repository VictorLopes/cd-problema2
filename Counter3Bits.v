
module Counter3Bits (
    input clk,
    input reset,
    output Q0,
	 output Q1,
	 output Q2
);

    wire WReset;

    T_FlipFlop TFF0 (
        .T(1),
        .clk(clk),
        .reset(reset),
        .Q(Q0)
    );

    T_FlipFlop TFF1 (
        .T(Q0),
        .clk(clk),
        .reset(WReset),
        .Q(Q1)
    );
	 
	 wire ANDQ;
	 and(ANDQ, Q0, Q1);


    T_FlipFlop TFF2 (
        .T(ANDQ),
        .clk(clk),
        .reset(WReset),
        .Q(Q2)
    );
	 
	 and(WReset, Q0, Q1, Q2);

endmodule
