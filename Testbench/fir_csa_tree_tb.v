`timescale 1ns/1ps

module booth_multiplier_tb;

reg signed [11:0] sample;
reg signed [11:0] coeff;

wire signed [23:0] product;

booth_multiplier DUT(

    .sample(sample),
    .coeff(coeff),
    .product(product)

);

initial
begin

    $display("Time\tSample\tCoeff\tProduct");

    sample = 12'sd10;
    coeff  = 12'sd20;
    #10;
    $display("%0t\t%d\t%d\t%d",$time,sample,coeff,product);

    sample = 12'sd25;
    coeff  = 12'sd4;
    #10;
    $display("%0t\t%d\t%d\t%d",$time,sample,coeff,product);

    sample = -12'sd15;
    coeff  = 12'sd8;
    #10;
    $display("%0t\t%d\t%d\t%d",$time,sample,coeff,product);

    sample = 12'sd12;
    coeff  = -12'sd5;
    #10;
    $display("%0t\t%d\t%d\t%d",$time,sample,coeff,product);

    sample = -12'sd10;
    coeff  = -12'sd10;
    #10;
    $display("%0t\t%d\t%d\t%d",$time,sample,coeff,product);

    sample = 12'sd0;
    coeff  = 12'sd100;
    #10;
    $display("%0t\t%d\t%d\t%d",$time,sample,coeff,product);

    #10 $finish;

end

endmodule
