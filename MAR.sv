module MAR(input Lm, clock, input reg [3:0] in, output logic [3:0] ram_address);
//Lm bit de controle
// in: endereco da instrucao
always_ff @ (posedge clock) begin 
		if(~Lm) begin
			ram_address = in; 
		end
		else begin
			ram_address <= ram_address;
		end
end
endmodule 

