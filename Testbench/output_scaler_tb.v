module output_scaler_tb;

reg signed [27:0] fir_out;
wire signed [11:0] scaled_out;

output_scaler DUT(
    .fir_out(fir_out),
    .scaled_out(scaled_out)
);

initial begin
    fir_out=28'sd204800;
    #20;

    fir_out=-28'sd102400;
    #20;

    $finish;
end

endmodule
