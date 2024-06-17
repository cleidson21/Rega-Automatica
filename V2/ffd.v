// Declaracao do modulo do flip-flop D
module ffd (D, clk, Q, rst);

	// Declaracao de portas
	input D, rst; 
	input clk;
	output reg Q; 
	
	always @(posedge clk or posedge rst) 
		begin
		 if(rst == 1'b1)
			  Q <= 1'b0; 
			 else 
			  Q <= D;
		end 
		
endmodule
