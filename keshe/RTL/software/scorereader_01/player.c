#include "player.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <stdlib.h>

void player_init(PlayerState *ps) {
    ps->status = STATE_STOPPED;
    ps->songchoose = 0;
    ps->addr_cnt = 0;
    ps->play_mode = MODE_SINGLE;
    ps->beat_timer = 0;
    ps->beat_threshold = SPEED_LEVEL_2;
    ps->volume = VOL_DEFAULT;
    
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_VOLUMECTRL_BASE, ps->volume);
}

void player_process(PlayerState *ps, const unsigned char *score_data) {
    alt_u8 inote = score_data[(ps->songchoose << 5) | (ps->addr_cnt & 0x1F)];

    // 1. 状态逻辑处理
    switch (ps->status) {
        case STATE_PLAYING:
            // 检查歌曲是否结束
            if (((inote & 0x80) == 0) || (ps->addr_cnt == (SONG_ADDR_RANGE - 1))) {
                ps->addr_cnt = 0;
                ps->beat_timer = 0;
                if (ps->play_mode == MODE_SINGLE) {
                    ps->status = STATE_STOPPED;
                } else if (ps->play_mode == MODE_LOOP) {
                    ps->status = STATE_PLAYING;
                } else if (ps->play_mode == MODE_SEQUENTIAL) {
                    ps->songchoose = (ps->songchoose + 1) % SONG_COUNT;
                    ps->status = STATE_PLAYING;
                } else if (ps->play_mode == MODE_RANDOM) {
                    ps->songchoose = rand() % SONG_COUNT;
                    ps->status = STATE_PLAYING;
                }
            }
            IOWR_ALTERA_AVALON_PIO_DATA(PIO_ONOTE_BASE, inote);
            IOWR_ALTERA_AVALON_PIO_DATA(PIO_PLAYING_BASE, 1);
            break;

        case STATE_PAUSED:
            IOWR_ALTERA_AVALON_PIO_DATA(PIO_ONOTE_BASE, 0);
            IOWR_ALTERA_AVALON_PIO_DATA(PIO_PLAYING_BASE, 0);
            break;

        case STATE_STOPPED:
            ps->addr_cnt = 0;
            ps->beat_timer = 0;
            IOWR_ALTERA_AVALON_PIO_DATA(PIO_ONOTE_BASE, 0);
            IOWR_ALTERA_AVALON_PIO_DATA(PIO_PLAYING_BASE, 0);
            break;
    }
}

void player_apply_command(PlayerState *ps, alt_u8 cmd) {
    switch (cmd & 0x1F) {
        case 0x10: ps->status = STATE_PLAYING; ps->play_mode = MODE_SINGLE; break; 
        case 0x11: ps->status = STATE_PLAYING; ps->play_mode = MODE_LOOP; break; 
        case 0x12: ps->status = STATE_PLAYING; ps->play_mode = MODE_SEQUENTIAL; break; 
        case 0x13: ps->status = STATE_PLAYING; ps->play_mode = MODE_RANDOM; break; 
        
        case 0x14: // 暂停/继续 切换
            if (ps->status == STATE_PLAYING) ps->status = STATE_PAUSED;
            else if (ps->status == STATE_PAUSED) ps->status = STATE_PLAYING;
            break;

        case 0x15: ps->status = STATE_STOPPED; break; // 停止

        case 0x16: ps->status = STATE_STOPPED; ps->songchoose = 0; break; // 歌曲0
        case 0x17: ps->status = STATE_STOPPED; ps->songchoose = 1; break; // 歌曲1
        case 0x18: ps->status = STATE_STOPPED; ps->songchoose = 2; break; // 歌曲2
        case 0x19: ps->status = STATE_STOPPED; ps->songchoose = 3; break; // 歌曲3

        case 0x1A: // 音量加
            if (ps->volume < VOL_MAX) ps->volume++;
            IOWR_ALTERA_AVALON_PIO_DATA(PIO_VOLUMECTRL_BASE, ps->volume);
            break;
        case 0x1B: // 音量减
            if (ps->volume > VOL_MIN) ps->volume--;
            IOWR_ALTERA_AVALON_PIO_DATA(PIO_VOLUMECTRL_BASE, ps->volume);
            break;
        case 0x1C: // 速度加
            if (ps->beat_threshold >= SPEED_LEVEL_1) ps->beat_threshold = SPEED_LEVEL_2;
            else if (ps->beat_threshold >= SPEED_LEVEL_2) ps->beat_threshold = SPEED_LEVEL_3;
            else if (ps->beat_threshold >= SPEED_LEVEL_3) ps->beat_threshold = SPEED_LEVEL_4;
            break;
        case 0x1D: // 速度减
            if (ps->beat_threshold <= SPEED_LEVEL_4) ps->beat_threshold = SPEED_LEVEL_3;
            else if (ps->beat_threshold <= SPEED_LEVEL_3) ps->beat_threshold = SPEED_LEVEL_2;
            else if (ps->beat_threshold <= SPEED_LEVEL_2) ps->beat_threshold = SPEED_LEVEL_1;
            break;
    }
}
