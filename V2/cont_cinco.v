//Definição do módulo Contador decrescente de 5 a 0

module cont_cinco(Clk, Pos0, Q2, Q1, Q0);

input Clk, Pos0;

output Q2, Q1, Q0;

//Fios intermediários
wire Wire1, Wire2, Wire3;
wire Q2n, Q1n, Q0n;

not Not0(Q2n, Q2);
not Not1(Q1n, Q1);
not Not2(Q0n, Q0);

and And0(Wire1, Q2, Q0n);
and And1(Wire2, Q1n, Q0n);

//Flip-flops JK usados para fazer o contador
//FF0
flipflopJK(1, 1, Pos0, 0, Clk, Q0);
//FF1
flipflopJK(Wire1, Q0n, Pos0, 0, Clk, Q1);
//FF2
flipflopJK(Wire2, Q0n, Pos0, 0, Clk, Q2);

endmodule
