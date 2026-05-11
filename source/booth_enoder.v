module booth_multiplier(output reg [1:0] y, input x1, x0);
always @(*) begin
  case({x1,x0})
    2'b00: y = 0;
    2'b01: y = 1;
    2'b10: y = 2;
    2'b11: y = 0;
  endcase
end
endmodule
