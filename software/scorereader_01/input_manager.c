#include "input_manager.h"
#include "ir_handler.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "io.h"

alt_u8 input_get_active_key(alt_u8 *keyboard_raw, alt_u8 *ir_vkey_raw, alt_u8 *volume, alt_u32 *speed) {
    static alt_u8 last_keyboard = 0;
    
    *ir_vkey_raw = handle_ir_input(volume, speed);
    alt_u8 kb_data = IORD_8DIRECT(KEYBOARD_IP_0_BASE, 0);
    *keyboard_raw = kb_data;
    
    alt_u8 active_key = 0;
    if (*ir_vkey_raw != 0) {
        active_key = *ir_vkey_raw;
    } else if (kb_data & 0x10) { // flag=1 表示有新键值
        active_key = kb_data; // 已包含0x10|键值
        IOWR_8DIRECT(KEYBOARD_IP_0_BASE, 0, 0x01); // 清除flag
    }

    last_keyboard = *keyboard_raw;
    return active_key;
}
