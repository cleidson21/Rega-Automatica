// Definição do módulo DivisorClock
module DivisorClock (clock, clock_matriz, clock_display, Seletor_imagem, Seletor_Linhas);

	// Declaracao de portas
   input clock;
   output clock_matriz;
   output clock_display;
	output [2:0] Seletor_Linhas;
	output Seletor_imagem;


   // Fios intermediários
	wire reset, T;
   wire [19:0] Q;
   wire [23:0] Qb;
	 
	not NotT (T, 0);

   // Módulo fft para dividir o clock por 2 (25Mhz)
   fft div_2 (
			.T(T),
			.clock(clock),
			.Q(Q[0]),
			.Qb(Qb[0]),
			.reset(reset)
    );

   // Módulo fft para dividir o clock por 4 (12,5Mhz)
   fft div_4 (
			.T(T),
			.clock(Qb[0]),
			.Q(Q[1]),
			.Qb(Qb[1]),
			.reset(reset)
    );
    
	// Módulo fft para dividir o clock por 8 (6,25Mhz)
   fft div_8 (
			.T(T),
			.clock(Qb[1]),
			.Q(Q[2]),
			.Qb(Qb[2]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 16 (3,125 Mhz)
   fft div_16 (
			.T(T),
			.clock(Qb[2]),
			.Q(Q[3]),
			.Qb(Qb[3]),
			.reset(reset)
   );	
	
	// Módulo fft para dividir o clock por 32 (1.562,50 Khz)
   fft div_32 (
			.T(T),
			.clock(Qb[3]),
			.Q(Q[4]),
			.Qb(Qb[4]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 64 (781,25 Khz)
   fft div_64 (
			.T(T),
			.clock(Qb[4]),
			.Q(Q[5]),
			.Qb(Qb[5]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 128 (390,625 Khz)
   fft div_128 (
			.T(T),
			.clock(Qb[5]),
			.Q(Q[6]),
			.Qb(Qb[6]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 256 (195,3125 Khz)
   fft div_256 (
			.T(T),
			.clock(Qb[6]),
			.Q(Q[7]),
			.Qb(Qb[7]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 512 (97,65625 Khz)
   fft div_512 (
			.T(T),
			.clock(Qb[7]),
			.Q(Q[8]),
			.Qb(Qb[8]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 1024 (48,828125 Khz)
   fft div_1024 (
			.T(T),
			.clock(Qb[8]),
			.Q(Q[9]),
			.Qb(Qb[9]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 2048 (24,4140625 khz)
   fft div_2048 (
			.T(T),
			.clock(Qb[9]),
			.Q(Q[10]),
			.Qb(Qb[10]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 4096 (12,20703125 khz)
   fft div_4096 (
			.T(T),
			.clock(Qb[10]),
			.Q(Q[11]),
			.Qb(Qb[11]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 8192 (6,103515625 khz)
   fft div_8192 (
			.T(T),
			.clock(Qb[11]),
			.Q(Q[12]),
			.Qb(Qb[12]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 16384 (3,0517578125 khz)
   fft div_16384 (
			.T(T),
			.clock(Qb[12]),
			.Q(Q[13]),
			.Qb(Qb[13]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 32768 (1,52587890625 khz)
   fft div_32768 (
			.T(T),
			.clock(Qb[13]),
			.Q(Q[14]),
			.Qb(Qb[14]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 65536 (762,939453125 hz)
   fft div_65536 (
			.T(T),
			.clock(Qb[14]),
			.Q(Seletor_Linhas[0]),
			.Qb(Qb[15]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 131072 (381,469726563 hz)
   fft div_131072 (
			.T(T),
			.clock(Qb[15]),
			.Q(Seletor_Linhas[1]),
			.Qb(Qb[16]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 262144 (190,734863281 hz)
   fft div_262144 (
			.T(T),
			.clock(Qb[16]),
			.Q(Seletor_Linhas[2]),
			.Qb(Qb[17]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 524288 (95,3674316406 hz)
   fft div_524288 (
			.T(T),
			.clock(Qb[17]),
			.Q(Q[15]),
			.Qb(Qb[18]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 1048576 (47,6837158203 hz)
   fft div_1048576 (
			.T(T),
			.clock(Qb[18]),
			.Q(Q[16]),
			.Qb(Qb[19]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 2097152 (23,8418579102 hz)
   fft div_2097152 (
			.T(T),
			.clock(Qb[19]),
			.Q(Q[17]),
			.Qb(Qb[20]),
			.reset(reset)
   );

	// Módulo fft para dividir o clock por 4194304 (11,9209289551 hz)
   fft div_4194304 (
			.T(T),
			.clock(Qb[20]),
			.Q(Q[18]),
			.Qb(Qb[21]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 8388608 (5,9604644775390625 hz)
   fft div_8388608 (
			.T(T),
			.clock(Qb[21]),
			.Q(Q[19]),
			.Qb(Qb[22]),
			.reset(reset)
   );
	
	// Módulo fft para dividir o clock por 16777216 (2,98023223876953125 hz)
   fft div_16777216 (
			.T(T),
			.clock(Qb[22]),
			.Q(Seletor_imagem),
			.Qb(Qb[23]),
			.reset(reset)
   );

endmodule 