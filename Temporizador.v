// Declaracao do modulo temporizador 
module Temporizador (clock, DSegundos, Minutos, Dminutos);

	// Declaracao de portas
   input clock;
	output DSegundos, Minutos, Dminutos;
	
	// Fios intermediarios
	wire reset, And_Qb0_Qb1;
	wire [3:0] Q, Qb;
	
	// "AND's" de transicao do contador
	and And1 (And1_Qb1, Qb[0], Qb[1]);
	and And2 (And2_Qb2, Qb[2], And1_Qb1);
	
	// Funcionamento do circuito
	

	
	
endmodule 