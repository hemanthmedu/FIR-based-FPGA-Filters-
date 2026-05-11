module booth_multiplier_tb;
reg x1, x0;
wire [1:0] y;
booth_multiplier uut(y, x1, x0);
initial 
begin
  x1=0; x0=0;
  #10 x1=0; x0=1;
  #10 x1=1; x0=0;
  #10 x1=1; x0=1;
  #10 $finish;
end
endmodule
