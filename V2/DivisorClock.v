// Definição do módulo DivisorClock
module DivisorClock (clock, clock_matriz, clock_display, Seletor_imagem, Seletor_Linhas, Contador_Display);

	// Declaracao de portas
   input clock;
   output clock_matriz;
   output clock_display;
	output [2:0] Seletor_Linhas;
	output Seletor_imagem, Contador_Display;


   // Fios intermediários
   wire [18:0] Q;


   // Módulo fft para dividir o clock por 2 (25Mhz)
   fft div_2 (
			.T(1'b1),
			.clock(clock),
			.Q(Q[0]),
    );

   // Módulo fft para dividir o clock por 4 (12,5Mhz)
   fft div_4 (
			.T(1'b1),
			.clock(Q[0]),
			.Q(Q[1]),
    );
    
	// Módulo fft para dividir o clock por 8 (6,25Mhz)
   fft div_8 (
			.T(1'b1),
			.clock(Q[1]),
			.Q(Q[2])
   );
	
	// Módulo fft para dividir o clock por 16 (3,125 Mhz)
   fft div_16 (
			.T(1'b1),
			.clock(Q[2]),
			.Q(Q[3])
   );	
	
	// Módulo fft para dividir o clock por 32 (1.562,50 Khz)
   fft div_32 (
			.T(1'b1),
			.clock(Q[3]),
			.Q(Q[4])
   );
	
	// Módulo fft para dividir o clock por 64 (781,25 Khz)
   fft div_64 (
			.T(1'b1),
			.clock(Q[4]),
			.Q(Q[5])
   );
	
	// Módulo fft para dividir o clock por 128 (390,625 Khz)
   fft div_128 (
			.T(1'b1),
			.clock(Q[5]),
			.Q(Q[6])
   );
	
	// Módulo fft para dividir o clock por 256 (195,3125 Khz)
   fft div_256 (
			.T(1'b1),
			.clock(Q[6]),
			.Q(Q[7])
   );
	
	// Módulo fft para dividir o clock por 512 (97,65625 Khz)
   fft div_512 (
			.T(1'b1),
			.clock(Q[7]),
			.Q(Q[8])
   );
	
	// Módulo fft para dividir o clock por 1024 (48,828125 Khz)
   fft div_1024 (
			.T(1'b1),
			.clock(Q[8]),
			.Q(Q[9])
   );
	
	// Módulo fft para dividir o clock por 2048 (24,4140625 khz)
   fft div_2048 (
			.T(1'b1),
			.clock(Q[9]),
			.Q(Q[10])
   );
	
	// Módulo fft para dividir o clock por 4096 (12,20703125 khz)
   fft div_4096 (
			.T(1'b1),
			.clock(Q[10]),
			.Q(Q[11])
   );
	
	// Módulo fft para dividir o clock por 8192 (6,103515625 khz)
   fft div_8192 (
			.T(1'b1),
			.clock(Q[11]),
			.Q(Q[12])
   );
	
	// Módulo fft para dividir o clock por 16384 (3,0517578125 khz)
   fft div_16384 (
			.T(1'b1),
			.clock(Q[12]),
			.Q(Q[13])
   );
	
	// Módulo fft para dividir o clock por 32768 (1,52587890625 khz)
   fft div_32768 (
			.T(1'b1),
			.clock(Q[13]),
			.Q(Q[14])
   );
	
	// Módulo fft para dividir o clock por 65536 (762,939453125 hz)
   fft div_65536 (
			.T(1'b1),
			.clock(Q[14]),
			.Q(Seletor_Linhas[0])
   );
	
	// Módulo fft para dividir o clock por 131072 (381,469726563 hz)
   fft div_131072 (
			.T(1'b1),
			.clock(Seletor_Linhas[0]),
			.Q(Seletor_Linhas[1])
   );
	
	// Módulo fft para dividir o clock por 262144 (190,734863281 hz)
   fft div_262144 (
			.T(1'b1),
			.clock(Seletor_Linhas[1]),
			.Q(Seletor_Linhas[2])
   );
	
	// Módulo fft para dividir o clock por 524288 (95,3674316406 hz)
   fft div_524288 (
			.T(1'b1),
			.clock(Seletor_Linhas[2]),
			.Q(Q[15])
   );
	
	// Módulo fft para dividir o clock por 1048576 (47,6837158203 hz)
   fft div_1048576 (
			.T(1'b1),
			.clock(Q[15]),
			.Q(Q[16])
   );
	
	// Módulo fft para dividir o clock por 2097152 (23,8418579102 hz)
   fft div_2097152 (
			.T(1'b1),
			.clock(Q[16]),
			.Q(Q[17])
   );

	// Módulo fft para dividir o clock por 4194304 (11,9209289551 hz)
   fft div_4194304 (
			.T(1'b1),
			.clock(Q[17]),
			.Q(Contador_Display)
   );
	
	// Módulo fft para dividir o clock por 8388608 (5,9604644775390625 hz)
   fft div_8388608 (
			.T(1'b1),
			.clock(Contador_Display),
			.Q(Q[18])
   );
	
	// Módulo fft para dividir o clock por 16777216 (2,98023223876953125 hz)
   fft div_16777216 (
			.T(1'b1),
			.clock(Q[18]),
			.Q(Seletor_imagem)
   );

endmodule 