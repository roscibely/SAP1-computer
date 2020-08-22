
module PC(input Cp, clock, reset, Ep, output logic [7:0] wbus, output logic [3:0] counter);

 //Cp: contador de programa: habilita o contador
 //Ep:
 //counter: contador
always_ff @(negedge clock or negedge reset) begin //Clock funciona na borda negaiva
	if(~reset)begin 
		counter <= 4'b0000;
	end
	else if(Cp) begin
		counter = counter + 4'b0001; //endereço da próxima instrução a ser buscada e executada.
	end
	
end
assign wbus = (Ep)? {4'b0000, counter}: 8'bzz;
	
endmodule 