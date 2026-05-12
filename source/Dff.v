module D_flip(input clk,input en,input rst,input d,output reg q);
wire gclk;   
assign gclk = clk & en; 
always @(posedge gclk or posedge rst) begin
    if (rst)
        q <= 0;
    else
        q <= d;
end
endmodule
