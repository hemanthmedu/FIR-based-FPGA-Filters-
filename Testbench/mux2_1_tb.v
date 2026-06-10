module mux_2_12bit_tb;

reg signed [11:0] a,b;
reg sel;

wire signed [11:0] y;

mux_2_12bit DUT(
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
);

initial begin
    a=12'sd20;
    b=12'sd50;

    sel=0;
    #10;

    sel=1;
    #10;

    a=-12'sd15;
    b=12'sd10;

    sel=0;
    #10;

    sel=1;
    #10 $finish;
end

endmodule
