
module ACUMULADOR(input clock, reset, La, Ea, input reg [7:0] in, output logic [7:0] saidaBusW, output logic [7:0] saidaDireta);

always_ff @(posedge clock or posedge reset) begin 
  if (reset) begin
   saidaDireta <=0;
  end 
  else begin 
   if(~La) 
    saidaDireta <= in;  
  end
end

assign saidaBusW = (Ea)? saidaDireta: 8'hzz;

endmodule 