module Mux8_4b(s0, s1, s2, w0, w1, w2, w3, w4, w5, w6, w7, f);
input s0, s1, s2;
input [3:0] w0, w1, w2, w3, w4, w5, w6, w7;
output [3:0] f;
wire [3:0] mux1, mux2, mux3, mux4,  mux5, mux6;
assign mux1 = s0 ? w1 : w0;
assign mux2 = s0 ? w3 : w2;
assign mux3 = s0 ? w5 : w4;
assign mux4 = s0 ? w7 : w6;
assign mux5 = s1 ? mux2 : mux1;
assign mux6 = s1 ? mux4 : mux3;
assign f = s2 ? mux6 : mux5;
endmodule
