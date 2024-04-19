// Declaracao do modulo
module Mostrador7 (Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto, ERRO, Bs, Vs, Sd, SEG_D1, 
						  SEG_D2, SEG_D3, SEG_D4, SEGs[0], SEGs[1], SEGs[2], SEGs[3], SEGs[4],
						  SEGs[5], SEGs[6]);  

	// Declaracao de portas
	input Nv_Critico, Nv_Baixo, Nv_Medio, Nv_Alto, ERRO, Bs, Vs, Sd;
	output [6:0] SEGs;
	output SEG_D1, SEG_D2, SEG_D3, SEG_D4; 
	
	// Declaracao dos fios intermediarios
	wire wire_Mcr, wire_Mba, wire_Mme, wire_Mal, wire_Mer, wire_Mbs, wire_Mvs;
	wire Wire_SegE1, Wire_SegE2, Wire_SegF1, Wire_SegF2, Wire_SegG1, Wire_SegG2;
	wire [2:0] Cdg;
	wire Wire_Ncdg0, Wire_Ncdg1, Wire_Ncdg2, Wire_Ncdg3;
	not (SEG_D1, 1);
	not (SEG_D2, 0);
	not (SEG_D3, 0);
	not (SEG_D4, 0);
	
	// Funcionamento do circuito
	
	// Fios com negações da entrada de Seleção de Visualização
	not sd1 (Wire_nsd, Sd);	
	
	// Tratamento do tipo de Visualização
	
	// Niveis (Alto, Medio, Baixo, Critico e Erro)
	and mcrit (wire_Mcr, Wire_nsd, Nv_Critico);
	and mbai (wire_Mba, Wire_nsd, Nv_Baixo);
	and mmed (wire_Mme, Wire_nsd, Nv_Medio);
	and malt (wire_Mal, Wire_nsd, Nv_Alto);
	and merr (wire_Mer, Wire_nsd, ERRO);
	
	// Tipo de Rega
	and mbs (wire_Mbs, Sd, Bs);
	and mvs (wire_Mvs, Sd, Vs);
	
	// Codificador Entradas para binario 8 digitos
	or Codificar0 (Cdg[0], wire_Mcr, wire_Mme, wire_Mer, wire_Mvs);
	or Codificar1 (Cdg[1], wire_Mba, wire_Mme, wire_Mbs, wire_Mvs);
	or Codificar2 (Cdg[2], wire_Mal, wire_Mer, wire_Mbs, wire_Mvs);
	
	//Negacao das entradas binarias do Codificador
	not nCodidificar0 (Wire_Ncdg0, Cdg[0]);
	not nCodidificar1 (Wire_Ncdg1, Cdg[1]);
	not nCodidificar2 (Wire_Ncdg2, Cdg[2]);
		
	//Decodificador dos Segmentos do Mostrador 7 elementos
	
	//Segmanto A
	or segA (SEGs[0], Cdg[1], Wire_Ncdg2);
	//Segmento B	
	not SegB(SEGs[1], 0); 
	//Segmento C
	or SegC (SEGs[2], Wire_Ncdg2, Wire_Ncdg1); 
	//Segmento D
	and SegD (SEGs[3], Wire_Ncdg2, Wire_Ncdg1, Wire_Ncdg0); 
	//Segmento E 
	and SegE1 (Wire_SegE1, Wire_Ncdg2, Cdg[1]); 
	and SegE2 (Wire_SegE2, Wire_Ncdg1, Wire_Ncdg0); 
	or SegE (SEGs[4], Wire_SegE1, Wire_SegE2);
	//Segmento F
	and SegF1 (Wire_SegF1, Wire_Ncdg1, Wire_Ncdg0 );
	and SegF2 (Wire_SegF2,Cdg[1], Cdg[0]);
	or SegF (SEGs[5], Wire_SegF1, Wire_SegF2, Wire_Ncdg2);
	//Segmento G
	and SegG1 (Wire_SegG1, Wire_Ncdg2, Wire_Ncdg0); 
	and SegG2 (Wire_SegG2, Cdg[2], Cdg[1], Cdg[0]); 
	or SegG (SEGs[6], Wire_SegG1, Wire_SegG2);
	
endmodule 
