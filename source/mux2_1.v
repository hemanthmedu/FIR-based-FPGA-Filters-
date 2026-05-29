module mux_2_12bit(

    input signed [11:0] a,
    input signed [11:0] b,

    input sel,

    output signed [11:0] y

);

assign y = (sel) ? b : a;

endmodule
