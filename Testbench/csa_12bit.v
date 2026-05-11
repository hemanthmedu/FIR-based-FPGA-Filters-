
module csa_12bit (input  [11:0] A,[11:0] B,[11:0] C,output [11:0] SUM,[11:0] CARRY);
genvar i;
generate
    for(i = 0; i < 12; i = i + 1) begin : CSA_LOOP
        assign SUM[i]   = A[i] ^ B[i] ^ C[i];
        assign CARRY[i] = (A[i] & B[i]) | (B[i] & C[i]) | (A[i] & C[i]);
    end
endgenerate
endmodule
