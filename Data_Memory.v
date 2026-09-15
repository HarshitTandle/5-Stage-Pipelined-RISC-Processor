module Data_Memory (
    input         clk,
    input         rst,
    input         WE,
    input  [31:0] A,
    input  [31:0] WD,
    output [31:0] RD
);

    reg [31:0] mem [1023:0];

    always @(posedge clk) begin
        if (WE)
            mem[A[31:2]] <= WD;
    end

    assign RD = (~rst) ? 32'd0 : mem[A[31:2]];

    initial begin
        for (integer i = 0; i < 1024; i = i + 1)
            mem[i] = 32'h00000000;
    end

endmodule
