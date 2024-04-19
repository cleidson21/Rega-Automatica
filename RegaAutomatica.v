// Declaracao do modulo
module RegaAutomatica (H, M, L, Us, Ua, T, Sd, Ve, Al,
							  Bs, Vs, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, 
							  SEG_C, SEG_D, SEG_E, SEG_F, SEG_G);	
							  
	// Declaracao de portas
	input H, M, L, Us, Ua, T, Sd;
	output Bs, Vs, Ve, Al; 
	output SEG_D1, SEG_D2, SEG_D3, SEG_D4;
	output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G;
	
	// Declaracao dos fios intermediarios
	wire Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto, ERRO;
	
	// Funcionamento do circuito
	
	// Modulo de tratamento de Nivel, Erro, Entrada da Caixa e Alarme.
	NivelErro NvE1 (H, M, L, Ve, Al, ERRO, Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto);
	
	// Modulo de Tipo de Irrigação
	Irrigacao Irr1 (Us, Ua, T, M, L, ERRO, Bs, Vs);
	
	//Modulo de Controle do Mostrador de & segmentos
	Mostrador7 Most1 (Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto, ERRO, Bs, Vs, Sd,  
	SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G);
	
endmodule 
