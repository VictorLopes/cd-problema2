module Counter3Bits (
    input clk,
    input reset,
    output [2:0] Q
);

    wire WReset;

    T_FlipFlop TFF0 (
        .T(1),
        .clk(clk),
        .reset(reset),
        .Q(Q[2])
    );

    T_FlipFlop TFF1 (
        .T(Q[2]),
        .clk(clk),
        .reset(WReset),
        .Q(Q[1])
    );
	 
	 wire ANDQ;
	 and(ANDQ, Q[2], Q[1]);

    T_FlipFlop TFF2 (
        .T(ANDQ),
        .clk(clk),
        .reset(WReset),
        .Q(Q[0])
    );
	 
	 and(WReset, Q[0], Q[1], Q[2]);

endmodule
