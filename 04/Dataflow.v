module adder (a,b,sinal, soma);

input signed [63:0] a, b;
output signed [63:0] soma;
input sinal;


assign soma = (sinal == 1'b0) ? (a + b):(a-b);
            
endmodule

module memoria(ads, clk, we, din, dout);
  
input [5 :0] ads;
input clk;
input we;
input [63:0] din;
output reg [63:0] dout;
reg [63:0] registradores [31:0]; // Registradores

initial begin
   
    registradores[0] = 45;
    registradores[1] = 11;
end

always@(posedge clk) begin

    if (we)
        begin
          registradores[ads] <= din; // Escreve na memoria
        end
    else 
        begin
            dout <= registradores[ads]; // Lê a memoria
        end
end


endmodule

module registrador (clk, din, we, Rw, Ra, Rb, doutA, doutB);
    input clk;             // Clock do sistema
    input [63:0] din; // Dados de entrada  
    input we;          // Sinal de carregamento de dados
    output reg [64-1:0] doutA; 
    output reg [64-1:0]  doutB; // Dados de saída
    input [4:0] Rw;
    input [4:0] Ra;
    input [4:0] Rb;

    reg [63:0] registradores [31:0]; //Registradores

    initial begin

        registradores[0] = 0;
        registradores[1] = 1;

    end

    always @(posedge clk) begin
          

        if (we) begin // Se o sinal de carregamento de dados estiver ativo
            registradores[Rw] <= din; // Carrega os dados de entrada no registrador
          
    
        end
        else
        begin
            doutA <= registradores[Ra]; // Lê os dados do registrador 
            doutB <= registradores[Rb]; // Lê os dados do registrador 

    end
    end

    

endmodule

module Mux1 (C,Rb,sinalMux,S1 );

input signed [63:0] C, Rb;
output signed [63:0] S1;
input sinalMux;


assign S1 = (sinalMux == 1'b0) ? C: Rb;
            
endmodule


module Mux2 (dout, soma ,sinalMux, S2);

input signed [63:0] dout, soma;
output signed [63:0] S2;
input sinalMux;


assign S2 = (sinalMux == 1'b0) ? (dout):(soma);
            
endmodule