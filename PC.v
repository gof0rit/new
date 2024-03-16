`timescale 1ns / 1ps

module PC (
    input             CLK,            // 时钟
    input             Reset,          // 重置信号
    input             PCWre,          // PC是否更改，如果为0，PC不更改
    input      [31:0] newAddress,     // 新指令
    
    output reg [31:0] currentAddress  // 当前指令
);

    initial begin
        currentAddress <= 0;  // 非阻塞赋值
    end

    always @(posedge CLK or posedge Reset) begin
        if (Reset == 1) currentAddress <= 0;  // 如果重置，赋值为0
        else begin
            if (PCWre) currentAddress <= newAddress;
            else currentAddress <= currentAddress;
        end
    end

endmodule
