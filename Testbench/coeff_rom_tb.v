module coeff_rom_tb();

reg [2:0] addr;
wire [11:0] data;

coeff_rom uut (.addr(addr), .data(data));

integer i;

initial begin
    $monitor("addr=%b data=%d", addr, data);
    for(i=0; i<8; i=i+1) begin
        addr = i; 
        #10;
    end
    $finish;
end

endmodule
