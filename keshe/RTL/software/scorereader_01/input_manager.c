#include "input_manager.h"
#include "ir_handler.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

alt_u8 input_get_active_key(alt_u8 *keyboard_raw, alt_u8 *ir_vkey_raw, alt_u8 *volume, alt_u32 *speed) {
    static alt_u8 last_keyboard = 0;
    
    *ir_vkey_raw = handle_ir_input(volume, speed);
    *keyboard_raw = IORD_ALTERA_AVALON_PIO_DATA(PIO_KEYBOARD_BASE);
    
    alt_u8 active_key = 0;
    if (*ir_vkey_raw != 0) {
        active_key = *ir_vkey_raw;
    } else if (*keyboard_raw != last_keyboard && (*keyboard_raw & 0x10)) {
        active_key = *keyboard_raw;
    }
    
    last_keyboard = *keyboard_raw;
    return active_key;
}
