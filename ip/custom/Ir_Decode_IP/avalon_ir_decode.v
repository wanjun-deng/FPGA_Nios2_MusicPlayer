module avalon_ir_decode (
    // Clock and Reset
    input        clk,
    input        reset_n,

    // Avalon-MM slave
    input  [2:0] address,     // byte offsets 0..4
    input  [7:0] writedata,
    input        write,
    input        read,
    input        chipselect,
    output reg [7:0] readdata,

    // IR input
    input        iIR,
    output       Get_Flag_o
);

    // Outputs from original ir_decode
    wire        Get_Flag;
    wire [15:0] irData;
    wire [15:0] irAddr;

    // Edge detect and latches
    reg flag_d1;
    wire flag_posedge = Get_Flag && !flag_d1;

    reg        flag_latch;
    reg [15:0] data_latch;
    reg [15:0] addr_latch;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            flag_d1 <= 1'b0;
        else
            flag_d1 <= Get_Flag;
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            flag_latch <= 1'b0;
            data_latch <= 16'd0;
            addr_latch <= 16'd0;
        end else if (flag_posedge) begin
            // latch on complete frame
            flag_latch <= 1'b1;
            data_latch <= irData;
            addr_latch <= irAddr;
        end else if (chipselect && write && address == 3'd0 && writedata[0]) begin
            // software writes 1 to clear flag
            flag_latch <= 1'b0;
        end
    end

    // Combinational readback
    always @(*) begin
        if (chipselect && read) begin
            case (address)
                3'd0: readdata = {7'b0, flag_latch};
                3'd1: readdata = data_latch[7:0];
                3'd2: readdata = data_latch[15:8];
                3'd3: readdata = addr_latch[7:0];
                3'd4: readdata = addr_latch[15:8];
                default: readdata = 8'd0;
            endcase
        end else begin
            readdata = 8'd0;
        end
    end

    // Instantiate original IR decoder
    ir_decode u_ir_decode (
        .Clk(clk),
        .Rst_n(reset_n),
        .iIR(iIR),
        .Get_Flag(Get_Flag),
        .irData(irData),
        .irAddr(irAddr)
    );

    assign Get_Flag_o = flag_latch;

endmodule
