module T_FlipFlop (
    input T,
    input clk,
    input reset,
    output reg Q
);
	always @(posedge clk) begin
		if (reset)
			Q <= 0;
		else
			if (T)
				Q <= ~Q;
		else
				Q <= Q;
	end
endmodule
