module main_p(
	input on_liga,
	input clk, bot,
	output [11:0] segf
	
);

wire [11:0] seg0, seg1;

esc_clk sai15(clk, Q15, Q23, Q24, Q25);
// saida do bouncer, me da um pulso
deboun testa_b(Q15, bot, pul);
// conta tempo
conta2 conte2(pul, D, E);
// demux para mudar Q com (D e E)
demux_01 mude(D, E, Q23, Q24, Q25, Q);
// com base em D e E, habilita a velocidade desejada
conta3 conte3(Q, A, B, C);
// saida do display para valores de A até E
out07seg temp(A, B, C, seg0);
out17seg acao(D, E, seg1);
// multiplexar para alternar entre os displays
mux_01 multiplexa(seg0, seg1, Q15, seg);
// acionamento da chave liga desliga
and(segf[11:0], seg, on_liga);

endmodule
// feito apenas com logica de circuito combinacional e estrutural 
