`timescale 1ns/1ps

module tb_fir_csa_tree;

reg  [23:0] M0;
reg  [23:0] M1;
reg  [23:0] M2;
reg  [23:0] M3;
reg  [23:0] M4;
reg  [23:0] M5;
reg  [23:0] M6;
reg  [23:0] M7;

wire [27:0] FINAL_OUT;

fir_csa_tree DUT (

    .M0(M0),
    .M1(M1),
    .M2(M2),
    .M3(M3),
    .M4(M4),
    .M5(M5),
    .M6(M6),
    .M7(M7),

    .FINAL_OUT(FINAL_OUT)

);


initial
begin

    M0 = 24'd10;
    M1 = 24'd20;
    M2 = 24'd30;
    M3 = 24'd40;
    M4 = 24'd50;
    M5 = 24'd60;
    M6 = 24'd70;
    M7 = 24'd80;

    #10;

    M0 = 24'd100;
    M1 = 24'd200;
    M2 = 24'd300;
    M3 = 24'd400;
    M4 = 24'd500;
    M5 = 24'd600;
    M6 = 24'd700;
    M7 = 24'd800;

    #10;

    $finish;

end


initial
begin

    $monitor(
    "TIME=%0t FINAL_OUT=%d",
     $time, FINAL_OUT
    );

end

endmodule
