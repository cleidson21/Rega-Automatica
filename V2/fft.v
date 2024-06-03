// Declaracao do modulo do flip-flop T
module fft (T, clock, reset, Q, Qb);

	// Declaracao de portas
   input T;
   input clock;
   input reset;
   output reg Q;
	output reg Qb;

   // Inicialização dos estados de Q e Qb
   initial begin
       Q = 0;
       Qb = 1;
   end

   always @(posedge clock or posedge reset) begin
       if (reset) begin
           Q <= 0;
			  Qb <= 1;
       end else if (T) begin
			Q <= ~Q;
			Qb <= Q;
       end
   end

endmodule 