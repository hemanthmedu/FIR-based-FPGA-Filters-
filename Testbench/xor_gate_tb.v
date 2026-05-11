module xor_gate_tb;
reg a, b;
wire y;
xor_gate uut(y, a, b);
initial 
begin
  a=0; b=0;
  #10 a=0; b=1;
  #10 a=1; b=0;
  #10 a=1; b=1;
  #10 $finish;
end
endmodule
