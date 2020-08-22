
module ULA(input Su, Eu, clk, input  [7:0] a, input  [7:0] b, output wire [7:0] saida);

assign saida = (Eu)? ((!Su)? (a+b): (a-b)): 8'hzz;
		
endmodule 