// Declaracao do modulo
module RegaAutomatica (H, M, L, Us, Ua, T, Sd, Rst, clock, Ve, Al,
							  Bs, Vs, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, 
							  SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P, linhas_Matriz, Colunas_Matriz, osciloscopio);	
							  
	// Declaracao de portas
	input H, M, L, Us, Ua, T, Sd, Rst, clock;
	output Bs, Vs, Ve, Al, osciloscopio; 
	output SEG_D1, SEG_D2, SEG_D3, SEG_D4;
	output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;
	output [6:0] linhas_Matriz;
	output [4:0] Colunas_Matriz;
	
	// Declaracao dos fios intermediarios
	wire [2:0] Seletor_Linhas;
	wire [3:0] C;
	wire Seletor_imagem;
	wire ERRO, clock_matriz, clock_display;
	wire Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto;
	wire out, I0, I1, I2, I3, I4, I5, I6, I7, S;
	
	// Funcionamento do circuito
	
	// Modulo de tratamento de Nivel, Erro, Entrada da Caixa e Alarme.
	NivelErro NvE1 (H, M, L, Ve, Al, ERRO, Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto);
	
	// Modulo de Tipo de Irrigação
	Irrigacao Irr1 (Us, Ua, T, M, L, ERRO, Bs, Vs);
		
	//Modulo de Controle do Mostrador de 7 segmentos
	Display7Segmento (Seletor_imagem, Rst, ERRO, Ve,  Seletor_Linhas[2], SEG_D1, SEG_D2, SEG_D3, SEG_D4, 
						 SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P
						 );  
							
	//Modulo do divisor de Clock
	DivisorClock Div1(.clock(clock), 
							.clock_matriz(clock_matriz), 
							.clock_display(clock_display),
							.Seletor_imagem(Seletor_imagem),
							.Seletor_Linhas(Seletor_Linhas)
	);
	
	//Modulo de Teste da Matriz
	Matriz_7x5 Mtrx1 (.img_sel(Seletor_imagem), 
							.lin(linhas_Matriz), 
							.col(Colunas_Matriz), 
							.Clock_Linhas(Seletor_Linhas),
							.Critico(Nv_Critico), 
							.Baixo(Nv_Baixo), 
							.Medio(Nv_Medio), 
							.Alto(Nv_Alto),
							.Aspersao(Bs),
							.Gotejamento(Vs)
	);
		
	assign osciloscopio = Seletor_imagem;	
endmodule 
