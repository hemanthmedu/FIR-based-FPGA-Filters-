module coeff_rom(
    input [2:0] addr,
    output reg signed [11:0] coeff
);

always @(*) begin

    case(addr)

        3'd0: coeff = 12'sd10;
        3'd1: coeff = 12'sd20;
        3'd2: coeff = 12'sd30;
        3'd3: coeff = 12'sd40;

        3'd4: coeff = 12'sd50;

        3'd5: coeff = 12'sd40;
        3'd6: coeff = 12'sd30;
        3'd7: coeff = 12'sd20;

        default: coeff = 12'sd0;

    endcase

end

endmodule
