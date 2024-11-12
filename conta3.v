module conta3(
	input clk,
	output Q1, Q2, Q3
);

wire [2:0]q;
wire rst, t;
not (rst, 1'b0);
// assign rst = 1'b1;
not (t, 1'b0);
// assign t = 1'b1;

t_ff(clk, rst, t, q[0]);
t_ff(q[0], rst, t, q[1]);
t_ff(q[1], rst, t, q[2]);

or(Q1, q[0]);
or(Q2, q[1]);
or(Q3, q[2]);

endmodule