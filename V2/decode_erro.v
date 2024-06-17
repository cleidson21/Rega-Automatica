//Modulo Decodificador do Erro
module decode_erro(En, C1, C0, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G);

input En, C1, C0;

output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G;

// Entradas negadas
wire C0n, C1n;
not Not0(C0n, C0);
not Not1(C1n, C1);
not Not2(Ern, En);

// Fios intermediarios
wire SegD1, SegD2;

//SEGMENTO A

or Or0(SEG_A, Ern, C0, C1);

//SEGMENTO B

not not1 (SEG_B, 0);

//SEGMENTO C

or or1 (SEG_C, Ern, C0n, C1n);

//SEGMENTO D

and And1 (SegD1, C1n, C0);
and And2 (SegD2, C1, C0n);
or Or2 (SEG_D, Ern, SegD1, SegD2);

//SEGMENTO E

not not2 (SEG_E, En);

//SEGMENTO F

or Or3 (SEG_F, Ern, C0, C1);

//SEGMENTO G

not not3 (SEG_G, En);

//SEGMENTO P

not (SEG_P, 0);

endmodule 