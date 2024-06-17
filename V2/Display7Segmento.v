// Declaracao do modulo
module Display7Segmento (Clk, Rst, ERRO, Ve, S, SEG_D1, SEG_D2, SEG_D3, SEG_D4, 
						 SEGs[0], SEGs[1], SEGs[2], SEGs[3], SEGs[4], SEGs[5], SEGs[6], SEG_P
						 );  

	
	// Declaracao de portas
	input S, Clk, Rst, ERRO, Ve;
	wire [1:0] Sel;
	output [6:0] SEGs;
	wire [3:0] Cont;
	output SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_P; 
	
	// Declaracao dos fios intermediarios
	wire Cont_SegA, Cont_SegB, Cont_SegC, Cont_SegD, Cont_SegE, Cont_SegF, Cont_SegG;
	wire Erro_SegA, Erro_SegB, Erro_SegC, Erro_SegD, Erro_SegE, Erro_SegF, Erro_SegG;
	
	cont_2b(S, Rst, Sel[1], Sel[0]);
	
	cont_cinco(Clk, Rst, Cont[2], Cont[1], Cont[0]);
	decode_Contador(ERRO, 0, Cont[2], Cont[1], Cont[0], Cont_SegA, Cont_SegB, Cont_SegC, Cont_SegD, Cont_SegE, Cont_SegF, Cont_SegG);
	
	decode_erro(ERRO, Sel[1], Sel[0], Erro_SegA, Erro_SegB, Erro_SegC, Erro_SegD, Erro_SegE, Erro_SegF, Erro_SegG);
	
	//Seleciona os segmentos
	demux_1x4(0, Sel, SEG_D1, SEG_D2, SEG_D3, SEG_D4);
	
	// Funcionamento do circuito
	
	and And0(SEGs[0], Cont_SegA, Erro_SegA);
	and And1(SEGs[1], Cont_SegB, Erro_SegB);
	and And2(SEGs[2], Cont_SegC, Erro_SegC);
	and And3(SEGs[3], Cont_SegD, Erro_SegD);
	and And4(SEGs[4], Cont_SegE, Erro_SegE);
	and And5(SEGs[5], Cont_SegF, Erro_SegF);
	and And6(SEGs[6], Cont_SegG, Erro_SegG);

	not(SEG_P, 0);
endmodule 
