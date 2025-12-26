module Key_Board(
    input Clk,
    input Rst_n,
    input [3:0] Key_Board_Row_i,
    output reg [3:0] Key_Board_Col_o,
    output reg Key_Flag,
    output reg [3:0] Key_Value
);

    // 状态定义
    localparam 
        IDEL            = 11'b00000000001,
        P_FILTER        = 11'b00000000010,
        READ_ROW_P      = 11'b00000000100,
        SCAN_C0         = 11'b00000001000,
        SCAN_C1         = 11'b00000010000,
        SCAN_C2         = 11'b00000100000,
        SCAN_C3         = 11'b00001000000,
        PRESS_RESULT    = 11'b00010000000,
        WAIT_R          = 11'b00100000000,
        R_FILTER        = 11'b01000000000,
        READ_ROW_R      = 11'b10000000000;

    reg [19:0] counter1;
    reg En_Cnt;
    reg [10:0] state;
    reg [3:0] Key_Board_Row_r;
    reg Cnt_Done;
    reg [3:0] Col_Tmp;
    reg [7:0] Key_Value_tmp;
    reg Key_Flag_r;

    // 分频计数器，降低扫描频率（解决 50MHz 扫描过快导致的物理信号不稳定问题）
    reg [15:0] clk_div;
    wire scan_tick;

    always @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n)
            clk_div <= 16'd0;
        else
            clk_div <= clk_div + 1'b1;
    end

    assign scan_tick = (clk_div == 16'd0); // 约 763Hz 的扫描节拍

    // 消抖计数器逻辑
    always @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n)
            counter1 <= 20'd0;
        else if (En_Cnt) begin
            if (counter1 == 20'd999999)
                counter1 <= 20'd0;
            else
                counter1 <= counter1 + 1'b1;
        end
        else
            counter1 <= 20'd0;
    end

    always @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n)
            Cnt_Done <= 1'b0;
        else if (counter1 == 20'd999999)
            Cnt_Done <= 1'b1;
        else if (!En_Cnt)
            Cnt_Done <= 1'b0;
    end

    // 矩阵键盘扫描状态机
    always @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            state <= IDEL;
            En_Cnt <= 1'b0;
            Key_Board_Col_o <= 4'b0000;
            Col_Tmp <= 4'd0;
            Key_Flag_r <= 1'b0;
            Key_Value_tmp <= 8'd0;
            Key_Board_Row_r <= 4'b1111;
        end
        else if (scan_tick) begin // 仅在分频节拍下运行状态机
            case (state)
                IDEL: begin
                    Key_Flag_r <= 1'b0;
                    if (~&Key_Board_Row_i) begin
                        En_Cnt <= 1'b1;
                        state <= P_FILTER;
                    end
                    else begin
                        En_Cnt <= 1'b0;
                        state <= IDEL;
                    end
                end

                P_FILTER: begin
                    if (Cnt_Done) begin
                        En_Cnt <= 1'b0;
                        state <= READ_ROW_P;
                    end
                    else begin
                        En_Cnt <= 1'b1;
                        state <= P_FILTER;
                    end
                end

                READ_ROW_P: begin
                    if (~&Key_Board_Row_i) begin
                        Key_Board_Row_r <= Key_Board_Row_i;
                        state <= SCAN_C0;
                        Key_Board_Col_o <= 4'b1110;
                    end
                    else begin
                        state <= IDEL;
                        Key_Board_Col_o <= 4'b0000;
                    end
                end

                SCAN_C0: begin
                    state <= SCAN_C1;
                    Key_Board_Col_o <= 4'b1101;
                    if (~&Key_Board_Row_i)
                        Col_Tmp <= 4'b0001;
                    else
                        Col_Tmp <= 4'b0000;
                end

                SCAN_C1: begin
                    state <= SCAN_C2;
                    Key_Board_Col_o <= 4'b1011;
                    if (~&Key_Board_Row_i)
                        Col_Tmp <= Col_Tmp | 4'b0010;
                    else
                        Col_Tmp <= Col_Tmp;
                end

                SCAN_C2: begin
                    state <= SCAN_C3;
                    Key_Board_Col_o <= 4'b0111;
                    if (~&Key_Board_Row_i)
                        Col_Tmp <= Col_Tmp | 4'b0100;
                    else
                        Col_Tmp <= Col_Tmp;
                end

                SCAN_C3: begin
                    state <= PRESS_RESULT;
                    if (~&Key_Board_Row_i)
                        Col_Tmp <= Col_Tmp | 4'b1000;
                    else
                        Col_Tmp <= Col_Tmp;
                end

                PRESS_RESULT: begin
                    state <= WAIT_R;
                    Key_Board_Col_o <= 4'b0000;
                    // 校验是否只有一行一列被按下
                    if (((Key_Board_Row_r[0] + Key_Board_Row_r[1] + Key_Board_Row_r[2] + Key_Board_Row_r[3]) == 4'd3) && 
                        ((Col_Tmp[0] + Col_Tmp[1] + Col_Tmp[2] + Col_Tmp[3]) == 4'd1)) begin
                        Key_Flag_r <= 1'b1;
                        Key_Value_tmp <= {Key_Board_Row_r, Col_Tmp};
                    end
                    else begin
                        Key_Flag_r <= 1'b0;
                    end
                end

                WAIT_R: begin
                    Key_Flag_r <= 1'b0;
                    if (&Key_Board_Row_i) begin
                        En_Cnt <= 1'b1;
                        state <= R_FILTER;
                    end
                    else begin
                        state <= WAIT_R;
                        En_Cnt <= 1'b0;
                    end
                end

                R_FILTER: begin
                    if (Cnt_Done) begin
                        En_Cnt <= 1'b0;
                        state <= READ_ROW_R;
                    end
                    else begin
                        En_Cnt <= 1'b1;
                        state <= R_FILTER;
                    end
                end

                READ_ROW_R: begin
                    if (&Key_Board_Row_i)
                        state <= IDEL;
                    else begin
                        En_Cnt <= 1'b1;
                        state <= R_FILTER;
                    end
                end

                default: state <= IDEL;
            endcase
        end
    end

    // 键值译码
    always @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            Key_Value <= 4'd0;
        end
        else if (Key_Flag_r) begin
            case (Key_Value_tmp)
                8'b1110_0001 : Key_Value <= 4'd0;
                8'b1110_0010 : Key_Value <= 4'd1;
                8'b1110_0100 : Key_Value <= 4'd2;
                8'b1110_1000 : Key_Value <= 4'd3;
                
                8'b1101_0001 : Key_Value <= 4'd4;
                8'b1101_0010 : Key_Value <= 4'd5;
                8'b1101_0100 : Key_Value <= 4'd6;
                8'b1101_1000 : Key_Value <= 4'd7;
                
                8'b1011_0001 : Key_Value <= 4'd8;
                8'b1011_0010 : Key_Value <= 4'd9;
                8'b1011_0100 : Key_Value <= 4'd10;
                8'b1011_1000 : Key_Value <= 4'd11;
                
                8'b0111_0001 : Key_Value <= 4'd12;
                8'b0111_0010 : Key_Value <= 4'd13;
                8'b0111_0100 : Key_Value <= 4'd14;
                8'b0111_1000 : Key_Value <= 4'd15;
                default: Key_Value <= Key_Value;
            endcase
        end
    end

    // 输出 Flag 同步
    always @(posedge Clk) begin
        Key_Flag <= Key_Flag_r;
    end

endmodule
