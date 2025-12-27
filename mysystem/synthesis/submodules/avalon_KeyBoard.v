module avalon_KeyBoard(
    // Clock and Reset
    input clk,
    input reset_n,
    
    // Avalon slave interface signals
    input [0:0] address,
    input [7:0] writedata,
    input write,
    input read,
    input chipselect,
    output reg [7:0] readdata,
    
    // Keyboard matrix interface (conduit)
    input [3:0] Key_Board_Row_i,
    output [3:0] Key_Board_Col_o
);

    // Internal signals from Key_Board module
    wire Key_Flag;
    wire [3:0] Key_Value;
    
    // Latched registers for software access
    reg Key_Flag_latch;      // 锁存的按键标志
    reg [3:0] Key_Value_latch;  // 锁存的按键值
    
    // Edge detection for Key_Flag
    reg Key_Flag_d1;
    wire Key_Flag_posedge;
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            Key_Flag_d1 <= 1'b0;
        else
            Key_Flag_d1 <= Key_Flag;
    end
    
    assign Key_Flag_posedge = Key_Flag && !Key_Flag_d1;
    
    // Latch key value on Key_Flag rising edge
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            Key_Flag_latch <= 1'b0;
            Key_Value_latch <= 4'd0;
        end
        else if (Key_Flag_posedge) begin
            Key_Flag_latch <= 1'b1;
            Key_Value_latch <= Key_Value;
        end
        else if (chipselect && write && address == 1'b0 && writedata[0]) begin
            // 软件写1清除标志
            Key_Flag_latch <= 1'b0;
        end
    end
    
    // Avalon read logic (组合逻辑，无延迟)
    always @(*) begin
        if (chipselect && read) begin
            case (address)
                1'b0: readdata = {3'b0, Key_Flag_latch, Key_Value_latch};  // bit[4]=flag, bit[3:0]=value
                1'b1: readdata = 8'd0;  // 保留地址
                default: readdata = 8'd0;
            endcase
        end
        else begin
            readdata = 8'd0;  // 未选中时返回0
        end
    end
    
    // Instantiate original Key_Board module
    Key_Board Key_Board_inst(
        .Clk(clk),
        .Rst_n(reset_n),
        .Key_Board_Row_i(Key_Board_Row_i),
        .Key_Board_Col_o(Key_Board_Col_o),
        .Key_Flag(Key_Flag),
        .Key_Value(Key_Value)
    );

endmodule
