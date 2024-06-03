module Seletor_img (out, I0, I1, I2, I3, I4, I5, S);

	// Declaracao de portas
   input [2:0] S; 						// Seletor de 3 Bits
	input I0, I1, I2, I3, I4, I5;  	// Entradas 
	output [2:0] out;						// Saída de 3 bis

	// Declaracao dos fios intermediarios
   wire [2:0] Out0, out1, out2, out3, out4;
	wire S_And0, S_And1, S_And2;
	
	// Inversão do seletor
	not (notS0, S[0]);
   not (notS1, S[1]);
   not (notS2, S[2]);

	// Funcionamento do circuito
	
	// Geração das saídas intermediárias com base no seletor
   and (out0, notS2, notS1, notS0, I0);
   and (out1, notS2, notS1, S[0], I1);
   and (out2, notS2, S[1], notS0, I2);
   and (out3, notS2, S[1], S[0], I3);
   and (out4, S[2], notS1, notS0, I4);
	and (out5, S[2], notS1, S[0], I5);
	
	// Combinando as saídas intermediárias para formar a saída final
	or (out[0], out0 & S[0], out1 & S[0], out2 & S[0], out3 & S[0], out4 & S[0], out5 & S[0]);
   or (out[1], out0 & S[1], out1 & S[1], out2 & S[1], out3 & S[1], out4 & S[1], out5 & S[1]);
   or (out[2], out0 & S[2], out1 & S[2], out2 & S[2], out3 & S[2], out4 & S[2], out5 & S[2]);
	
endmodule 