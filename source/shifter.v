module shifter(input [7:0] a,sel,output reg [7:0] y);
always @(*) begin

    if(sel)
        y = a << 1;   
    else
        y = a >> 1;   

end

endmodule
