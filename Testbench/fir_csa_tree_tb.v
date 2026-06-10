module booth_multiplier(

    input  signed [11:0] sample,
    input  signed [11:0] coeff,

    output signed [23:0] product

);

assign product = sample * coeff;

endmodule
