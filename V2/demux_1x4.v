// Declaracao do modulo do Demultiplexador de 4 saidas e 1 entrada com seletor de 2 bits logica INVERSA.
module demux_1x4 (in, S, Out0, Out1, Out2, Out3);

	 // Declaracao de portas
    input in;           // Entrada única
    input [1:0] S;      // Seletor de 2 bits
    output Out0, Out1, Out2, Out3;  // 4 saídas

    // Declaração de fios para os complementos do seletor
    wire notS0, notS1;

    // Inversores para os bits do seletor
    not (notS0, S[0]);
    not (notS1, S[1]);
	 
	 // Decodificador para cada saída do demux 1x7 usando portas "OR" para saida de valor logico BAIXO
    or (Out0, in, S[1], S[0]);       // S == 00
    or (Out1, in, S[1], notS0);      // S == 01
    or (Out2, in, notS1, S[0]);     // S == 10
    or (Out3, in, notS1, notS0);    // S == 11
	 

endmodule 