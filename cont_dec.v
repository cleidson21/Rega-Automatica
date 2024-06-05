//Definição do módulo Contador de Dezena Decrescente

module cont_dec(Clk, M7);

input Clk;

output [7:0] M7;


//Fios intermediários
wire [3:0] Q;
wire [3:0] J;
wire [3:0] K;

or Or1(J[1], Q[3], Q[2]);
or Or2(K[1], Q[1], Q[2]);


//Flip-flops JK usados para fazer o contador
flipflopJK(J, K, Clk, Q);
flipflopJK(1, 1, Clk, Q[0]);
flipflopJK(Or1, Or2, Clk, Q[1]);
flipflopJK(Q[3], Q[2], Clk, Q[2]);
flipflopJK(0, Q[3], Clk, Q[3]);

//Fazer contar no M7

endmodule