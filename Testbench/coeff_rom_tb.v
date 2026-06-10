module coeff_rom_tb;

reg [2:0] addr;
wire signed [11:0] coeff;

coeff_rom DUT(
    .addr(addr),
    .coeff(coeff)
);

initial begin
    addr=0;
    repeat(8)
    begin
        #10 addr=addr+1;
    end
    #10 $finish;
end

endmodule
