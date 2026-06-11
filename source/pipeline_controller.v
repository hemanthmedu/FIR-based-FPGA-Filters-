module pipeline_controller(

    input clk,
    input rst,

    output reg valid_out

);

reg [3:0] count;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        count <= 4'd0;
        valid_out <= 1'b0;
    end

    else
    begin

        if(count < 8)
        begin
            count <= count + 1'b1;
            valid_out <= 1'b0;
        end

        else
            valid_out <= 1'b1;

    end

end

endmodule
