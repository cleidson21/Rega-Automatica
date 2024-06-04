module TesteMatriz (img_sel, lin, col, Sel);

	// Declaracao de portas
	input [2:0] Sel; // Seletor com clock (3 bits para 8 imagens)
   input [2:0] img_sel;	  // Seleção de imagem (3 bits até 8 imagens)
	output [6:0] lin;
	output [4:0] col;
   reg [4:0] imagem [5:0] [6:0]; // 6 imagens de 7 linhas e 5 colunas cada
	reg [4:0] Nivel_C, Nivel_Bordas, Desligado, Centro1_Irrig, Centro3_Irrig; //
	
	
	demux_1x7 Linhas (
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
	
	
	
   // Inicialização das imagens
   initial begin
		Nivel_C = 5'b11111;
		Nivel_Bordas   = 5'b10001;
		Desligado      = 5'b00000;
		Centro1_Irrig  = 5'b00100;
		Centro3_Irrig  = 5'b01110;
		
	
       // Imagem 0: "Critico 0"
       imagem[0][lin[0]] = Nivel_Bordas;
       imagem[0][lin[1]] = Nivel_Bordas;
       imagem[0][lin[2]] = Nivel_Bordas;
       imagem[0][lin[3]] = Nivel_Bordas;
       imagem[0][lin[4]] = Nivel_Bordas;
       imagem[0][lin[5]] = Nivel_Bordas;
       imagem[0][lin[6]] = Nivel_C;

       // Imagem 2: "Baixo"
       imagem[1][lin[0]] = Nivel_Bordas;
       imagem[1][lin[1]] = Nivel_Bordas;
       imagem[1][lin[2]] = Nivel_Bordas;
       imagem[1][lin[3]] = Nivel_Bordas;
       imagem[1][lin[4]] = Nivel_C;
       imagem[1][lin[5]] = Nivel_C;
       imagem[1][lin[6]] = Nivel_C;

       // Imagem 3: "Médio"
       imagem[2][lin[0]] = Nivel_Bordas;
       imagem[2][lin[1]] = Nivel_Bordas;
       imagem[2][lin[2]] = Nivel_C;
       imagem[2][lin[3]] = Nivel_C;
       imagem[2][lin[4]] = Nivel_C;
       imagem[2][lin[5]] = Nivel_C;
       imagem[2][lin[6]] = Nivel_C;
		  
		 // Imagem 4: "Alto"
       imagem[3][lin[0]] = Nivel_C;
       imagem[3][lin[1]] = Nivel_C;
       imagem[3][lin[2]] = Nivel_C;
       imagem[3][lin[3]] = Nivel_C;
       imagem[3][lin[4]] = Nivel_C;
       imagem[3][lin[5]] = Nivel_C;
       imagem[3][lin[6]] = Nivel_C;
		  
		 // Imagem 5: "Aspersão"
       imagem[4][lin[0]] = Desligado;
       imagem[4][lin[1]] = Centro1_Irrig;
       imagem[4][lin[2]] = 5'b10101;
       imagem[4][lin[3]] = 5'b01010;
       imagem[4][lin[4]] = Centro1_Irrig;
       imagem[4][lin[5]] = Centro1_Irrig;
       imagem[4][lin[6]] = Nivel_C;
		  
		 // Imagem 6: "Gotejamento"
       imagem[5][lin[0]] = Desligado;
       imagem[5][lin[1]] = Centro1_Irrig;
       imagem[5][lin[2]] = Centro1_Irrig;
       imagem[5][lin[3]] = Centro3_Irrig;
       imagem[5][lin[4]] = Nivel_C;
       imagem[5][lin[5]] = Centro3_Irrig;
       imagem[5][lin[6]] = Centro1_Irrig;
    end


endmodule
