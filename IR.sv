
module IR(input clock, reset, LI, EI, input reg [7:0] wbus, output logic [7:0] Nibbleinf, output logic [3:0] Nibblesup);

logic [7:0] Nibblesup_reg, Nibbleinf_reg;
always_ff @(posedge clock or posedge reset) begin
	if(reset)begin
		Nibbleinf = 8'hzz;
		Nibblesup = 8'hzz;
                Nibblesup_reg = 0;
                Nibbleinf_reg = 0;
	end
	else begin
	   if(~EI) begin
		Nibbleinf = Nibbleinf_reg;	
	   end
           else  if(~LI) begin
		Nibbleinf_reg = wbus[7:0];
		Nibblesup= wbus[7:4];
	   end
	
 end
end 
endmodule 