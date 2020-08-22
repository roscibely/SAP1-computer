module RegB(input clock, reset, Lb, input reg [7:0] in, output logic [7:0] out);

	always @(posedge clock or posedge reset) begin
		if (reset)
                  out = 8'hzz;
		else if(~Lb)
		  out <= in;
              
	end

endmodule 
