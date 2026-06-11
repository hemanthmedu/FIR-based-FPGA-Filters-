`timescale 1ns/1ps

module coeff_rom_tb;

wire signed [11:0] coeff0;
wire signed [11:0] coeff1;
wire signed [11:0] coeff2;
wire signed [11:0] coeff3;
wire signed [11:0] coeff4;
wire signed [11:0] coeff5;
wire signed [11:0] coeff6;
wire signed [11:0] coeff7;

// Instantiate DUT

coeff_rom DUT (
    .coeff0(coeff0),
    .coeff1(coeff1),
    .coeff2(coeff2),
    .coeff3(coeff3),
    .coeff4(coeff4),
    .coeff5(coeff5),
    .coeff6(coeff6),
    .coeff7(coeff7)
);

initial begin

    #10;


    $display(" FIR Filter Coefficients from ROM ");
   

    $display("coeff0 = %d", coeff0);
    $display("coeff1 = %d", coeff1);
    $display("coeff2 = %d", coeff2);
    $display("coeff3 = %d", coeff3);
    $display("coeff4 = %d", coeff4);
    $display("coeff5 = %d", coeff5);
    $display("coeff6 = %d", coeff6);
    $display("coeff7 = %d", coeff7);


    $finish;

end

endmodule
