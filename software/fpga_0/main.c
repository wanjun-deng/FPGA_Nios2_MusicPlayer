#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "alt_types.h"
#include <stdio.h>
#include <stdlib.h>
#include "sys/alt_irq.h"

#include "player.h"
#include "input_manager.h"
#include "ir_handler.h"
#include "display_manager.h"
#include "score_data.h"

// 定时器中断服务程序 (ISR)
static void timer_isr(void *context)
{
    PlayerState *ps = (PlayerState *)context;

    // 1. 清除定时器中断标志位 (Timeout flag)
    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);

    // 2. 处理计时逻辑
    if (ps->status == STATE_PLAYING)
    {
        ps->beat_timer++;
        if (ps->beat_timer >= ps->beat_threshold)
        {
            ps->beat_timer = 0;
            ps->addr_cnt++;
        }
    }
}

int main()
{
    PlayerState player;
    alt_u8 keyboard, ir_vkey;
    static alt_u8 last_led_val = 0;

    printf("Nios II Music Player Modularized Version Started\n");

    player_init(&player);

    // 注册定时器中断
    alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID,
                        TIMER_0_IRQ,
                        timer_isr,
                        &player,
                        0x0);

    // 初始化定时器 (50MHz -> 1ms tick)
    IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, 50000 & 0xFFFF);
    IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, (50000 >> 16) & 0xFFFF);
    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
                                     ALTERA_AVALON_TIMER_CONTROL_CONT_MSK |
                                         ALTERA_AVALON_TIMER_CONTROL_START_MSK |
                                         ALTERA_AVALON_TIMER_CONTROL_ITO_MSK);

    while (1)
    {
        // 1. 获取输入
        alt_u8 active_key = input_get_active_key(&keyboard, &ir_vkey, &player.volume, &player.beat_threshold);

        // 2. 处理命令
        if (active_key != 0)
        {
            player_apply_command(&player, active_key);
            last_led_val = active_key & 0x0F;
        }

        // 3. 播放引擎处理
        player_process(&player, score_data);

        // 4. UI 更新
        alt_u8 current_note = score_data[(player.songchoose << 5) | (player.addr_cnt & 0x1F)];
        update_display(player.songchoose, player.play_mode, player.volume, player.beat_threshold, current_note, keyboard, ir_vkey);
        IOWR_ALTERA_AVALON_PIO_DATA(PIO_LED_BASE, ~last_led_val);
    }
    return 0;
}
