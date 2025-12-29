#ifndef INPUT_MANAGER_H_
#define INPUT_MANAGER_H_

#include "alt_types.h"

// 获取统一的输入事件
// 返回值：0 表示无输入，非 0 表示按键值 (0x10 | 键值)
alt_u8 input_get_active_key(alt_u8 *keyboard_raw, alt_u8 *ir_vkey_raw, alt_u8 *volume, alt_u32 *speed);

#endif
