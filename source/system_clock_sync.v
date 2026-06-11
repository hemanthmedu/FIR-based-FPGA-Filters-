module system_clock_sync(

    input clk,
    input rst,

    output reg sample_en

);

always @(posedge clk or posedge rst)
begin

    if(rst)
        sample_en <= 1'b0;

    else
        sample_en <= 1'b1;

end

endmodule
