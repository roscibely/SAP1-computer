
module RAM(input CE, reset, input reg [3:0] address, output reg [7:0] saida);
// [3:0] address: endereço armazenado em REM
//operação de leitura, colocando a instrução, apontada pela REM, no barramento W

logic [7:0] memory[0:15];

always_comb begin
  if (reset) begin
//Programa Teste 01 resultado = 01+02+03-04 = 02
   memory[0] <= 8'h09; // LDA 9H
   memory[1] <= 8'h1A; // ADD AH
   memory[2] <= 8'h1B; // ADD BH
   memory[3] <= 8'h2C; // SUB CH
   memory[4] <= 8'hE0; // OUT
   memory[5] <= 8'hF0; // HLT
   memory[6] <= 8'h00;
   memory[7] <= 8'h00;
   memory[8] <= 8'h00;
   memory[9] <= 8'h01;
   memory[10] <= 8'h02;
   memory[11] <= 8'h03;
   memory[12] <= 8'h04;
   memory[13] <= 8'h04;
   memory[14] <= 8'h04;
   memory[15] <= 8'h04;

/*Programa Teste 2 resultado = 4+3 = 7
  memory[0] <= 8'h0D; // LDA DH
  memory[1] <= 8'h1B; // ADD BH
  memory[2] <= 8'hE0; // OUT
  memory[3] <= 8'hF0; // HLT
  memory[4] <= 8'h00; 
  memory[5] <= 8'h00; 
  memory[6] <= 8'h00;
  memory[7] <= 8'h00;
  memory[8] <= 8'h00;
  memory[9] <= 8'h01;
  memory[10] <= 8'h02;
  memory[11] <= 8'h03;
  memory[12] <= 8'h02;
  memory[13] <= 8'h04;
  memory[14] <= 8'h04;
  memory[15] <= 8'h04;*/

  end
end

always @(CE) begin
 if(~CE)
   saida = memory[address];
 else saida = 8'hzz;
end


endmodule 
