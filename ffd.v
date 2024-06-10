// Declaracao do modulo do flip-flop D
module ffd (D, clock, reset, Q, Qb);

	// Declaracao de portas
   input D;
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
       end else if (D) begin
			Q <= D;
			Qb <= ~D;
       end
   end

endmodule 