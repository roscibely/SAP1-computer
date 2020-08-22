
module RegOut(input clock, reset, Lo, input reg [7:0] in, output logic [7:0] out);

	always @(posedge clock or posedge reset) begin
                if (reset)
                  out = 8'hzz;
		else if(~Lo)
		  out <= in;
               
	end

endmodule 