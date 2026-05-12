module csa_24bit (input  [23:0] A,[23:0] B,[23:0] C,output [23:0] SUM, [23:0] CARRY);

genvar i;

generate
    for(i = 0; i < 24; i = i + 1)
    begin : CSA_LOOP

        assign SUM[i] =A[i] ^ B[i] ^ C[i];

        assign CARRY[i] =(A[i] & B[i]) |(B[i] & C[i]) |(A[i] & C[i]);

    end
endgenerate

endmodule
