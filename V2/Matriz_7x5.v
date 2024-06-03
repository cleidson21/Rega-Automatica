module Matriz_7x5 (img_sel, lin, col, Sel, Crit, Baix, Medi, Alto, Aspe, Gote);

	// Declaracao de portas
	input [2:0] Sel;									// Seletor com clock mais rapido para varredura (3 bits) - B
   input [2:0] img_sel;	 						   // Seleção de imagem com clock mais lento para alternância (3 bits) - A
	input Crit, Baix, Medi, Alto, Aspe, Gote; //	Entradas dos tipos de imagem (6 tipos)
	output [6:0] lin; 								// Linhas da Matriz com Valor Logico Baixo para funcionar.
	output [4:0] col; 								// Colunas da Matriz com Valor Logico Alto para funcionar.
	
	
	// Fios Intermediarios
	wire Selecao_3b_Clock, Crit_001, Baix_010, Med_011, Alt_100, Asp_101, Got_110;
	
	// Varredura das linhas com Seletor A (mais rapido)
	demux_1x7 Linhas7 (
        .in(1'b0),
        .S(Sel),
        .Out0(lin[0]),
        .Out1(lin[1]),
        .Out2(lin[2]),
        .Out3(lin[3]),
        .Out4(lin[4]),
        .Out5(lin[5]),
        .Out6(lin[6]),
    );
	
	// Multiplexação de 3 bits de saida das entradas do sistema com Seletor B (mais lento) para Alternar.
	Seletor_img Sel1 (.out(Selecao_3b_Clock), 
							.I0(Crit), 
							.I1(Baix), 
							.I2(Medi), 
							.I3(Alto), 
							.I4(Aspe), 
							.I5(Gote), 
							.S(img_sel)
	);
	
	// Demultiplexação com seleção de imagem e alternância entre Nivel e Tipo de Rega
	demux_1x6 Nivel1 (.in(1'b1), 
							.S(Selecao_3b_Clock), 
							.Out0(Crit_001), 
							.Out1(Baix_010), 
							.Out2(Med_011), 
							.Out3(Alt_100), 
							.Out4(Asp_101),
							.Out5(Got_110)
		);
	
	// Demultiplexação para a saída das colunas
	demux_Colunas Colunas5 (.Crit_001(Crit_001), 
									.Baix_010(Baix_010), 
									.Med_011(Med_011), 
									.Alt_100(Alt_100), 
									.Asp_101(Asp_101), 
									.Got_110(Got_110), 
									.S(Sel), 
									.Out0(col[0]), 
									.Out1(col[1]), 
									.Out2(col[2]), 
									.Out3(col[3]), 
									.Out4(col[4])
	);
	 
endmodule	 