module booth_multiplier_leaf(

    input signed [11:0] sample,
    input signed [11:0] coeff,

    output signed [23:0] product

);

wire [1:0] booth_code0;
wire [1:0] booth_code1;

wire signed [23:0] pp0;
wire signed [23:0] pp1;

wire signed [23:0] shift_pp0;
wire signed [23:0] shift_pp1;

wire [23:0] SUM;
wire [23:0] CARRY;


booth_encoder BE0(.x1(coeff[1]),.x0(coeff[0]),.booth_code(booth_code0));


booth_encoder BE1(.x1(coeff[3]),.x0(coeff[2]),.booth_code(booth_code1));


partial_product_generator PPG0(.multiplicand(sample),.booth_code(booth_code0),.partial_product(pp0));


partial_product_generator PPG1(.multiplicand(sample),.booth_code(booth_code1),.partial_product(pp1));


booth_shifter BS0(.partial_product(pp0),.shift_value(4'd0),.shifted_product(shift_pp0));

booth_shifter BS1(.partial_product(pp1),.shift_value(4'd2),.shifted_product(shift_pp1));


csa_24bit CSA1(.A(shift_pp0),.B(shift_pp1),.C(24'd0),.SUM(SUM),.CARRY(CARRY));


final_adder FA1(.SUM(SUM),.CARRY(CARRY),.PRODUCT(product));

endmodule
