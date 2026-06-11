module coeff_rom(

    output signed [11:0] coeff0,
    output signed [11:0] coeff1,
    output signed [11:0] coeff2,
    output signed [11:0] coeff3,
    output signed [11:0] coeff4,
    output signed [11:0] coeff5,
    output signed [11:0] coeff6,
    output signed [11:0] coeff7

);

assign coeff0 = 12'sd10;
assign coeff1 = 12'sd20;
assign coeff2 = 12'sd30;
assign coeff3 = 12'sd40;
assign coeff4 = 12'sd50;
assign coeff5 = 12'sd40;
assign coeff6 = 12'sd30;
assign coeff7 = 12'sd20;

endmodule
