// Declaracao do modulo
module RegaAutomatica (H, M, L, Us, Ua, T, Sd, Ve, Al,
							  Bs, Vs, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, 
							  SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P, LED_R, LED_G, LED_B);	
							  
	// Declaracao de portas
	input H, M, L, Us, Ua, T, Sd;
	output Bs, Vs, Ve, Al; 
	output SEG_D1, SEG_D2, SEG_D3, SEG_D4;
	output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P, LED_R, LED_G, LED_B;
	
	// Declaracao dos fios intermediarios
	wire Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto, ERRO;
	
	// Funcionamento do circuito
	
	// Modulo de tratamento de Nivel, Erro, Entrada da Caixa e Alarme.
	NivelErro NvE1 (H, M, L, Ve, Al, ERRO, Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto);
	
	// Modulo de Tipo de Irrigação
	Irrigacao Irr1 (Us, Ua, T, M, L, ERRO, Bs, Vs);
	
	//Modulo de Controle do Mostrador de & segmentos
	Mostrador7 Most1 (Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto, ERRO, Bs, Vs, Sd,
							SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);
	
	or ledR (LED_R, ERRO, Nv_Critico);
	or ledG (LED_G, Nv_Critico, Nv_Alto, Nv_Baixo);
	or ledB (LED_B, Nv_Baixo, Nv_Medio);
endmodule 
