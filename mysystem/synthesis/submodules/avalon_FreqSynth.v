module avalon_FreqSynth(
    // Clock and Reset
    input clk,
    input reset_n,
    
    // Avalon slave interface signals
    input [1:0] address,
    input [7:0] writedata,
    input write,
    input read,
    input chipselect,
    output reg [7:0] readdata,
    
    // Audio output
    output vib
);

    // Internal registers for Avalon interface
    reg playing_reg;
    reg [7:0] note_reg;
    reg [1:0] volume_reg;
    
    // Avalon write logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            playing_reg <= 1'b0;
            note_reg <= 8'b0;
            volume_reg <= 2'b10;  // 默认中等音量
        end else if (chipselect && write) begin
            case (address)
                2'b00: begin  // Address 0: write playing control register
                    playing_reg <= writedata[0];
                end
                2'b01: begin  // Address 1: write note register
                    note_reg <= writedata[7:0];
                end
                2'b10: begin  // Address 2: write volume register
                    volume_reg <= writedata[1:0];
                end
                default: ;  // 其他地址不响应
            endcase
        end
    end
    
    // Read logic (return current status)
    always @(*) begin
        if (chipselect && read) begin
            case (address)
                2'b00: readdata = {7'b0, playing_reg};  // 读取 playing 状态
                2'b01: readdata = note_reg;             // 读取 note
                2'b10: readdata = {6'b0, volume_reg};   // 读取 volume
                default: readdata = 8'b0;
            endcase
        end else begin
            readdata = 8'b0;
        end
    end
    
    // Instantiate original FreqSynth module
    FreqSynth FreqSynth_inst(
        .clk(clk),
        .reset_n(reset_n),
        .playing(playing_reg),
        .note(note_reg),
        .volume(volume_reg),
        .vib(vib)
    );

endmodule
