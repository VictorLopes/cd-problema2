module deboun(
	input clk, bot,
	output Q
);

wire [1:0]q;
wire rst, t;
not (rst, 1'b0);

t_ff(clk, rst, bot, q[0]);
t_ff(clk, rst, q[0], q[1]);

not(Nq1, q[1]);

and(Q, Nq1, q[0]);


endmodule