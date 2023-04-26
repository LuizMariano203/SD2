module Mux1 (a,b,sinal, soma);

input signed [63:0] a, b;
output signed [63:0] output;
input sinal;


assign output = (sinal == 1'b0) ? (a + b):(a-b);
            
endmodule