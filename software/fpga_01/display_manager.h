#ifndef DISPLAY_MANAGER_H_
#define DISPLAY_MANAGER_H_

#include "alt_types.h"

// 更新数码管显示
void update_display(alt_u8 song, alt_u8 play_mode, alt_u8 vol, alt_u32 speed, alt_u8 note, alt_u8 last_key, alt_u8 ir_vkey);

#endif /* DISPLAY_MANAGER_H_ */
