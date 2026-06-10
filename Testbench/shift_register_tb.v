module shift_reg_12bit_tb;

reg clk,rst,en;
reg signed [11:0] din;

wire signed [11:0] q0,q1,q2,q3,q4,q5,q6,q7;

shift_reg_12bit DUT(
    .clk(clk),
    .rst(rst),
    .en(en),
    .din(din),
    .q0(q0),
    .q1(q1),
    .q2(q2),
    .q3(q3),
    .q4(q4),
    .q5(q5),
    .q6(q6),
    .q7(q7)
);

always #5 clk=~clk;

initial begin
    clk=0;
    rst=1;
    en=0;
    din=0;

    #10 rst=0;
    en=1;

    din=12'd1; #10;
    din=12'd2; #10;
    din=12'd3; #10;
    din=12'd4; #10;
    din=12'd5; #10;

    #20 $finish;
end

endmodule
