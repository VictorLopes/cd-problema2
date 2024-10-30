module ClockDivider5 (
    input clk,
    input reset,
	 input T,
    output Q
);
    wire Q1, Q2, Q3, Q4;

    T_FlipFlop TFF1 (
        .T(T),
        .clk(clk),
        .reset(reset),
        .Q(Q1)
    );

    
    T_FlipFlop TFF2 (
        .T(T),
        .clk(Q1),
        .reset(reset),
        .Q(Q2)
    );
	 
	 T_FlipFlop TFF3 (
        .T(T),
        .clk(Q2),
        .reset(reset),
        .Q(Q3)
    );
	 
	 T_FlipFlop TFF4 (
        .T(T),
        .clk(Q3),
        .reset(reset),
        .Q(Q4)
    );
	 
	 T_FlipFlop TFF5 (
        .T(T),
        .clk(Q4),
        .reset(reset),
        .Q(Q)
    );
	 
endmodule
