// Declaracao do modulo do Demultiplexador de 5 saidas e 6 entradas com seletor de 3 bits
module decod_Colunas (Critico, Baixo, Medio, Alto, Aspersao, Gotejamento, S, Out0, Out1, Out2, Out3, Out4);

	// Declaracao de portas
	input Critico, Baixo, Medio, Alto, Aspersao, Gotejamento;    // Entradas imagens com alternacia pelo tempo (Clock)
   input [2:0] S;      		 												 // Seletor de 3 bits 
	output Out0, Out1, Out2, Out3, Out4; 								 // 5 saídas
	
	// Declaração de fios para os complementos do seletor
	wire notS0, notS1;																		// Fios de Inversão do Seletor
	wire Centro_Crit, Centro_Bai, Centro_Med;          							// Fios colunas de nivel
	wire And_S2_S0, And_S2_S1, And_S1_S0, And_nS1_nS0;								// Fios Expressões "and" comuns as formulas											
	wire And_S2_S1_S0, And_S2_nS1, And_S2_nS0;										// Fios Expressões "and" comuns as formulas	
	wire Aux_Baixo, Aux_Med;																// Fios da expressões de Nivel
	wire Aux_Asper1, Asper_0e4, Asper_1e3, Aux_Asper2, Asper_2; 				// Fios da expressões de Aspersão
	wire Aux_Gotej1, Gotej_0e4, Gotej_1e3, Aux_Gotej2, Gotej_2;					// Fios da expressões de Gotejamento

    // Inversores para os bits do seletor
    not (notS0, S[0]);
    not (notS1, S[1]);
	
	// Expressões and comuns entra as expressões
	and and1 (And_S2_S0, S[2], S[0]);
	and and2 (And_S2_S1, S[2], S[1]);
	and and3 (And_S1_S0, S[1], S[0]);
	and and4 (And_nS1_nS0, notS1, notS0);
	and and5 (And_S2_S1_S0, S[2], S[1], S[0]);
	and and6 (And_S2_nS1, S[2], notS1);
	and and7 (And_S2_nS0, S[2], notS0);
	
	
	// Expressão especifica do nivel Crítico
	and Crit1 (Centro_Crit, S[2], S[1], S[0], Critico);
	
	// Expressão especifica do nivel Baixo
	or Aux1 (Aux_Baixo, And_S2_S0, And_S2_S1);
	and Baix1 (Centro_Bai, Aux_Baixo, Baixo);
	
	// Expressão especifica do nivel Medio
	or Aux2 (Aux_Med, And_S1_S0, S[2]);
	and Medio1 (Centro_Med, Aux_Med, Medio);
	
	// Expressão especifica coluna 0 e 4 da Aspersão
	and Asper1 (Asper_0e4, Aspersao, S[1], S[0]);
	
	// Expressão especifica coluna 1 e 3 da Aspersão
	or Aux3 (Aux_Asper1, And_nS1_nS0, And_S2_S1_S0);
	and Asper2 (Asper_1e3, Aspersao, Aux_Asper1);
	
	// Expressão especifica coluna 2 da Aspersão
	or Aux4 (Aux_Asper2, S[1], And_S2_S0);
	and Asper3 (Asper_2, Aspersao, Aux_Asper2);
	
	// Expressão especifica coluna 0 e 4 do Gotejamento
	and Gotej1 (Gotej_0e4, Gotejamento, S[2], notS1, S[0]);
	
	// Expressão especifica coluna 1 e 3 do Gotejamento
	or Aux5 (Aux_Gotej1, And_S2_nS1, And_S2_nS0);
	and Gotej2 (Gotej_1e3, Gotejamento, Aux_Gotej1);
	
	// Expressão especifica coluna 2 do Gotejamento
	or Aux6 (Aux_Gotej2, S[2], S[1]);
	and Gotej3 (Gotej_2, Gotejamento, Aux_Gotej2);
	
	// Saidas para as colunas
	
	//Coluna M1_Crit0
	or M1_C0 (Out0, Critico, Baixo, Medio, Alto, Asper_0e4, Gotej_0e4); 
	//Coluna M1_Crit1
	or M1_C1 (Out1, Centro_Crit, Centro_Bai, Centro_Med, Alto, Asper_1e3, Gotej_1e3);
	//Coluna M1_Crit2
	or M1_C2 (Out2, Centro_Crit, Centro_Bai, Centro_Med, Alto, Asper_2, Gotej_2);	
	//Coluna M1_Crit3
	or M1_C3 (Out3, Centro_Crit, Centro_Bai, Centro_Med, Alto, Asper_1e3, Gotej_1e3);	
	//Coluna M1_Crit4
	or M1_C4 (Out4, Critico, Baixo, Medio, Alto, Asper_0e4, Gotej_0e4); 
	
	
	
endmodule 