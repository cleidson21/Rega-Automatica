//Modulo Decodificador da entrada de agua
module decode_Entrada(Erro, Ve, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);

input Erro, Ve;

output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;

// Entradas negadas
wire N_Ve;
not Not0 (N_Ve, Ve);

// Funcionamento do Circuito

//SEGMENTO A

or Or0 (SEG_A, Erro, Erro);

//SEGMENTO B

or Or1 (SEG_B, N_Ve, Erro);

//SEGMENTO C

or or2 (SEG_C, N_Ve, Erro);

//SEGMENTO D

not not0 (SEG_D, 0);

//SEGMENTO E

or or3 (SEG_E, Erro, Erro);

//SEGMENTO F

or Or4 (SEG_F, Erro, Erro);

//SEGMENTO G

or or5 (SEG_G, Erro, Erro);

//SEGMENTO P

not (SEG_P, 0);

endmodule 