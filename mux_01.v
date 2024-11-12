module mux_01(
	input [11:0] seg0,
	input [11:0] seg1,
	input clk,
	output [11:0] seg_fin
	);

wire neg_clk;
not(neg_clk, clk);

wire [11:0]acao;
wire [11:0]temp;

// and(acao[11:0], seg0[11:0], {12{clk}});
// and(temp[11:0], seg1[11:0], {12{neg_clk}});
// or(seg_fin[11:0], acao[11:0], temp[11:0]);

and(acao[0], seg0[0], clk);
and(temp[0], seg1[0], neg_clk);
or(seg_fin[0], acao[0], temp[0]);

and(acao[1], seg0[1], clk);
and(temp[1], seg1[1], neg_clk);
or(seg_fin[1], acao[1], temp[1]);

and(acao[2], seg0[2], clk);
and(temp[2], seg1[2], neg_clk);
or(seg_fin[2], acao[2], temp[2]);

and(acao[3], seg0[3], clk);
and(temp[3], seg1[3], neg_clk);
or(seg_fin[3], acao[3], temp[3]);

and(acao[4], seg0[4], clk);
and(temp[4], seg1[4], neg_clk);
or(seg_fin[4], acao[4], temp[4]);

and(acao[5], seg0[5], clk);
and(temp[5], seg1[5], neg_clk);
or(seg_fin[5], acao[5], temp[5]);

and(acao[6], seg0[6], clk);
and(temp[6], seg1[6], neg_clk);
or(seg_fin[6], acao[6], temp[6]);

and(acao[7], seg0[7], clk);
and(temp[7], seg1[7], neg_clk);
or(seg_fin[7], acao[7], temp[7]);

and(acao[8], seg0[8], clk);
and(temp[8], seg1[8], neg_clk);
or(seg_fin[8], acao[8], temp[8]);

and(acao[9], seg0[9], clk);
and(temp[9], seg1[9], neg_clk);
or(seg_fin[9], acao[9], temp[9]);

and(acao[10], seg0[10], clk);
and(temp[10], seg1[10], neg_clk);
or(seg_fin[10], acao[10], temp[10]);

and(acao[11], seg0[11], clk);
and(temp[11], seg1[11], neg_clk);
or(seg_fin[11], acao[11], temp[11]);

endmodule









