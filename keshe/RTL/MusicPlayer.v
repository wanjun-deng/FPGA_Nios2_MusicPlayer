module MusicPlayer(
input clk_raw,//50MHz
input reset_n,

//input [3:0]col_raw,//7-4 r0-r3 3-0 c0-c3
//output [3:0]row,

output [3:0]col_raw,
input [3:0]row,

output [3:0]led,
output out,

input iIR,
output SH_CP,
output ST_CP,
output DS
//output [7:0]onote_test,
//output [6:0]addr_test,
//output [4:0]keyboard_test
);

wire clk;
wire [7:0]FS_sr_onote;
wire playing_ic;

wire clkk;
//wire[3:0]col;
wire [4:0]keyboard;
wire [1:0]volumectrl;

pll pll0(
.areset(!reset_n),
.inclk0(clk_raw),
.c0(clk)
);

FreqSynth FS(
.clk(clk),//50MHz
.reset_n(reset_n),
.playing(playing_ic),
.note(FS_sr_onote),//音符编码
.volume(volumectrl),     //由Nios II控制
.vib(out),//音符音高

//测试端口
.osc_test()
);//封装


mysystem u0 (
    .clk_clk           (clk),         //      clk.clk
    .reset_reset_n     (reset_n),   //    reset.reset_n
    .led_export        (led),      //      led.export
    .keyboard_export   (keyboard), // keyboard.export
    .onote_export      (FS_sr_onote),    //    onote.export
    .playing_export    (playing_ic),  //  playing.export
    .irdata_export     (irdata),     //     irdata.export
    .irflag_export     (irflag),     //     irflag.export
    .volumectrl_export (volumectrl),  // volumectrl.export
    .display_export    (soft_disp_data) // display.export
);


 Key_Board KB(
	.Clk(clk),
	.Rst_n(reset_n),
	.Key_Board_Row_i(row),
	.Key_Board_Col_o(col_raw),
	.Key_Flag(keyboard[4]),
	.Key_Value(keyboard[3:0])
	);//封装

wire [15:0] irdata;
wire irflag;
wire [31:0] soft_disp_data;

ir_decode ir_decode_inst(
	.Clk(clk),
	.Rst_n(reset_n),
	.iIR(iIR),
	.Get_Flag(irflag),
	.irData(irdata),
	.irAddr()
);

HEX_top HEX_top_inst(
	.Clk(clk),
	.Rst_n(reset_n),
	.disp_data(soft_disp_data),
	.SH_CP(SH_CP),
	.ST_CP(ST_CP),
	.DS(DS)
);

endmodule