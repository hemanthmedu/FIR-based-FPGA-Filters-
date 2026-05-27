module delay_reg_12bit(
    input clk,
    input rst,
    input en,
    input signed [11:0] din,
    output reg signed [11:0] dout
);

always @(posedge clk) begin
    if(rst)
        dout <= 12'd0;

    else if(en)
        dout <= din;
end

endmodule
