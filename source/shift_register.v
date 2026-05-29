module shift_reg_12bit(

    input clk,
    input rst,
    input en,

    input signed [11:0] din,

    output reg signed [11:0] q0,
    output reg signed [11:0] q1,
    output reg signed [11:0] q2,
    output reg signed [11:0] q3,
    output reg signed [11:0] q4,
    output reg signed [11:0] q5,
    output reg signed [11:0] q6,
    output reg signed [11:0] q7

);

always @(posedge clk)

begin

    if(rst)

    begin

        q0 <= 0;
        q1 <= 0;
        q2 <= 0;
        q3 <= 0;
        q4 <= 0;
        q5 <= 0;
        q6 <= 0;
        q7 <= 0;

    end

    else if(en)

    begin

        q7 <= q6;
        q6 <= q5;
        q5 <= q4;
        q4 <= q3;
        q3 <= q2;
        q2 <= q1;
        q1 <= q0;

        q0 <= din;

    end

end

endmodule
