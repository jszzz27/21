module FA (Cin,X,Y,S,Cout);
input Cin,X,Y;
output Cout,S;
assign S = X ^ (Y ^ Cin);
assign Cout = (Y & Cin) | (X & Cin) | (X & Y);
endmodule
