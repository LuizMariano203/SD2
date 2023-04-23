`timescale 1ns/1ns

module testbench;

    // Inputs
    reg [4:0] a_tb;
    reg [4:0] b_tb;
    reg clock_tb;
    reg sinal_tb;
    wire [5:0] res_tb;
    wire [63:0] doutMem_tb;
    reg weReg_tb;
    reg [4:0] Rw_tb;
    reg [4:0] Ra_tb, Rb_tb;
    wire [63:0] doutA_tb;
    wire [63:0] doutB_tb;
    reg weMem_tb;

    somador uut (
        .a(a_tb), 
        .b(b_tb), 
        .soma(res_tb),
        .sinal(sinal_tb)
    );

    registrador utt (

        .clk(clock_tb),
        .din(doutMem_tb),
        .we(weReg_tb),
        .Rw(Rw_tb),
        .Ra(Ra_tb),
        .Rb(Rb_tb),
        .doutA(doutA_tb),
        .doutB(doutB_tb)
    );

    memoria utu (

        .clk(clock_tb),
        .ads(res_tb),
        .we(weMem_tb),
        .din(doutA_tb),
        .dout(doutMem_tb)
    );

    initial 
    begin
        //Para simular, precisa-se dar o sinal de clock(que será 0 ou 1), também o sinal do somador(0 se for soma ou 1 se for subtração),
        //Ainda, deve-se fornecer o b_tb que é endereço que será somado com zero(a_tb), e que será o endereço da memória. Por fim, também
        //é necessário fornecer o rw_tb que irá como endereço do registrador no momento do load, e também fornecer o ra_tb que será o endereço
        //onde a informação será lida no registrador. Por fim, é necessário fornecer o we do registrador(weReg_tb) e o we da memória(weReg_tb).

        clock_tb = 0;
        sinal_tb=0;
        a_tb = 0;
        b_tb = 7;
        Rw_tb = 0;
        Ra_tb=0;
        #10
        #10

//*******************************Abaixo é a simulação do store na memória: ********************************************************************
        weReg_tb = 0;
        #10
            //Aqui é a demonstração do conteudo do registrador que futuramente será escrito na memória.
            // Já que o we do registrador esta zero, entao o douta vale 32 que eh o valor de registrador[0]
            $display(doutA_tb);

        weMem_tb=1;
            //Aqui foi escrito o conteudo de registrador[0] no registrador_memoria[7], pois o somador passou o valor 7,
        #10
        #10
        weMem_tb=0;
        #10
            //Aqui o display abaixo revela o que há na memoria na posição 7 e comprova o sucesso da operação store.
            $display(doutMem_tb);


//*******************************Abaixo é a simulação do load no registrador: ********************************************************************
    
        #10
        Rw_tb = 12;

        weReg_tb=1;
            //Aqui foi carregado os dados do doutMem_tb(que vale 32) no registrador da posição 12
        #10

        Ra_tb=12;
        weReg_tb=0;
        #10
            $display(doutA_tb); 
            //Esse display serve para provar que foi carregado os dados do doutMem_tb no registrador da posição 12
        
      
       
$finish;

     
    end

        always #1 clock_tb = ~clock_tb;
    
    



endmodule
