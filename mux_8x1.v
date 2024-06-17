// Declaracao do modulo do Multiplexador de 8 entradas e 1 saida com seletor de 3 bits
// Utilizando mux 2x1 em cascata para desenvolver mux 8x1 
module mux_8x1 (out, I0, I1, I2, I3, I4, I5, I6, I7, S);

	// Declaracao de portas
   input [2:0] S;
	input I0, I1, I2, I3, I4, I5, I6, I7;
	output out;

	// Declaracao dos fios intermediarios
	wire wire_M4A1, wire_M4A2, wire_M4A3, wire_M4A4, wire_M4B1, wire_M4B2;

	// Funcionamento do circuito
	
	// Mux 2x1 com o seletor "S[2]" (MSB)
	
	mux2x1 Mux_2x1_A1 (wire_M4A1, I0, I1, S[2]);
	mux2x1 Mux_2x1_A2 (wire_M4A2, I2, I3, S[2]);
	mux2x1 Mux_2x1_A3 (wire_M4A3, I4, I5, S[2]);
	mux2x1 Mux_2x1_A4 (wire_M4A4, I6, I7, S[2]);
	
	// Mux 4x1 com o seletor "S[1]"
	
	mux2x1 Mux_4x1_B1 (wire_M4B1, wire_M4A1, wire_M4A2, S[1]);
	mux2x1 Mux_4x1_B2 (wire_M4B2, wire_M4A3, wire_M4A4, S[1]);
	
	// Saída do Mux 8x1 com o seletor "S[0]" (LSB)
	
	mux2x1 Mux_8x1_C1 (out, wire_M4B1, wire_M4B2, S[0]);
	
endmodule 