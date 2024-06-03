// Declaracao do modulo do flip-flop T
module flipflopT (T, clock, reset, Q);

	// Declaracao de portas
   input T;
   input clock;
   input reset;
   output reg Q;

   always @(posedge clock or posedge reset) begin
       if (reset) begin
           Q <= 0;
       end else if (T) begin
			Q <= ~Q;
       end
   end

endmodule 