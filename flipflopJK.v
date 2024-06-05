//Implementação de um flip-flop do tipo JK

module flipflopJK(J, K, Clk, Q);

input J, K, Clk;
output Q;
reg q;

//Seta o valor inicial de Q como 0
initial begin
	q=1'b0;
end

always @(posedge Clk)
begin
	case({J, K})
		2'b00:q=q;
		2'b01:q=0;
		2'b10:q=1;
		2'b11:q=~q;
	endcase
end

endmodule