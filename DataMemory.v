`timescale 1ns / 1ps

module DataMemory (
    input        DataMemRW,  // 数据存储器读写控制信号，为1写，为0读
    input [31:0] DAddr,      // 数据存储器地址输入端口
    input [31:0] DataIn,     // 数据存储器数据输入端口

    output reg [31:0] DataOut  // 数据存储器数据输出端口
);

    // 模拟内存，以8位为一字节存储，共64字节
    reg     [7:0] memory[0:63];

    // 初始赋值
    integer       i;
    initial begin
        for (i = 0; i < 64; i = i + 1) memory[i] <= 0;
    end

    // 读写内存
    always @(DAddr or DataIn) begin
        // 写内存
        if (DataMemRW) begin
            memory[DAddr]   <= DataIn[31:24]; // 大端模式：高位数据存储在低地址
            memory[DAddr+1] <= DataIn[23:16];
            memory[DAddr+2] <= DataIn[15:8];
            memory[DAddr+3] <= DataIn[7:0];
        end  // 读内存
        else begin
            DataOut[31:24] <= memory[DAddr];
            DataOut[23:16] <= memory[DAddr+1];
            DataOut[15:8]  <= memory[DAddr+2];
            DataOut[7:0]   <= memory[DAddr+3];
        end
    end

endmodule
