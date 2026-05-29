module output_scaler(

    input signed [27:0] fir_out,

    output signed [11:0] scaled_out

);

assign scaled_out = fir_out[22:11];

endmodule
