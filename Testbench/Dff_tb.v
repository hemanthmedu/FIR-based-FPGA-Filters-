module D_flip_tb();
reg clk, en, rst, d;
wire q;
D_flip uut (.clk(clk),.en(en),.rst(rst),.d(d),.q(q));
always #5 clk = ~clk;
initial begin
    clk = 0; rst = 1; en = 0; d = 0;
    #10 rst = 0; en = 1;

    d = 1;
     #10;
    d = 0;
     #10;

    en = 0;   
    d = 1; 
    #10;

    en = 1;  
    d = 1;
    #10;

    #20 $stop;
end
endmodule
