


module MuxFP1 (exp1, exp2, sinalMuxFP1, smallestExp);

input [7:0] exp1;
input [7:0] exp2;
output [7:0] smallestExp; // Vai para MuxFP4
input sinalMuxFP1;

assign smallestExp = (sinalMuxFP1 == 1'b0) ? (exp1) : (exp2);

endmodule

module MuxFP2 (fraction1, fraction2, sinalMuxFP2, biggerFraction);

input [22:0] fraction1;
input [22:0] fraction2;
output [22:0] biggerFraction; // Vai receber shift para a direita e ir pra ULA grande
input sinalMuxFP2;

assign biggerFraction = (sinalMuxFP2 == 1'b0) ? (fraction1) : (fraction2);

endmodule

module MuxFP3 (fraction1, fraction2, sinalMuxFP3, smallerFraction);

input [22:0] fraction1;
input [22:0] fraction2;
output [22:0] smallerFraction; // Vai para ULA grande
input sinalMuxFP3;

assign smallerFraction = (sinalMuxFP3 == 1'b0) ? (fraction1) : (fraction2);

endmodule

module MuxFP4 (exp1, exp2, sinalMuxFP4, exp);

input [7:0] exp1;
input [7:0] exp2;
output [7:0] exp; // Será incrementado ou decrementado
input sinalMuxFP4;

assign exp = (sinalMuxFP4 == 1'b0) ? (exp1) : (exp2);

endmodule

module MuxFP5 (fraction1, fraction2, sinalMuxFP5, fraction);

input [7:0] fraction1;
input [7:0] fraction2;
output [7:0] fraction; // receberá shift para a direita ou esquerda
input sinalMuxFP5;

assign fraction = (sinalMuxFP5 == 1'b0) ? (fraction1) : (fraction2);

endmodule