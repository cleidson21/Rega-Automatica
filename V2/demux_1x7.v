// Declaracao do modulo do Demultiplexador de 7 saidas e 1 entrada com seletor de 3 bits
module demux_1x7 (in, S, Out0, Out1, Out2, Out3, Out4, Out5, Out6);

	 // Declaracao de portas
    input in;           // Entrada única
    input [2:0] S;      // Seletor de 3 bits
    output Out0, Out1, Out2, Out3, Out4, Out5, Out6;  // 7 saídas

    // Declaração de fios para os complementos do seletor
    wire notS0, notS1, notS2;

    // Inversores para os bits do seletor
    not (notS0, S[0]);
    not (notS1, S[1]);
    not (notS2, S[2]);

    // Decodificador para cada saída do demux 1x7 usando portas AND
    and (Out0, in, notS2, notS1, S[0]);   // S == 001
    and (Out1, in, notS2, S[1], notS0);   // S == 010
    and (Out2, in, notS2, S[1], S[0]);    // S == 011
    and (Out3, in, S[2], notS1, notS0);   // S == 100
    and (Out4, in, S[2], notS1, S[0]);    // S == 101
    and (Out5, in, S[2], S[1], notS0);    // S == 110
    and (Out6, in, S[2], S[1], S[0]);     // S == 111
	 

endmodule 