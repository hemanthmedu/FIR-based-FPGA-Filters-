module fir_multiplier_tb;

reg signed [11:0] sample;
reg signed [11:0] coeff;

wire signed [23:0] product;

fir_multiplier DUT(
    .sample(sample),
    .coeff(coeff),
    .product(product)
);

initial begin
    sample=12'sd10;
    coeff=12'sd20;

    #20;

    sample=-12'sd15;
    coeff=12'sd8;

    #20 $finish;
end

endmodule
