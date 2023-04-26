`timescale 1ns/1ns

module testbench;

    // Inputs
    wire [63:0] a_tb;
    reg clock_tb;
    reg sinal_tb;
    wire [5:0] res_tb;
    wire [63:0] doutMem_tb;
    reg weReg_tb;
    reg [4:0] Rw_tb;
    reg [63:0] Ra_tb, Rb_tb;
    wire [63:0] doutA_tb;
    wire [63:0] doutB_tb;
    wire [63:0] S1_tb;
    wire [63:0] S2_tb;
    reg weMem_tb;
    reg sinalMux_tb;
    reg C_tb;

    adder uut (
        .a(S1_tb), 
        .b(doutA_tb), 
        .soma(res_tb),
        .sinal(sinal_tb)
    );

    registrador utt (

        .clk(clock_tb),
        .din(S2_tb),
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
        .we(weMem),
        .din(doutB_tb),
        .dout(doutMem_tb)
    );

    Mux1 utv (
        .C(C_tb),
        .Rb(doutB_tb),
        .sinalMux(sinalMux_tb),
        .S1(a_tb)
    );

    Mux2 uvv (
        .dout(doutMem_tb),
        .soma(res_tb),
        .sinalMux(sinalMux_tb),
        .S2(S2_tb)
    );


    initial 
    begin
         //Para simular, precisa-se dar o sinal de clock(que será 0 ou 1), também o sinal do somador(0 se for soma ou 1 se for subtração),
        //Ainda, deve-se fornecer o b_tb que é endereço que será somado com zero(a_tb), e que será o endereço da memória. Por fim, também
        //é necessário fornecer o rw_tb que irá como endereço do registrador no momento do load, e também fornecer o ra_tb que será o endereço
        //onde a informação será lida no registrador. Por fim, é necessário fornecer o we do registrador(weReg_tb) e o we da memória(weReg_tb).

        clock_tb = 0;
        sinal_tb=0;
        Rw_tb = 1;
        Ra_tb= 0;
        C_tb = 0;
        sinalMux_tb = 0;
        #10
        #10

//*******************************Abaixo é a simulação do load no registrador: ********************************************************************
    
        #10

        weReg_tb=1;

        #10
        Rw_tb = 2;
        Ra_tb = 0;
        C_tb = 1;
        sinalMux_tb = 0;
        #10
        $display(doutA_tb); 

        
      
        // Add

        Ra_tb = 2;
        Rb_tb = 1;
        Rw_tb = 3;
        sinalMux_tb =1;
        #10
        #10
        weReg_tb = 1;
        #10
        //Sub
        Ra_tb = 3;
        Rb_tb = 1;
        Rw_tb = 4;
        sinal_tb = 1;
        #10
        #10
        weReg_tb = 1;
      

//*******************************Abaixo é a simulação do store na memória: ********************************************************************
        weReg_tb = 0;
        #10
            //Aqui é a demonstração do conteudo do registrador que futuramente será escrito na memória.
            // Já que o we do registrador esta zero, entao o douta vale 32 que eh o valor de registrador[0]
            $display(doutA_tb);

        weMem_tb=1;

        #10
        #10
        weMem_tb=0;
        #10
  
            $display(doutMem_tb);

        // Add

        Ra_tb = 2;
        Rb_tb = 1;
        Rw_tb = 3;
        sinalMux_tb =1;
        #10
        #10
        weReg_tb = 1;
        #10
        //Sub
        Ra_tb = 3;
        Rb_tb = 1;
        Rw_tb = 4;
        sinal_tb = 1;
        #10
        #10
        weReg_tb = 1;






       
$finish;

     
    end

        always #1 clock_tb = ~clock_tb;
    
    



endmodule