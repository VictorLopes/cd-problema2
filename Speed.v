module Speed (
	input reset,
	input clk,
	output [3:0] speed
);
	wire divided10, divided15;
	
	ClockDivider10 div1 (
	  .clk(clk),
	  .reset(reset),
	  .T(1),
	  .Q(divided10)
	);
	
	// 15 divisões
	ClockDivider5 div2 (
	  .clk(divided10),
	  .reset(reset),
	  .T(1),
	  .Q(speed[0])
	);
	
	// 25 divisões
	ClockDivider10 div3 (
	  .clk(speed[0]),
	  .reset(reset),
	  .T(1),
	  .Q(speed[1])
	);
	
	// 26 divisões
	T_FlipFlop div4(
		.clk(speed[1]),
		.reset(reset),
		.T(1),
		.Q(speed[2])
	);
	
	// 27 divisões
	T_FlipFlop div5(
		.clk(speed[2]),
		.reset(reset),
		.T(1),
		.Q(speed[3])
	);
	
endmodule
