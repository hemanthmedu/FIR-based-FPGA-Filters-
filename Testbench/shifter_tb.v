module shifter_tb;

reg signed [27:0] a;
reg sel;

wire signed [27:0] y;

shifter DUT(
    .a(a),
    .sel(sel),
    .y(y)
);

initial begin
    a=28'sd100;

    sel=0;
    #20;

    sel=1;
    #20;

    a=-28'sd50;

    sel=0;
    #20;

    sel=1;
    #20;

    $finish;
end

endmodule
