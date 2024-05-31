// Declaracao do modulo
module Irrigacao (Us, Ua, T, M, L, ERRO, Bs, Vs);  

	// Declaracao de portas
	input Us, Ua, T, M, L, ERRO;
	output Bs, Vs;
	
	// Declaracao dos fios intermediarios
	wire Wire_us, Wire_ua, Wire_nt, Wire_nm, wire_onf, Wire_ne,
		  wire_bs1, wire_bs2, wire_vs1, wire_vs2;
	
	// Funcionamento do circuito
	
	// Fios com negações das entradas
	not Us1 (Wire_us, Us);
	not Ua1 (Wire_ua, Ua);
	not t1 (Wire_nt, T);
	not h1 (Wire_nh, H);
	not m1 (Wire_nm, M);
	not er1 (Wire_ne, ERRO);
	
	// Tratamento de quando a rega vai ligar
	and on_Off (wire_onf, Wire_us, Wire_ne, L);

	// Tratamento do tipo de Rega
	
	// Bomba de Aspersão
	and bs1 (wire_bs1, wire_onf, Wire_ua);
	and bs2 (wire_bs2, wire_onf, Wire_nt, M);
	or bs3 (Bs, wire_bs1, wire_bs2);
	
	// Valvula de Gotejamento 
	and vs1 (wire_vs1, wire_onf, Ua, Wire_nm);
	and vs2 (wire_vs2, wire_onf, Ua, T);
	or vs3 (Vs, wire_vs1, wire_vs2);

endmodule 