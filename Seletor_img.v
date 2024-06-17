module Seletor_img (out, I0, I1, I2, I3, I4, I5, S);

	// Declaracao de portas
   input [2:0] S; 						// Seletor de 3 Bits
	input I0, I1, I2, I3, I4, I5;  	// Entradas expressões dos modulos de nivel e Tipo de Rega
	output [2:0] out;						// Saída de 3 bis

	// Declaracao dos fios intermediarios
   wire [2:0] out0, out1, out2, out3, out4, out5;
	wire S_And0, S_And1, S_And2;
	wire and0_0, and1_0, and2_0, and3_0, and4_0, and5_0;
	wire and0_1, and1_1, and2_1, and3_1, and4_1, and5_1;
	wire and0_2, and1_2, and2_2, and3_2, and4_2, and5_2;
	
	// Inversão do seletor
	not (notS0, S[0]);
   not (notS1, S[1]);
   not (notS2, S[2]);

	// Funcionamento do circuito
	
	// Expressões das saídas intermediárias com base no seletor e entrada.
   and (out0, notS2, notS1, S[0], I0); 	// S = 001 . I0
   and (out1, notS2, S[1], notS0, I1);		// S = 010 . I1
   and (out2, notS2, S[1], S[0], I2);		// S = 011 . I2
   and (out3, S[2], notS1, notS0, I3);		// S = 100 . I3
   and (out4, S[2], notS1, S[0], I4);		// S = 101 . I4
	and (out5, S[2], S[1], notS0, I5);		// S = 110 . I5
	
	//	Codificador Bit O
	and(and0_0, out0, S[0]);
	and(and1_0, out1, S[0]);
	and(and2_0, out2, S[0]);
	and(and3_0, out3, S[0]);
	and(and4_0, out4, S[0]);
	and(and5_0, out5, S[0]);
	//	Codificador Bit 1
	and(and0_1, out0, S[1]);
	and(and1_1, out1, S[1]);
	and(and2_1, out2, S[1]);
	and(and3_1, out3, S[1]);
	and(and4_1, out4, S[1]);
	and(and5_1, out5, S[1]);
	// Codificador Bit 2
	and(and0_2, out0, S[2]);
	and(and1_2, out1, S[2]);
	and(and2_2, out2, S[2]);
	and(and3_2, out3, S[2]);
	and(and4_2, out4, S[2]);
	and(and5_2, out5, S[2]);
	
	// Combinando as saídas intermediárias para formar a saída final
	or(out[0], and0_0, and1_0, and2_0, and3_0, and4_0, and5_0);
	or(out[1], and0_1, and1_1, and2_1, and3_1, and4_1, and5_1);
	or(out[2], and0_2, and1_2, and2_2, and3_2, and4_2, and5_2);
	
endmodule 