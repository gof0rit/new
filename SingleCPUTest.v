`timescale 1ns / 1ps

module SingleCPUTest;

    // Inputs
    reg         CLK;
    reg         Reset;

    // Outputs
    wire [31:0] inst;
    wire [ 5:0] op;
    wire [ 4:0] rs;
    wire [ 4:0] rt;
    wire [ 4:0] rd;
    wire [15:0] immediate;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] WriteData;
    wire [31:0] DataOut;
    wire [31:0] currentAddress;
    wire [31:0] result;

    // Instantiate the Unit Under Test (UUT)
    SingleCycleCPU uut (
        .CLK           (CLK),
        .Reset         (Reset),

        .inst          (inst),
        .op            (op),
        .rs            (rs),
        .rt            (rt),
        .rd            (rd),
        .immediate     (immediate),
        .ReadData1     (ReadData1),
        .ReadData2     (ReadData2),
        .WriteData     (WriteData),
        .DataOut       (DataOut),
        .currentAddress(currentAddress),
        .result        (result)
    );

    initial begin
        // Initialize Inputs
        CLK   = 0;
        Reset = 1;

        // Wait 50 ns for global reset to finish
        #50;  // 刚开始设置pc为0
        CLK = !CLK;  // 下降沿，使PC先清零
        #50;
        Reset = 0;  // 清除保持信号
        forever
            #50 begin  // 产生时钟信号，周期为50s
                CLK = !CLK;
            end

        // Add stimulus here

    end

endmodule
