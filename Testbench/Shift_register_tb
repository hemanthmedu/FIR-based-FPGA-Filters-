module shift_reg_tb;

reg clk, rst, en, din;
wire dout;

shift_reg_12bit uut (.clk(clk),.en(en),.rst(rst),.din(din),.dout(dout));
always #5 clk = ~clk;
initial 
begin
    clk = 0; rst = 1; en = 0; din = 0;

    #10 rst = 0; en = 1;

    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;

    #50 $stop;
end

endmodule
