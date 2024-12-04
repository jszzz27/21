module regfile(DATAP3, DATAP2, DATAP1, DATAP0, DATAQ3, DATAQ2, DATAQ1, DATAQ0, RP2, RP1, RP0, RQ2, RQ1, RQ0, WA2, WA1, WA0, LD_DATA, WR, CLRN, CLK);

	input RP2, RP1, RP0, RQ2, RQ1, RQ0, WA2, WA1, WA0, WR, CLRN, CLK;

	input [3:0] LD_DATA;

	output DATAP3, DATAP2, DATAP1, DATAP0, DATAQ3, DATAQ2, DATAQ1, DATAQ0;
	
	wire [3:0] VALUE0, VALUE1, VALUE2, VALUE3, VALUE4, VALUE5, VALUE6, VALUE7;
	wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7; 

	Decoder3to8 my_decoder(.en(WR), .x2(WA2), .x1(WA1), .x0(WA0), .w0(Y0), .w1(Y1), .w2(Y2), .w3(Y3), .w4(Y4), .w5(Y5), .w6(Y6), .w7(Y7));

	reg4 my_reg0(.IN(LD_DATA), .LOAD(Y0), .clock(CLK), .OUT(VALUE0), .CLRN(CLRN));
	reg4 my_reg1(.IN(LD_DATA), .LOAD(Y1), .clock(CLK), .OUT(VALUE1), .CLRN(CLRN));
	reg4 my_reg2(.IN(LD_DATA), .LOAD(Y2), .clock(CLK), .OUT(VALUE2), .CLRN(CLRN));
	reg4 my_reg3(.IN(LD_DATA), .LOAD(Y3), .clock(CLK), .OUT(VALUE3), .CLRN(CLRN));
	reg4 my_reg4(.IN(LD_DATA), .LOAD(Y4), .clock(CLK), .OUT(VALUE4), .CLRN(CLRN));
	reg4 my_reg5(.IN(LD_DATA), .LOAD(Y5), .clock(CLK), .OUT(VALUE5), .CLRN(CLRN));
	reg4 my_reg6(.IN(LD_DATA), .LOAD(Y6), .clock(CLK), .OUT(VALUE6), .CLRN(CLRN));
	reg4 my_reg7(.IN(LD_DATA), .LOAD(Y7), .clock(CLK), .OUT(VALUE7), .CLRN(CLRN));

	Mux8_4b my_muxP(.s2(RP2), .s1(RP1), .s0(RP0), .w0(VALUE0), .w1(VALUE1), .w2(VALUE2), .w3(VALUE3), .w4(VALUE4), .w5(VALUE5), .w6(VALUE6), .w7(VALUE7), .f(DATAP));
	Mux8_4b my_muxQ(.s2(RQ2), .s1(RQ1), .s0(RQ0), .w0(VALUE0), .w1(VALUE1), .w2(VALUE2), .w3(VALUE3), .w4(VALUE4), .w5(VALUE5), .w6(VALUE6), .w7(VALUE7), .f(DATAQ));

	wire [3:0] DATAP, DATAQ;
	
	assign DATAP3 = DATAP[3];
	assign DATAP2 = DATAP[2];
	assign DATAP1 = DATAP[1];
	assign DATAP0 = DATAP[0];
	assign DATAQ3 = DATAQ[3];
	assign DATAQ2 = DATAQ[2];
	assign DATAQ1 = DATAQ[1];
	assign DATAQ0 = DATAQ[0];


endmodule
