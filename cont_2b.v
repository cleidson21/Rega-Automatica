//Definição do módulo Contador decrescente de 2 bits

module cont_2b(Clk, Rst, Q1, Q0);

input Clk, Rst;

output Q1, Q0;

//Fios intermediários
wire Q2n, Q1n, Q0n;

not Not0(Q2n, Q2);
not Not1(Q1n, Q1);
not Not2(Q0n, Q0);

//Flip-flops JK usados para fazer o contador
//FF0
flipflopJK(1, 1, Rst, 0, Clk, Q0);
//FF1
flipflopJK(Q0n, Q0n, Rst, 0, Clk, Q1);

endmodule