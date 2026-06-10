module booth_encoder(

    input  [11:0] coeff,

    output reg [1:0] booth_code0,
    output reg [1:0] booth_code1,
    output reg [1:0] booth_code2,
    output reg [1:0] booth_code3,
    output reg [1:0] booth_code4,
    output reg [1:0] booth_code5

);

always @(*) begin

    booth_code0 = coeff[1:0];
    booth_code1 = coeff[3:2];
    booth_code2 = coeff[5:4];
    booth_code3 = coeff[7:6];
    booth_code4 = coeff[9:8];
    booth_code5 = coeff[11:10];

end

endmodule
