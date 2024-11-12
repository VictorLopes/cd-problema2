module conta2(
	input clk,
	output Q1, Q2
);

wire [1:0]q;
wire rst, t;
not (rst, 1'b0);
not (t, 1'b0);

t_ff(clk, rst, t, q[0]);
t_ff(q[0], rst, t, q[1]);

or(Q1, q[0]);
or(Q2, q[1]);

endmodule