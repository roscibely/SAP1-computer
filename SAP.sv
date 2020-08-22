module SAP(input clock, reset, output logic [7:0] resultado, output logic [11:0] CON, output logic [7:0] wbus, output logic [3:0] Nibblesup, output logic [3:0] counter, output logic [9:0] estado, output logic [3:0] ram_address, output logic [7:0] a, output logic [7:0] b);

//CON; //Cp Ep ~Lm ~CE ~LI ~EI ~La Ea Su Eu ~Lb ~Lo


//logic [7:0] cp, ula, ir, acc, ram;


	
	PC   PCSAP(.Cp(CON[11]), .clock(~clock),  .reset(~reset), .Ep(CON[10]), .wbus(wbus), .counter(counter));
	MAR   MARSAP(.Lm(CON[9]), .clock(clock), .in(wbus[3:0]), .ram_address(ram_address));
	RAM    RAMSAP(.reset(reset), .CE(CON[8]), .address(ram_address), .saida(wbus));
	IR    IRSAP(.clock(clock), .reset(reset), .LI(CON[7]), .EI(CON[6]), .wbus(wbus), .Nibbleinf(wbus), .Nibblesup(Nibblesup));
	UC      UCSAP(.clock(clock), .reset(reset), .in(Nibblesup), .CON(CON), .estado(estado));
	ACUMULADOR   ASAP(.clock(clock), .reset(reset), .La(CON[5]), .Ea(CON[4]), .in(wbus), .saidaBusW(wbus), .saidaDireta(a));
	ULA    ULASAP(.clk(clock), .Su(CON[3]), .Eu(CON[2]), .a(a), .b(b), .saida(wbus));
	RegB    RegBSAP(.clock(clock), .reset(reset), .Lb(CON[1]), .in(wbus), .out(b));
	RegOut   RegOutSAP(.clock(clock), .reset(reset), .Lo(CON[0]), .in(wbus), .out(resultado));
        //barramento b1(.clock(clock),.Ep(CON[10]), .Ce(CON[8]), .Ea(CON[4]), .Ei(CON[6]), .Eu(CON[2]), .cp(cp), .ram(ram), .ir(ir), .acc(acc), .ula(ula), .wbus(wbus));


endmodule 
