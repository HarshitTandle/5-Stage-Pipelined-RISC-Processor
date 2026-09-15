module Control_Unit_Top (
    input  [6:0] Op,
    input  [6:0] funct7,
    input  [2:0] funct3,
    output       RegWrite,
    output [1:0] ImmSrc,
    output       ALUSrc,
    output       MemWrite,
    output       ResultSrc,
    output       Branch,
    output [2:0] ALUControl
);

    wire [1:0] ALUOp;

    Main_Decoder Main_Decoder (
        .Op        (Op),
        .RegWrite  (RegWrite),
        .ImmSrc    (ImmSrc),
        .ALUSrc    (ALUSrc),
        .MemWrite  (MemWrite),
        .ResultSrc (ResultSrc),
        .Branch    (Branch),
        .ALUOp     (ALUOp)
    );

    ALU_Decoder ALU_Decoder (
        .ALUOp     (ALUOp),
        .funct3    (funct3),
        .funct7    (funct7),
        .op        (Op),
        .ALUControl(ALUControl)
    );

endmodule
