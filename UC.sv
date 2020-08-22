
module UC(input clock, reset, input reg [3:0] in, output logic [11:0]  CON, output logic [9:0] estado );
//in: op code
//Contador em Anel
reg [5:0] T; //ringcount

parameter T1 = 6'b000001,
   T2 = 6'b000010,
   T3 = 6'b000100;
always_ff @ (negedge clock or posedge reset)begin
	if(reset)
		T <= 6'b000001;
	else begin
		case(T)  
			6'b000001: T <= 6'b000010;
			6'b000010: T <= 6'b000100;
			6'b000100: T <= 6'b001000;
			6'b001000: T <= 6'b010000;
			6'b010000: T <= 6'b100000; 
			6'b100000: T <= 6'b000001;
		endcase
	end
end

assign estado = {T,in};

always_ff @(negedge clock or posedge reset) begin 
     if(reset)
		CON <= 12'h3E3;
	case (estado)
	{T1, in}: CON <= 12'h5E3;    
	{T2, in}: CON <= 12'hBE3;
	{T3, in}: CON <= 12'h263;  
	//LDA 0000
	10'b0010000000: CON <= 12'h1A3;
	10'b0100000000: CON <= 12'h2C3;
	10'b1000000000: CON <= 12'h3E3;
	//ADD 0001
	10'b0010000001: CON <= 12'h1A3;
	10'b0100000001: CON <= 12'h2E1;
	10'b1000000001: CON <= 12'h3C7;
	//SUB 0010
	10'b0010000010: CON <= 12'h1A3;
	10'b0100000010: CON <= 12'h2E1;
	10'b1000000010: CON <= 12'h3CF;
	//OUT 1110
	10'b0010001110: CON <= 12'h3F2;
	10'b0100001110: CON <= 12'h3E3;
	10'b1000001110: CON <= 12'h3E3;
	//HLT 1111
	10'b0010001111: CON <= 12'h3E3;
	10'b0100001111: CON <= 12'h3E3;
	10'b1000001111: CON <= 12'h3E3;
	endcase
end 

endmodule 
