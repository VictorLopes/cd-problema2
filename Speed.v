module Speed (
	input reset,
	input clk,
	output [2:0] speed
);
	wire divided20;
	
	ClockDivider20 div1 (
	  .clk(clk),
	  .reset(reset),
	  .T(1),
	  .Q(divided20)
	);
	
	ClockDivider5 div2 (
	  .clk(divided20),
	  .reset(reset),
	  .T(1),
	  .Q(speed[0])
	);
	
	T_FlipFlop div3(
		.clk(speed[0]),
		.reset(reset),
		.T(1),
		.Q(speed[1])
	);
	
	T_FlipFlop div4(
		.clk(speed[1]),
		.reset(reset),
		.T(1),
		.Q(speed[2])
	);
	
endmodule
