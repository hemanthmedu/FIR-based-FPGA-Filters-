module csa_24bit_tb;

reg [23:0] A,B,C;
wire [23:0] SUM,CARRY;

csa_24bit DUT(
    .A(A),
    .B(B),
    .C(C),
    .SUM(SUM),
    .CARRY(CARRY)
);

initial begin
    A=24'd10;
    B=24'd20;
    C=24'd30;

    #20;

    A=24'd100;
    B=24'd50;
    C=24'd25;

    #20 $finish;
end

endmodule
