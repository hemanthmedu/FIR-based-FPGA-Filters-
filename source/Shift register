module shift_reg_12bit (input clk,input en,input rst,input din,output dout);
reg [11:0] shift;

always @(posedge clk or posedge rst) begin
    if (rst)
        shift <= 12'b0;
    else if (en)
        shift <= {shift[10:0], din};  // shift when enabled
end

assign dout = shift[11];

endmodule
