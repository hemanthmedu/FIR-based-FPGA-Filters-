

module tb_csa_24bit;

reg  [23:0] A;
reg  [23:0] B;
reg  [23:0] C;

wire [23:0] SUM;
wire [23:0] CARRY;

wire [24:0] FINAL;

csa_24bit DUT (.A(A),.B(B),.C(C),.SUM(SUM),.CARRY(CARRY));

assign FINAL = SUM + (CARRY << 1);

initial
begin

    A = 24'd10;
    B = 24'd20;
    C = 24'd30;

    #10;

    A = 24'd100;
    B = 24'd200;
    C = 24'd300;

    #10;

    A = 24'd1000;
    B = 24'd2000;
    C = 24'd3000;

    #10;
    A = 24'd4096;
    B = 24'd2048;
    C = 24'd1024;

    #10;
    A = 24'd50000;
    B = 24'd25000;
    C = 24'd12500;

    #10;


    $finish;

end

initial
begin

    $monitor("TIME=%0t | A=%d B=%d C=%d | SUM=%d CARRY=%d | FINAL=%d",$time, A, B, C, SUM, CARRY, FINAL);

end

endmodule
