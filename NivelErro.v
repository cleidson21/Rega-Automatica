// Declaracao do modulo
module NivelErro (H, M, L, Ve, Al, ERRO, Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto);

	// Declaracao de portas
	input H, M, L;
	output Ve, Al, ERRO;
	output Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto;
	
	// Declaracao dos fios intermediarios
	wire Wire_nh, Wire_nm, Wire_nl, wire_nE1, wire_nE2, Wire_V;
	
	// Funcionamento do circuito
	
	//Nivel Critico
	and N_cri (Nv_Critico, Wire_nh, Wire_nm, Wire_nl);
	
	//Nivel Baixo
	and N_bai (Nv_Baixo, Wire_nh, Wire_nm, L);
	
	//Nivel Medio
	and N_med (Nv_Medio, Wire_nh, M, L);
	
	//Nivel Alto
	and N_alt (Nv_Alto, H, M, L);
	
	// Fios com negações das entradas
	not Not_H1 (Wire_nh, H);
	not Not_M1 (Wire_nm, M);
	not Not_L1 (Wire_nl, L);
	
	// Tratamento de Erro
	and err1 (wire_nE1, Wire_nl, M);
	and err2 (wire_nE2, Wire_nm, H);
	or err3 (ERRO, wire_nE1, wire_nE2);
	
	// Tratamento da Abertura da entrada da Caixa d'água
	or ve1 (Wire_V, Wire_nm, L);
	and ve2 (Ve, Wire_V, Wire_nh);
	
	// Tratamento do Alarme
	or al (Al, Wire_nm, Wire_nl);
	
endmodule 