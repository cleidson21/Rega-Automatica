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
	 
	 // Saída do demux 1x7 
	 
    and (Out1, notS2, notS1, S[0], in);	// S == 3'b001
    and (Out2, notS2, S[1], notS0, in); 	// S == 3'b010
    and (Out3, notS2, S[1],  S[0], in); 	// S == 3'b011
    and (Out4, S[2], notS1, notS0, in); 	// S == 3'b100
    and (Out5, S[2], notS1,  S[0], in);	// S == 3'b101
    and (Out6, S[2], S[1],  notS0, in); 	// S == 3'b110
	 

endmodule 