// Declaracao do modulo do flip-flop D
module flipflopD (D, clk, reset, Q);

	// Declaracao de portas
	input D; 						
	input clk; 
	input reset; 
	output reg Q; 
	
	always @(posedge clk or posedge reset) 
		begin
			if(reset==1'b1)
				Q <= 1'b0; 
			else 
				Q <= D; 
		end 
endmodule 