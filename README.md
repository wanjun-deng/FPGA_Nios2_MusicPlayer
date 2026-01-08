# Nios II 音乐播放器

## 项目简介

本项目是一个基于 Altera Nios II 软核处理器的 FPGA 音乐播放器。通过将乐谱逻辑从硬件 ROM 转移到软件 C 数组，实现了更灵活的播放控制和丰富的功能。该项目展示了 FPGA 软硬件协同设计的完整流程，适用于SOPC的学习与实践。

## 核心功能

- **四种播放模式**: 单次播放、单曲循环、顺序播放、随机播放。
- **多源控制**: 支持 4x4 矩阵键盘和 NEC 协议红外遥控器同步控制。
- **实时调节**: 4 级音量调节 (PWM 实现) 和 4 级播放速度调节。
- **状态显示**: 8 位数码管实时显示歌曲编号、模式、音量、速度、当前音符及最后按键值。
- **架构优化**: 采用模块化设计 (Player, InputManager) 和中断驱动计时 (Timer ISR)。

## 硬件架构

- **FPGA 开发板**: 小梅哥AC620
- **FPGA 芯片**: Cyclone IV E
- **处理器**: Nios II (Fast 版本)
- **时钟**: 50MHz 输入时钟，通过 PLL 生成系统时钟
- **外设**:
  - **FreqSynth** (`ip/custom/FreqSynth_IP/`): 自定义频率合成器 IP 核 (Verilog)，根据音符频率生成 PWM 信号，实现音频输出。支持软件控制的音量调节。
  - **Key_Board** (`ip/custom/KeyBoard_IP/`): 4x4 矩阵键盘扫描模块 IP 核，处理行列扫描逻辑，检测按键输入并转换为数字信号。
  - **ir_decode** (`ip/custom/Ir_Decode_IP/`): 红外接收解码模块 IP 核，支持 NEC 协议红外遥控器信号解码，提取按键码值。
  - **HEX8** (`ip/custom/Hex_Driver_IP/`): 8 位数码管驱动模块 IP 核，使用 74HC595 移位寄存器串行驱动并行数码管显示，支持多位数字和符号显示。
  - **PIO**: Altera 标准并行 I/O 接口 IP 核，用于 Nios II 处理器与自定义硬件模块之间的数据通信和控制信号传递。
  - **PLL** (`ip/vendor/pll/`): 相位锁定环 IP 核，从 50MHz 输入时钟生成稳定的系统时钟，确保音频和定时精度。
  - **其他辅助 IP** (`ip/vendor/`): 包括节拍计数器 (beatct)、节拍器 (beater)、分频器 (octdiv, preDiv, scalediv) 等，用于音乐播放的时序控制和乐谱处理。

### 硬件连接要求

- **矩阵键盘**: 4 行输入 (row)，4 列输出 (col_raw)
- **红外接收器**: 连接到 iIR 引脚
- **数码管**: SH_CP, ST_CP, DS 连接到 74HC595
- **音频输出**: out 引脚连接到扬声器或放大器
- **LED**: 4 个 LED 用于状态指示

## 软件架构

采用模块化设计，软件运行在 Nios II 处理器上：

- `main.c`: 程序入口，负责系统初始化和主循环调度。
- `player.c/h`: 播放引擎，管理播放状态机 (FSM) 和切歌逻辑。
- `input_manager.c/h`: 输入抽象层，统一键盘和红外事件处理。
- `ir_handler.c/h`: 红外底层处理与数码管显示格式化。
- `display_manager.c/h`: 显示管理模块，负责数码管更新。
- `config.h`: 系统全局配置常量 (如音量级别、速度级别)。
- `score_data.h`: 乐谱数据数组，存储多首歌曲的音符和时长。

### 软件依赖

- **开发环境**: Quartus II 13.0+
- **Nios II 工具**: Nios II Software Build Tools for Eclipse
- **编译器**: GCC for Nios II
- **操作系统**: Windows/Linux (支持 Quartus)

## 项目结构

```
FPGA_01/
├── README.md                    # 项目说明文档
├── MusicPlayer.v               # 顶层 Verilog 模块
├── MPTB.v                      # 测试平台 (Testbench)
├── MusicPlayer.qpf             # Quartus 项目文件
├── MusicPlayer.qsf             # Quartus 设置文件
├── mysystem.qsys               # Platform Designer 系统
├── ip/                         # IP 核文件夹
│   ├── custom/                 # 自定义 IP 核
│   │   ├── FreqSynth_IP/       # 频率合成器 IP
│   │   ├── Hex_Driver_IP/      # 数码管驱动 IP
│   │   ├── Ir_Decode_IP/       # 红外解码 IP
│   │   └── KeyBoard_IP/        # 键盘扫描 IP
│   └── vendor/                 # 第三方 IP 核
│       ├── beatct/             # 节拍计数器 IP
│       ├── beater/             # 节拍器 IP
│       ├── cp/                 # 复制 IP
│       ├── octdiv/             # 八分频 IP
│       ├── pll/                # PLL 时钟 IP
│       ├── preDiv/             # 预分频 IP
│       ├── scalediv/           # 比例分频 IP
│       └── score/              # 乐谱 IP
├── software/
│   └── fpga_0/                 # Nios II 应用软件
│       ├── main.c
│       ├── player.c/h
│       ├── input_manager.c/h
│       ├── ir_handler.c/h
│       ├── display_manager.c/h
│       ├── config.h
│       └── score_data.h
├── output_files/               # Quartus 编译输出
│   └── MusicPlayer.sof         # FPGA 编程文件
├── db/                         # 综合数据库
├── 红外遥控器键值对应.txt       # 红外键值映射
└── archive/                    # 历史版本存档
```

## 构建和运行指南

### 硬件工程编译
1. 打开 Quartus II，加载 `MusicPlayer.qpf` 项目文件。
2. 确保所有 Verilog 文件和 Qsys 系统正确配置。
3. 运行 **Processing > Start Compilation** 进行综合、布局布线和时序分析。
4. 生成 `.sof` 文件后，使用 Programmer 下载到 FPGA 板。

### 软件工程编译
1. 打开 Nios II Software Build Tools。
2. 创建新 BSP 项目，基于 `mysystem.sopcinfo` 文件。
3. 导入 `software/fpga_0/` 目录下的源代码。
4. 编译 BSP 和应用软件，生成 `.elf` 可执行文件。
5. 使用 Nios II Programmer 下载软件到 FPGA。

### 运行和测试
1. 连接硬件：键盘、红外遥控器、数码管、扬声器。
2. 上电 FPGA 板，下载 `.sof` 和 `.elf` 文件。
3. 系统启动后，通过键盘或红外遥控器控制播放。
4. 观察数码管显示和音频输出。

### 按键映射

|   按键   |        功能描述 
|------    |------------------------------|
| 0-3      | 切换播放模式:单次/循环/顺序/随机
| 4        | 暂停/继续
| 5        | 停止
| 6-9      | 切换歌曲 1-4
| 10/UP    | 音量+
| 11/DOWN  | 音量-
| 12/RIGHT | 速度+
| 13/LEFT  | 速度-

### 操作流程

1. **烧录**: 先烧录硬件MusicPlayer.sof，再烧录软件xxx.elf(软件需要重新编译生成，见“软件工程编译”)。
2. **选择歌曲**: 按 6-9 选择歌曲。
3. **播放控制**: 按 0-3 选择模式，按 4 播放/暂停，按 5 停止。
4. **调节**: 10-13 键调节音量和速度。
5. **状态查看**: 数码管实时显示当前状态。

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。
