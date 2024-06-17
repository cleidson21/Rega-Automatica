//Modulo Decodificador de 3 visualizacoes do display

module decode(C3, C2, C1, C0, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);

input C3, C2, C1, C0; // Entradas para o decodificador contador 9 - 0
input Cer1, Cer0; 	 // Entradas para o decodificador Erro
output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;

// Entradas negadas
wire C0n, C1n, C2n, C3n;
not Not0(C0n, C0);
not Not1(C1n, C1);
not Not2(C2n, C2);
not Not3(C3n, C3);

// Fios intermediarios
wire SegA1, SegA2;
wire SegB1, SegB2;
wire SegD1;
wire SegE1;
wire SegF1, SegF2, SegF3;
wire SegG1, SegG2;

//SEGMENTO A

and And0(SegA1, C2,C1n,C0n);
and And1(SegA2, C3n, C2n, C1n, C0);
or Or0(SEG_A, SegA1, SegA2);

//SEGMENTO B

and And2(SegB1, C2, C1n, C0);
and And11(SegB2, C2, C1, C0n);
or Or1(SEG_B, SegB1, SegB2);

//SEGMENTO C

and And3(SEG_C, C2n, C1, C0n);

//SEGMENTO D

and And4(SegD1, C2, C1, C0);
or Or2(SEG_D, SegD1, SegA1, SegA2);

//SEGMENTO E

and And6(SegE1, C2, C1n);
or Or3(SEG_E, SegE1, C0);

//SEGMENTO F

and And7(SegF1, C1, C0);
and And8(SegF2, C2n, C1);
and And9(SegF3, C3n, C2n, C0);
or Or4(SEG_F, SegF1, SegF2, SegF3);

//SEGMENTO G

and And10(SegG1, C3n, C2n, C1n);
or Or5(SEG_G, SegD1, SegG1);

//SEGMENTO P

not (SEG_P, 0);

endmodule