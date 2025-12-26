#ifndef PLAYER_H_
#define PLAYER_H_

#include "alt_types.h"
#include "config.h"

typedef enum {
    STATE_STOPPED,
    STATE_PLAYING,
    STATE_PAUSED
} PlayerStatus;

typedef struct {
    PlayerStatus status;
    alt_u8 songchoose;
    alt_u8 addr_cnt;
    alt_u8 play_mode;      // 1:单次, 2:单曲, 3:顺序, 4:随机
    alt_u32 beat_timer;
    alt_u32 beat_threshold;
    alt_u8 volume;
} PlayerState;

void player_init(PlayerState *ps);
void player_process(PlayerState *ps, const unsigned char *score_data);
void player_apply_command(PlayerState *ps, alt_u8 cmd);

#endif
