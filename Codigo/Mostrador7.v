// Declaracao do modulo
module Mostrador7 (H, M, L, Bs, Vs, Sd, SEG_D1, SEG_D2, SEG_D3, SEG_D4, 
						 SEGs[0], SEGs[1], SEGs[2], SEGs[3], SEGs[4], SEGs[5], SEGs[6], SEG_P
						 );  

	// Declaracao de portas
	input H, M, L, Bs, Vs, Sd;
	output [6:0] SEGs;
	output SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_P; 
	
	// Declaracao dos fios intermediarios
	wire Wire_nSd, Wire_nh, Wire_nm, Wire_nl;
	wire Wire_A0_1, Wire_A0_2, Wire_A0_3, Wire_A1_1, Wire_A2_1, Wire_A2_2;
	wire Wire_SegD1, Wire_SegD2, Wire_SegE1, Wire_SegE2, Wire_SegE3, Wire_SegF1;
	wire Wire_Ncdg0, Wire_Ncdg1, Wire_Ncdg2, Wire_Ncdg3;
	wire [2:0] Cdg;
	
	// Funcionamento do circuito
	
	//Seleção de segmento a ser utilizado
	not (SEG_D1, 1);
	not (SEG_D2, 0);
	not (SEG_D3, 0);
	not (SEG_D4, 0);
	not (SEG_P, 0);
	
	// Fios com negações das entradas
	not Not_Sd1 (Wire_nSd, Sd);
	not Not_H1 (Wire_nh, H);
	not Not_M1 (Wire_nm, M);
	not Not_L1 (Wire_nl, L);

	// Codificador Entradas para binario 8 digitos
	
	//Tipo de Rega
	and NBs_Vs (Wire_NBs_Vs, Sd, Vs);
	and NVs_Bs (Wire_NVs_Bs, Sd, Bs);
	
	//Bit B0
	and B0_And1 (Wire_A0_1, Wire_nSd, Wire_nl);
	and B0_And2 (Wire_A0_2, Wire_nSd, Wire_nh, M);
	and B0_And3 (Wire_A0_3, Wire_nSd, Wire_nm ,H);
	or Codificar0 (Cdg[0], Wire_A0_1, Wire_A0_2, Wire_A0_3, Wire_NBs_Vs);
	
	//Bit B1
	and B1_And1 (Wire_A1_1, Wire_nSd, Wire_nh, L);
	or Codificar1 (Cdg[1], Wire_A1_1, Wire_NBs_Vs, Wire_NVs_Bs);
	
	//Bit B2
	and B2_And1 (Wire_A2_1, Wire_nSd, Wire_nl, M);
	and B2_And2 (Wire_A2_2, Wire_nSd, H);
	or Codificar2 (Cdg[2], Wire_A2_1, Wire_A2_2, Wire_NBs_Vs, Wire_NVs_Bs);
	
	//Negacao das entradas binarias do Codificador
	not nCodidificar0 (Wire_Ncdg0, Cdg[0]);
	not nCodidificar1 (Wire_Ncdg1, Cdg[1]);
	not nCodidificar2 (Wire_Ncdg2, Cdg[2]);
		
	//Decodificador dos Segmentos do Mostrador 7 elementos
	
	//Segmanto A
	or segA (SEGs[0], Wire_Ncdg2);
	
	//Segmento B	
	or SegB(SEGs[1], Wire_Ncdg1, Wire_Ncdg2); 
	
	//Segmento C
	or SegC (SEGs[2], Wire_Ncdg2, Wire_Ncdg1); 
	
	//Segmento D
	and SegD1 (Wire_SegD1, Wire_Ncdg2, Wire_Ncdg1, Wire_Ncdg0);
	and SegD2 (Wire_SegD2, Cdg[2], Cdg[1], Wire_Ncdg0);
	or SegD (SEGs[3], Wire_SegD1, Wire_SegD2);
	
	//Segmento E 
	and SegE1 (Wire_SegE1, Wire_Ncdg1, Wire_Ncdg0);
	and SegE2 (Wire_SegE2, Cdg[1], Cdg[0]);
	and SegE3 (Wire_SegE3, Wire_Ncdg2, Wire_Ncdg0);
	or SegE (SEGs[4], Wire_SegE1, Wire_SegE2, Wire_SegE3);
	
	//Segmento F
	and SegF1 (Wire_SegF1, Wire_Ncdg1, Wire_Ncdg0);
	or SegF (SEGs[5], Wire_SegF1, Wire_Ncdg2);
	
	//Segmento G
	and SegG (SEGs[6], Wire_Ncdg0, Wire_Ncdg2);
	
endmodule 