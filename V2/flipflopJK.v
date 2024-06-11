//Implementação de um flip-flop do tipo JK

module flipflopJK(J, K, Reset, Preset, Clk, q);

input J, K, Reset, Preset, Clk;
output reg q;

always @(posedge Clk or posedge Preset or posedge Reset)
begin
	//Implementa o reset
	if(Reset)begin
		q <= 0;
	//Implementa o preset
	end else if(Preset)begin
		q <= 1;
	end
	else case({J, K})
		2'b00:q <= q;
		2'b01:q <= 0;
		2'b10:q <= 1;
		2'b11:q <= ~q;
	endcase
end

endmodule