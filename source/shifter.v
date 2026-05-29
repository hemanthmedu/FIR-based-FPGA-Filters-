module shifter(

    input signed [27:0] a,

    input sel,

    output reg signed [27:0] y

);

always @(*)

begin

    if(sel)

        y = a <<< 1;

    else

        y = a >>> 1;

end

endmodule
