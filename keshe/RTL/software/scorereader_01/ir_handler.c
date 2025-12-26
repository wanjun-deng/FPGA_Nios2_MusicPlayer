#include "ir_handler.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <stdio.h>

static alt_u32 last_ir_data = 0;

alt_u8 handle_ir_input(alt_u8 *volume, alt_u32 *beat_threshold) {
    static alt_u8 last_ir_flag = 0;
    alt_u8 current_ir_flag = IORD_ALTERA_AVALON_PIO_DATA(PIO_IRFLAG_BASE);
    alt_u8 v_key = 0;

    // 检测标志位翻转（硬件已改为翻转逻辑）
    if (current_ir_flag != last_ir_flag) {
        last_ir_flag = current_ir_flag;
        last_ir_data = IORD_ALTERA_AVALON_PIO_DATA(PIO_IRDATA_BASE);
        
        switch (last_ir_data) {
            case IR_KEY_UP:    v_key = 0x1A; break; // 映射到虚拟键 10 (音量加)
            case IR_KEY_DOWN:  v_key = 0x1B; break; // 映射到虚拟键 11 (音量减)
            case IR_KEY_RIGHT: v_key = 0x1C; break; // 映射到虚拟键 12 (速度加)
            case IR_KEY_LEFT:  v_key = 0x1D; break; // 映射到虚拟键 13 (速度减)
            
            // 数字键映射为虚拟键盘值 (0x10 | 键值)
            case IR_KEY_0: v_key = 0x10; break;
            case IR_KEY_1: v_key = 0x11; break;
            case IR_KEY_2: v_key = 0x12; break;
            case IR_KEY_3: v_key = 0x13; break;
            case IR_KEY_4: v_key = 0x14; break;
            case IR_KEY_5: v_key = 0x15; break;
            case IR_KEY_6: v_key = 0x16; break;
            case IR_KEY_7: v_key = 0x17; break;
            case IR_KEY_8: v_key = 0x18; break;
            case IR_KEY_9: v_key = 0x19; break;
            default:
                v_key = 0x1F; // 未知按键返回 0x1F，使数码管显示 F
                break;
        }
    }
    return v_key;
}

void update_display(alt_u8 song, alt_u8 play_mode, alt_u8 vol, alt_u32 speed, alt_u8 note, alt_u8 last_key, alt_u8 ir_vkey) {
    alt_u32 data = 0;
    static alt_u8 latched_kb_val = 0;
    static alt_u8 latched_ir_mapped_val = 0xF; // 默认显示 F

    // 1. 歌曲号 (第1位): 显示偏移+1 (1-4)
    data |= ((song + 1) & 0xF) << 28;
    
    // 2. 模式指示 (第2位): 1-单次, 2-单曲, 3-顺序, 4-随机
    data |= (play_mode & 0xF) << 24;
    
    // 3. 音量 (第3位)
    data |= (vol & 0xF) << 20;
    
    // 4. 速度等级 (第4位): 将阈值映射为 1-4 级
    int speed_lvl;
    if (speed >= 500) speed_lvl = 1;      // 最慢
    else if (speed >= 336) speed_lvl = 2; // 标准
    else if (speed >= 200) speed_lvl = 3; // 快
    else speed_lvl = 4;                   // 最快
    
    data |= (speed_lvl & 0xF) << 16;
    
    // 5-6. 当前音符 (第5-6位)
    data |= (note & 0xFF) << 8;
    
    // 更新键盘锁存值 (解决松开按键后闪烁回0的问题)
    if (last_key & 0x10) {
        latched_kb_val = last_key & 0x0F;
    }

    // 更新红外锁存值 (使用传入的 ir_vkey)
    if (ir_vkey != 0) {
        latched_ir_mapped_val = ir_vkey & 0x0F;
    }

    // 7. 倒数第二位：键盘键值
    data |= (latched_kb_val & 0xF) << 4;
    // 8. 倒数第一位：红外键值
    data |= (latched_ir_mapped_val & 0xF);
    
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_DISPLAY_BASE, data);
}
