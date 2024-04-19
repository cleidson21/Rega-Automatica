// Declaracao do modulo
module NivelErro (H, M, L, Ve, Al, ERRO, Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto);

	// Declaracao de portas
	input H, M, L;
	output Ve, Al, ERRO, Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto;
	
	// Declaracao dos fios intermediarios
	wire Wire_nh, Wire_nm, Wire_nl, wire_nE1, wire_nE2, Wire_V;
	
	// Funcionamento do circuito
	
	// Fios com negações das entradas
	not h1 (Wire_nh, H);
	not m1 (Wire_nm, M);
	not l1 (Wire_nl, L);
	
	//Conversao das entradas em 1 bit
	
	// Nivel Critico (Caso a espressão booleana H'.M'.L')
	nor crit (Nv_Critico, H, M, L);
	
	// Nivel Baixo (Caso a espressão booleana H'.M'.L)
	and bai (Nv_Baixo, Wire_nh, Wire_nm, L);
	
	// Nivel Medio (Caso a espressão booleana H'.M.L)
	and med (Nv_Medio, Wire_nh, M, L);
	
	// Nivel Alto (Caso a espressão booleana H'.M.L)
	and alt (Nv_Alto, H, M, L); // Coincide com o erro)
	
	// Tratamento de Erro
	and err1 (wire_nE1, Wire_nl, M);
	and err2 (wire_nE2, Wire_nm, H);
	or err3 (ERRO, wire_nE1, wire_nE2);
	
	// Tratamento da Abertura da entrada da Caixa d'água
	or ve1 (Wire_V, Wire_nm, L);
	and ve2 (Ve, Wire_V, Wire_nh);
	
	// Tratamento do Alarme
	or al (Al, Wire_nh, Wire_nl);
	
endmodule 
