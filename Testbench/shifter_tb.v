module shifter_tb();

reg [7:0] a;
reg sel;
wire [7:0] y;

shifter uut (.a(a),.sel(sel),.y(y));

initial 
  begin

    a = 8'b00000101;

    sel = 0;   
    #10;

    sel = 1;  
    #10;

    $finish;

end

endmodule
