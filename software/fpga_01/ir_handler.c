#include "ir_handler.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "io.h"
#include <stdio.h>

static alt_u32 last_ir_data = 0;

alt_u8 handle_ir_input(alt_u8 *volume, alt_u32 *beat_threshold)
{
    static alt_u8 last_ir_flag = 0;
    alt_u8 current_ir_flag = IORD_8DIRECT(IR_DECODE_IP_0_BASE, 0);
    alt_u8 v_key = 0;

    // 检测标志位翻转（硬件已改为翻转逻辑）
    if (current_ir_flag != last_ir_flag)
    {
        last_ir_flag = current_ir_flag;
        last_ir_data = IORD_8DIRECT(IR_DECODE_IP_0_BASE, 1) |
                       (IORD_8DIRECT(IR_DECODE_IP_0_BASE, 2) << 8);

        // 发送清除/确认信号，允许硬件进行下一次捕获
        IOWR_8DIRECT(IR_DECODE_IP_0_BASE, 0, 0x01);
        // 关键：立即同步 ACK 后的硬件标志位状态，防止 IOWR 引起的标志位变化导致二次触发
        last_ir_flag = IORD_8DIRECT(IR_DECODE_IP_0_BASE, 0);

        switch (last_ir_data)
        {
        case IR_KEY_UP:
            v_key = 0x1A;
            break; // 映射到虚拟键 10 (音量加)
        case IR_KEY_DOWN:
            v_key = 0x1B;
            break; // 映射到虚拟键 11 (音量减)
        case IR_KEY_RIGHT:
            v_key = 0x1C;
            break; // 映射到虚拟键 12 (速度加)
        case IR_KEY_LEFT:
            v_key = 0x1D;
            break; // 映射到虚拟键 13 (速度减)

        // 数字键映射为虚拟键盘值 (0x10 | 键值)
        case IR_KEY_0:
            v_key = 0x10;
            break;
        case IR_KEY_1:
            v_key = 0x11;
            break;
        case IR_KEY_2:
            v_key = 0x12;
            break;
        case IR_KEY_3:
            v_key = 0x13;
            break;
        case IR_KEY_4:
            v_key = 0x14;
            break;
        case IR_KEY_5:
            v_key = 0x15;
            break;
        case IR_KEY_6:
            v_key = 0x16;
            break;
        case IR_KEY_7:
            v_key = 0x17;
            break;
        case IR_KEY_8:
            v_key = 0x18;
            break;
        case IR_KEY_9:
            v_key = 0x19;
            break;
        default:
            v_key = 0x1F; // 未知按键返回 0x1F，使数码管显示 F
            break;
        }
    }
    return v_key;
}
