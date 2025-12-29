#ifndef CONFIG_H_
#define CONFIG_H_

// 播放模式定义
#define MODE_SINGLE      1  // 单次播放
#define MODE_LOOP        2  // 单曲循环
#define MODE_SEQUENTIAL  3  // 顺序播放
#define MODE_RANDOM      4  // 随机播放

// 速度阈值定义 (单位: ms)
#define SPEED_LEVEL_1    500 // 最慢
#define SPEED_LEVEL_2    336 // 标准
#define SPEED_LEVEL_3    200 // 快
#define SPEED_LEVEL_4    100 // 最快

// 音量定义
#define VOL_MIN          0
#define VOL_MAX          3
#define VOL_DEFAULT      1

// 歌曲定义
#define SONG_COUNT       4
#define SONG_ADDR_RANGE  32

// 虚拟键值偏移
#define KEY_BASE         0x10

#endif
