module MusicPlayer(
input clk_raw,//50MHz
input reset_n,

output [3:0]col_raw,
input  [3:0]row,

output [3:0]led,
output out,

input  iIR,
output SH_CP,
output ST_CP,
output DS
);

wire clk;

pll pll0(
.areset(!reset_n),
.inclk0(clk_raw),
.c0(clk)
);

// Platform Designer system integrating custom IPs
mysystem u0 (
    .clk_clk                     (clk),       // clock
    .reset_reset_n               (reset_n),   // reset
    .led_export                  (led),       // LEDs
    .vib_export_export           (out),       // audio PWM from FreqSynth_IP
    .keyboard_export_Row_i       (row),       // matrix keyboard rows in
    .keyboard_export_Col_o       (col_raw),   // matrix keyboard cols out
    .ir_decode_export_iIR        (iIR),       // IR receiver input
    .ir_decode_export_Get_Flag_o (),          // IR flag (unused here)
    .hex_driver_export_SH_CP     (SH_CP),     // 74HC595 shift clock
    .hex_driver_export_ST_CP     (ST_CP),     // 74HC595 latch clock
    .hex_driver_export_DS        (DS)         // 74HC595 data
);

endmodule