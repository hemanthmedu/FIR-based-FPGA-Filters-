module full_adder_tb;

reg A,B,Cin;
wire Sum,Cout;

full_adder DUT(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    {A,B,Cin}=3'b000;

    repeat(8)
    begin
        #10 {A,B,Cin}={A,B,Cin}+1;
    end

    #10 $finish;
end

endmodule
