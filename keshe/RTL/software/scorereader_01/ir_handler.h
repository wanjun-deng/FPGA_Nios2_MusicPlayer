#ifndef IR_HANDLER_H_
#define IR_HANDLER_H_

#include "alt_types.h"

// 红外遥控键值定义
#define IR_KEY_UP    0xEA15
#define IR_KEY_DOWN  0xF807
#define IR_KEY_LEFT  0xBB44
#define IR_KEY_RIGHT 0xBF40

#define IR_KEY_0     0xE916
#define IR_KEY_1     0xF30C
#define IR_KEY_2     0xE718
#define IR_KEY_3     0xA15E
#define IR_KEY_4     0xF708
#define IR_KEY_5     0xE31C
#define IR_KEY_6     0xA55A
#define IR_KEY_7     0xBD42
#define IR_KEY_8     0xAD52
#define IR_KEY_9     0xB54A

// 处理红外输入的函数声明
// volume: 音量控制变量指针 (0-3)
// beat_threshold: 节拍阈值指针 (控制播放速度)
alt_u8 handle_ir_input(alt_u8 *volume, alt_u32 *beat_threshold);

// 新增：更新数码管显示
void update_display(alt_u8 song, alt_u8 play_mode, alt_u8 vol, alt_u32 speed, alt_u8 note, alt_u8 last_key, alt_u8 ir_vkey);

#endif /* IR_HANDLER_H_ */
