module csa_12bit_tb();
reg  [11:0] A, B, C;
wire [11:0] SUM, CARRY;
wire [12:0] FINAL_RESULT;
reg [12:0] expected;
csa_12bit DUT (.A(A),.B(B),.C(C),.SUM(SUM),.CARRY(CARRY));
assign FINAL_RESULT = SUM + (CARRY << 1);

initial
  begin
    $monitor("A=%d B=%d C=%d | SUM=%d CARRY=%d FINAL=%d",
              A, B, C, SUM, CARRY, FINAL_RESULT);

    A = 12'd10; B = 12'd5; C = 12'd3;
    #10;
    A = 12'd100; B = 12'd200; C = 12'd50;
    #10;
    A = 12'd4095; B = 12'd1; C = 12'd2;
    #10;
    A = 12'd1234; B = 12'd567; C = 12'd890;
    #10;

    $finish;
end

endmodule
