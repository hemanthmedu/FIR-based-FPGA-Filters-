`timescale 1ns/1ps

module booth_encoder_tb;

reg [11:0] coeff;

wire [1:0] booth_code0;
wire [1:0] booth_code1;
wire [1:0] booth_code2;
wire [1:0] booth_code3;
wire [1:0] booth_code4;
wire [1:0] booth_code5;

booth_encoder DUT(

    .coeff(coeff),

    .booth_code0(booth_code0),
    .booth_code1(booth_code1),
    .booth_code2(booth_code2),
    .booth_code3(booth_code3),
    .booth_code4(booth_code4),
    .booth_code5(booth_code5)

);

initial begin

    coeff = 12'b000000000000;
    #10;

    coeff = 12'b010101010101;
    #10;

    coeff = 12'b111100001111;
    #10;

    coeff = 12'b101010101010;
    #10;

    coeff = 12'b111111111111;
    #10;

    $finish;

end

initial begin

    $monitor(
    "coeff=%b bc5=%b bc4=%b bc3=%b bc2=%b bc1=%b bc0=%b",
     coeff,
     booth_code5,
     booth_code4,
     booth_code3,
     booth_code2,
     booth_code1,
     booth_code0);

end

endmodule
