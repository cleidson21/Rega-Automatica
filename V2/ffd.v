// Declaracao do modulo do flip-flop D
module ffd (D,clk,Q);

	// Declaracao de portas
	input D; 
	input clk;
	output reg Q; 
	
	always @(posedge clk) 
		begin
		 Q <= D; 
		end 
		
endmodule
