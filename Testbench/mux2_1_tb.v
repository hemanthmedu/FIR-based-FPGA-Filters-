module mux_2_tb;
reg a, b, sel;
wire y;
mux_2 uut (.a(a), .b(b), .sel(sel), .y(y));
initial 
begin
    $monitor("sel=%b a=%b b=%b y=%b", sel, a, b, y);

    a=0; b=1; sel=0;
     #10;
    a=1; b=0; sel=1;
     #10;

    $finish;
end

endmodule
