module esc_clk(
    input clk,
//   input rst,
//   input t,
    output Q15, Q23, Q24, Q25
);
	 
wire [26:0]q;
wire rst, t;
not (rst, 1'b0);
// assign rst = 1'b1;
not (t, 1'b0);
// assign t = 1'b1;

t_ff(clk, rst, t, q[0]);
t_ff(q[0], rst, t, q[1]);
t_ff(q[1], rst, t, q[2]);
t_ff(q[2], rst, t, q[3]);
t_ff(q[3], rst, t, q[4]);
// 1.562.500 pulsos por s
t_ff(q[4], rst, t, q[5]);
t_ff(q[5], rst, t, q[6]);
t_ff(q[6], rst, t, q[7]);
t_ff(q[7], rst, t, q[8]);
t_ff(q[8], rst, t, q[9]);
// 48.828 pulsos por s
t_ff(q[9], rst, t, q[10]);
t_ff(q[10], rst, t, q[11]);
t_ff(q[11], rst, t, q[12]);
t_ff(q[12], rst, t, q[13]);
t_ff(q[13], rst, t, q[14]);
// 1.525 pulsos por s
t_ff(q[14], rst, t, q[15]);
t_ff(q[15], rst, t, q[16]);
t_ff(q[16], rst, t, q[17]);
t_ff(q[17], rst, t, q[18]);
t_ff(q[18], rst, t, q[19]);
// 47 pulsos por s
t_ff(q[19], rst, t, q[20]);
t_ff(q[20], rst, t, q[21]);
t_ff(q[21], rst, t, q[22]);
t_ff(q[22], rst, t, q[23]);
t_ff(q[23], rst, t, q[24]);
// 1,49 pulsos por s
t_ff(q[24], rst, t, q[25]);

or(Q15, q[15]);
or(Q23, q[23]);
or(Q24, q[24]);
or(Q25, q[25]);

endmodule
