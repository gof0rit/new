`timescale 1ns / 1ps

module SignZeroExtend (
    input ExtSel,  // 控制补位，如果为1，进行符号扩展，如果为0，全补0
    input [15:0] immediate,  // 16位立即数
    
    output [31:0] extendImmediate  // 输出的32位立即数
);

    // 进行扩展
    assign extendImmediate[15:0]  = immediate;
    assign extendImmediate[31:16] = ExtSel ? (immediate[15] ? 16'hffff : 16'h0000) : 16'h0000;

endmodule
