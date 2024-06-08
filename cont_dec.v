//Definição do módulo Contador de Dezena Decrescente

module cont_dec(Clk, Q);

input Clk;

output [3:0] Q;


//Fios intermediários
wire [3:0] J;
wire [3:0] K;
wire Wire1, Wire2;

or Or1(Wire1, J[1], Q[3], Q[2]);
or Or2(Wire2, K[1], Q[1], Q[2]);


//Flip-flops JK usados para fazer o contador
flipflopJK(1, 1, 0, 0, Clk, Q[0]);
flipflopJK(Wire1, Wire2, 0, 0, Clk, Q[1]);
flipflopJK(0, Q[3], 0, 0, Clk, Q[3]);
flipflopJK(Q[3], Q[2], 0, 0, Clk, Q[2]);

endmodule