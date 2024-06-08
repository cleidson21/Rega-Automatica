//Modulo Decodificador

module decode(C, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);

input [3:0]C;

output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;

// Entradas negadas
wire C0n, C1n, C2n, C3n;
not Not0(C0n, C[0]);
not Not1(C1n, C[1]);
not Not2(C2n, C[2]);
not Not3(C3n, C[3]);

// Fios intermediarios
wire SegA1, SegA2;
wire SegB1, SegB2;
wire SegD1;
wire SegE1, SegE2;
wire SegF1, SegF2, SegF3;
wire SegG1, SegG2;

//SEGMENTO A

and And0(SegA1, C[2],C1n,C0n);
and And1(SegA2, C3n, C2n, C1n, C[0]);
or Or0(SEG_A, SegA1, SegA2);

//SEGMENTO B

and And2(SegB1, C[2], C1n, C[0]);
and And11(SegB2, C[2], C[1], C0n);
or Or1(SEG_B, SegB1, SegB2);

//SEGMENTO C

and And3(SEG_C, C2n, C[1], C0n);

//SEGMENTO D

and And4(SegD1, C[2], C[1], C[0]);
or Or2(SEG_D, SegD1, SegA1, SegA2);

//SEGMENTO E

and And5(SegE1, C3n, C[0]);
and And6(SegE2, C[2], C1n);
or Or3(SEG_E, SegE1, SegE2);

//SEGMENTO F

and And7(SegF1, C[1], C[0]);
and And8(SegF2, C2n, C[1]);
and And9(SegF3, C3n, C2n, C[0]);
or Or4(SEG_F, SegF1, SegF2, SegF3);

//SEGMENTO G

and And10(SegG1, C3n, C2n, C1n);
or Or5(SEG_G, SegA1, SegD1, SegG1);

endmodule