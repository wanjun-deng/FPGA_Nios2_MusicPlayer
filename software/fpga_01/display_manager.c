#include "display_manager.h"
#include "system.h"
#include "io.h"

void update_display(alt_u8 song, alt_u8 play_mode, alt_u8 vol, alt_u32 speed, alt_u8 note, alt_u8 last_key, alt_u8 ir_vkey)
{
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
    if (speed >= 500)
        speed_lvl = 1; // 最慢
    else if (speed >= 336)
        speed_lvl = 2; // 标准
    else if (speed >= 200)
        speed_lvl = 3; // 快
    else
        speed_lvl = 4; // 最快

    data |= (speed_lvl & 0xF) << 16;

    // 5-6. 当前音符 (第5-6位)
    data |= (note & 0xFF) << 8;

    // 更新键盘锁存值 (解决松开按键后闪烁回0的问题)
    if (last_key & 0x10)
    {
        latched_kb_val = last_key & 0x0F;
    }

    // 更新红外锁存值 (使用传入的 ir_vkey)
    if (ir_vkey != 0)
    {
        latched_ir_mapped_val = ir_vkey & 0x0F;
    }

    // 7. 倒数第二位：键盘键值
    data |= (latched_kb_val & 0xF) << 4;
    // 8. 倒数第一位：红外键值
    data |= (latched_ir_mapped_val & 0xF);

    IOWR_8DIRECT(HEX_DRIVER_IP_0_BASE, 0, (alt_u8)(data & 0xFF));
    IOWR_8DIRECT(HEX_DRIVER_IP_0_BASE, 1, (alt_u8)((data >> 8) & 0xFF));
    IOWR_8DIRECT(HEX_DRIVER_IP_0_BASE, 2, (alt_u8)((data >> 16) & 0xFF));
    IOWR_8DIRECT(HEX_DRIVER_IP_0_BASE, 3, (alt_u8)((data >> 24) & 0xFF));
}
