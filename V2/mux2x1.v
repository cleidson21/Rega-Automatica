// Declaracao do modulo do Multiplexador de 2 entradas e 1 saida
// Dependendo do valor do seletor "S", uma das entradas é definida como saída "out"
module mux2x1 (out, I0, I1, S);

	// Declaracao de portas
   input S, I0, I1;
	output out;

	// Declaracao dos fios intermediarios
	wire wire_and1, wire_and2, wire_nS;

	// Funcionamento do circuito
	
	//Inversão do valor do seletor	
	not Not_S (wire_nS, S); 
	
	//Expressão para L0 
	and And_L0 (wire_and1, I0, wire_nS);
	
	//Expressão para L1
	and And_L1 (wire_and2, I1, S);
	
	//Expressão de Saída para o sinal selecionado
	or Or_out (out, wire_and1, wire_and2);
	
endmodule 