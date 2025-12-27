module avalon_hex_top (
    // Clock and Reset
    input        clk,
    input        reset_n,

    // Avalon-MM slave
    input  [2:0] address,     // byte offsets 0..3
    input  [7:0] writedata,
    input        write,
    input        read,
    input        chipselect,
    output reg [7:0] readdata,

    // 74HC595 three-wire output (conduit)
    output       SH_CP,
    output       ST_CP,
    output       DS
);

    // Internal 32-bit display data register
    reg [31:0] disp_data;

    // Avalon write logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            disp_data <= 32'd0;
        else if (chipselect && write) begin
            case (address)
                3'd0: disp_data[7:0]   <= writedata;
                3'd1: disp_data[15:8]  <= writedata;
                3'd2: disp_data[23:16] <= writedata;
                3'd3: disp_data[31:24] <= writedata;
                default: ;
            endcase
        end
    end

    // Avalon read logic (read back current display value)
    always @(*) begin
        if (chipselect && read) begin
            case (address)
                3'd0: readdata = disp_data[7:0];
                3'd1: readdata = disp_data[15:8];
                3'd2: readdata = disp_data[23:16];
                3'd3: readdata = disp_data[31:24];
                default: readdata = 8'd0;
            endcase
        end else begin
            readdata = 8'd0;
        end
    end

    // Instantiate original HEX_top module
    HEX_top u_hex_top (
        .Clk(clk),
        .Rst_n(reset_n),
        .disp_data(disp_data),
        .SH_CP(SH_CP),
        .ST_CP(ST_CP),
        .DS(DS)
    );

endmodule
