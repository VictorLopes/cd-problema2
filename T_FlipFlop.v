module T_FlipFlop (
    input T,
    input clk,
    input reset,
    output reg Q
);
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			Q <= 1'b0;
		end else if (T) begin
			Q <= ~Q;
		end
	end
endmodule
