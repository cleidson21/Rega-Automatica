//Definição do módulo Contador de Dezena Decrescente

module cont_dec(Clk, Rst, Q3, Q2, Q1, Q0);

input Clk, Rst;

output Q3, Q2, Q1, Q0;


//Fios intermediários
wire Wire1, Wire2, Wire3, Wire4, Wire5, Wire6;
wire Q2n, Q1n, Q0n;

not Not0(Q2n, Q2);
not Not1(Q1n, Q1);
not Not2(Q0n, Q0);

and And0(Wire2, Q2, Q0n);
and And1(Wire3, Q3, Q0n);
and And2(Wire4, Q3, Q0n);
and And3(Wire5, Q1n, Q0n);
and And4(Wire6, Q2n, Q1n, Q0n);

or Or0(Wire1, Wire2, Wire3);


//Flip-flops JK usados para fazer o contador
flipflopJK(1, 1, Rst, 0, Clk, Q0);
flipflopJK(Wire1, Q0n, Rst, 0, Clk, Q1);
flipflopJK(Wire4, Wire5, Rst, 0, Clk, Q2);
flipflopJK(Wire6, Q0n, Rst, 0, Clk, Q3);

endmodule
