// Declaracao do modulo
module Irrigacao (Us, Ua, T, Nv_Medio, Nv_Baixo, Err, Bs, Vs);  

	// Declaracao de portas
	input Us, Ua, T, Nv_Medio, Nv_Baixo, Err;
	output Bs, Vs;
	
	// Declaracao dos fios intermediarios
	wire Wire_us, Wire_ua, Wire_ne, Wire_nt, Wire_nm, Wire_V, wire_onf,
		  wire_bs1, wire_bs2, wire_vs1, wire_vs2;
	
	// Funcionamento do circuito
	
	// Fios com negações das entradas
	not Us1 (Wire_us, Us);
	not Ua1 (Wire_ua, Ua);
	not er1 (Wire_ne, Err);
	not t1 (Wire_nt, T);
	not m1 (Wire_nm, Nv_Medio);
	
	// Tratamento de quando a rega vai ligar
	and on_Off (wire_onf, Wire_us, Wire_ne, Nv_Baixo);

	// Tratamento do tipo de Rega
	
	// Bomba de Aspersão
	and bs1 (wire_bs1, Wire_nt, Nv_Medio);
	or bs2 (wire_bs2, wire_bs1, Wire_ua);
	and bs3 (Bs, wire_onf, wire_bs2);
	
	// Valvula de Gotejamento
	or vs1 (wire_vs1, T, Wire_nm);
	and vs2 (wire_vs2, wire_vs1, Ua);
	and vs3 (Vs, wire_onf, wire_vs2);
	
endmodule 