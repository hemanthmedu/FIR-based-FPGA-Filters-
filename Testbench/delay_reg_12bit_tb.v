module delay_reg_12bit_tb;

reg clk,rst,en;
reg signed [11:0] din;
wire signed [11:0] dout;

delay_reg_12bit DUT(
    .clk(clk),
    .rst(rst),
    .en(en),
    .din(din),
    .dout(dout)
);

always #5 clk = ~clk;

initial begin
    clk=0; rst=1; en=0; din=0;

    #10 rst=0;
    en=1; din=12'sd25;

    #10 din=12'sd50;
    #10 din=-12'sd15;

    #20 $finish;
end

endmodule
