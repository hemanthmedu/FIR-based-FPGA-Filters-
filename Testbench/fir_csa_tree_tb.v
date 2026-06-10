module fir_csa_tree_tb;

reg [23:0] M0,M1,M2,M3,M4,M5,M6,M7;
wire [27:0] FINAL_OUT;

fir_csa_tree DUT(
    .M0(M0),.M1(M1),.M2(M2),.M3(M3),
    .M4(M4),.M5(M5),.M6(M6),.M7(M7),
    .FINAL_OUT(FINAL_OUT)
);

initial begin
    M0=10; M1=20; M2=30; M3=40;
    M4=50; M5=60; M6=70; M7=80;

    #20;

    M0=1; M1=2; M2=3; M3=4;
    M4=5; M5=6; M6=7; M7=8;

    #20 $finish;
end

endmodule
