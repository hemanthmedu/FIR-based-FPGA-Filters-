module csa_24bit (

    input  [23:0] A,
    input  [23:0] B,
    input  [23:0] C,

    output [23:0] SUM,
    output [23:0] CARRY

);

genvar i;

generate

    for(i = 0; i < 24; i = i + 1)
    begin : CSA_LOOP

        assign SUM[i] =
                    A[i] ^ B[i] ^ C[i];

        assign CARRY[i] =
                    (A[i] & B[i]) |
                    (B[i] & C[i]) |
                    (A[i] & C[i]);

    end

endgenerate

endmodule

module fir_csa_tree(

    input  [23:0] M0,
    input  [23:0] M1,
    input  [23:0] M2,
    input  [23:0] M3,
    input  [23:0] M4,
    input  [23:0] M5,
    input  [23:0] M6,
    input  [23:0] M7,

    output [27:0] FINAL_OUT

);

wire [23:0] S1;
wire [23:0] C1;

wire [23:0] S2;
wire [23:0] C2;

wire [24:0] ADD1;
wire [24:0] ADD2;

wire [27:0] FINAL1;
wire [27:0] FINAL2;


// CSA BLOCK 1

csa_24bit CSA1 (

    .A(M0),
    .B(M1),
    .C(M2),

    .SUM(S1),
    .CARRY(C1)

);


// CSA BLOCK 2

csa_24bit CSA2 (

    .A(M3),
    .B(M4),
    .C(M5),

    .SUM(S2),
    .CARRY(C2)

);


// Carry Shift Addition

assign ADD1 = S1 + (C1 << 1);

assign ADD2 = S2 + (C2 << 1);


// Add Remaining Inputs

assign FINAL1 = ADD1 + M6;

assign FINAL2 = ADD2 + M7;


// Final Addition

assign FINAL_OUT = FINAL1 + FINAL2;

endmodule
