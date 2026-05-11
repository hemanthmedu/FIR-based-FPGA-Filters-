module coeff_rom (
    input [2:0] addr,
    output reg [11:0] data
);
always @(*) begin
    case(addr)
        3'd0: data = 12'd10;
        3'd1: data = 12'd20;
        3'd2: data = 12'd30;
        3'd3: data = 12'd40;
        3'd4: data = 12'd50;
        3'd5: data = 12'd40;
        3'd6: data = 12'd30;
        3'd7: data = 12'd20;
        default: data = 0;
    endcase
end
endmodule
