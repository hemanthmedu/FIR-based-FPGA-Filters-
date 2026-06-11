`timescale 1ns/1ps

module pipeline_controller_tb;

reg clk;
reg rst;

wire valid_out;

pipeline_controller DUT(
    .clk(clk),
    .rst(rst),
    .valid_out(valid_out)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #150;

    $finish;

end

endmodule
