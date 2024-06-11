
module Matriz_7x5 (img_sel, lin, col, Clock_Linhas, Critico, Baixo, Medio, Alto, Aspersao, Gotejamento);

	// Declaracao de portas
	input [2:0] Clock_Linhas;													// Seletor com clock mais rapido para varredura (3 bits) - B
   input img_sel;	 						        								// Seleção de imagem com clock mais lento para alternância (1 bit) - A
	input Critico, Baixo, Medio, Alto, Aspersao, Gotejamento; 		//	Entradas dos tipos de imagem (6 tipos)
	output [6:0] lin; 														   // Linhas da Matriz com Valor Logico Baixo para funcionar.
	output [4:0] col; 															// Colunas da Matriz com Valor Logico Alto para funcionar.
	
	
	// Fios Intermediarios
	wire Coluna_Crit, Coluna_Bai, Coluna_Med, Coluna_Alt, Coluna_Asp, Coluna_Got;
	wire Not_Img_sel;
	
	// Inversão do seletor de imagem
	not (Not_Img_sel, img_sel);
	
	// Varredura das linhas com Seletor A (mais rapido)
	demux_1x7 Linhas7 (
        .in(1'b0),
        .S(Clock_Linhas),
        .Out0(lin[0]),
        .Out1(lin[1]),
        .Out2(lin[2]),
        .Out3(lin[3]),
        .Out4(lin[4]),
        .Out5(lin[5]),
        .Out6(lin[6]),
    );
	
	// Seletor de imagem com alternância pelo clock
	and Imagem_Critico (Coluna_Crit, Critico);
	and Imagem_Baixo (Coluna_Bai, Not_Img_sel, Baixo);
	and Imagem_Medio (Coluna_Med, Not_Img_sel, Medio);
	and Imagem_Alto (Coluna_Alt, Not_Img_sel, Alto);
	and Imagem_Aspersao (Coluna_Asp, img_sel, Aspersao);
	and Imagem_Gotejamento (Coluna_Got, img_sel, Gotejamento);

	// Decodificacao para a saída das colunas
	decod_Colunas Colunas5 (.Critico(Coluna_Crit), 
									.Baixo(Coluna_Bai), 
									.Medio(Coluna_Med), 
									.Alto(Coluna_Alt), 
									.Aspersao(Coluna_Asp), 
									.Gotejamento(Coluna_Got), 
									.S(Clock_Linhas), 
									.Out0(col[0]), 
									.Out1(col[1]), 
									.Out2(col[2]), 
									.Out3(col[3]), 
									.Out4(col[4])
	);
	
endmodule 