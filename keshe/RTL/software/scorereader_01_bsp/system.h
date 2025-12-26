/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2' in SOPC Builder design 'mysystem'
 * SOPC Builder design path: D:/Quartus_Project/keshe_07/keshe/RTL/mysystem.sopcinfo
 *
 * Generated: Fri Dec 26 12:24:57 CST 2025
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00001020
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x10
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x00008020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x10
#define ALT_CPU_NAME "nios2"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_RESET_ADDR 0x00000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00001020
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x10
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x00008020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x10
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_RESET_ADDR 0x00000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_QSYS


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x1900
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x1900
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x1900
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "mysystem"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 4
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x1900
#define JTAG_UART_0_IRQ 1
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * pio_display configuration
 *
 */

#define ALT_MODULE_CLASS_pio_display altera_avalon_pio
#define PIO_DISPLAY_BASE 0x1800
#define PIO_DISPLAY_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_DISPLAY_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_DISPLAY_CAPTURE 0
#define PIO_DISPLAY_DATA_WIDTH 32
#define PIO_DISPLAY_DO_TEST_BENCH_WIRING 0
#define PIO_DISPLAY_DRIVEN_SIM_VALUE 0
#define PIO_DISPLAY_EDGE_TYPE "NONE"
#define PIO_DISPLAY_FREQ 50000000
#define PIO_DISPLAY_HAS_IN 0
#define PIO_DISPLAY_HAS_OUT 1
#define PIO_DISPLAY_HAS_TRI 0
#define PIO_DISPLAY_IRQ -1
#define PIO_DISPLAY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_DISPLAY_IRQ_TYPE "NONE"
#define PIO_DISPLAY_NAME "/dev/pio_display"
#define PIO_DISPLAY_RESET_VALUE 0
#define PIO_DISPLAY_SPAN 32
#define PIO_DISPLAY_TYPE "altera_avalon_pio"


/*
 * pio_irdata configuration
 *
 */

#define ALT_MODULE_CLASS_pio_irdata altera_avalon_pio
#define PIO_IRDATA_BASE 0x18f0
#define PIO_IRDATA_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_IRDATA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_IRDATA_CAPTURE 0
#define PIO_IRDATA_DATA_WIDTH 16
#define PIO_IRDATA_DO_TEST_BENCH_WIRING 0
#define PIO_IRDATA_DRIVEN_SIM_VALUE 0
#define PIO_IRDATA_EDGE_TYPE "NONE"
#define PIO_IRDATA_FREQ 50000000
#define PIO_IRDATA_HAS_IN 1
#define PIO_IRDATA_HAS_OUT 0
#define PIO_IRDATA_HAS_TRI 0
#define PIO_IRDATA_IRQ -1
#define PIO_IRDATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_IRDATA_IRQ_TYPE "NONE"
#define PIO_IRDATA_NAME "/dev/pio_irdata"
#define PIO_IRDATA_RESET_VALUE 0
#define PIO_IRDATA_SPAN 16
#define PIO_IRDATA_TYPE "altera_avalon_pio"


/*
 * pio_irflag configuration
 *
 */

#define ALT_MODULE_CLASS_pio_irflag altera_avalon_pio
#define PIO_IRFLAG_BASE 0x18e0
#define PIO_IRFLAG_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_IRFLAG_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_IRFLAG_CAPTURE 0
#define PIO_IRFLAG_DATA_WIDTH 8
#define PIO_IRFLAG_DO_TEST_BENCH_WIRING 0
#define PIO_IRFLAG_DRIVEN_SIM_VALUE 0
#define PIO_IRFLAG_EDGE_TYPE "NONE"
#define PIO_IRFLAG_FREQ 50000000
#define PIO_IRFLAG_HAS_IN 1
#define PIO_IRFLAG_HAS_OUT 0
#define PIO_IRFLAG_HAS_TRI 0
#define PIO_IRFLAG_IRQ -1
#define PIO_IRFLAG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_IRFLAG_IRQ_TYPE "NONE"
#define PIO_IRFLAG_NAME "/dev/pio_irflag"
#define PIO_IRFLAG_RESET_VALUE 0
#define PIO_IRFLAG_SPAN 16
#define PIO_IRFLAG_TYPE "altera_avalon_pio"


/*
 * pio_keyboard configuration
 *
 */

#define ALT_MODULE_CLASS_pio_keyboard altera_avalon_pio
#define PIO_KEYBOARD_BASE 0x18a0
#define PIO_KEYBOARD_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_KEYBOARD_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_KEYBOARD_CAPTURE 0
#define PIO_KEYBOARD_DATA_WIDTH 8
#define PIO_KEYBOARD_DO_TEST_BENCH_WIRING 0
#define PIO_KEYBOARD_DRIVEN_SIM_VALUE 0
#define PIO_KEYBOARD_EDGE_TYPE "NONE"
#define PIO_KEYBOARD_FREQ 50000000
#define PIO_KEYBOARD_HAS_IN 1
#define PIO_KEYBOARD_HAS_OUT 0
#define PIO_KEYBOARD_HAS_TRI 0
#define PIO_KEYBOARD_IRQ -1
#define PIO_KEYBOARD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_KEYBOARD_IRQ_TYPE "NONE"
#define PIO_KEYBOARD_NAME "/dev/pio_keyboard"
#define PIO_KEYBOARD_RESET_VALUE 0
#define PIO_KEYBOARD_SPAN 32
#define PIO_KEYBOARD_TYPE "altera_avalon_pio"


/*
 * pio_led configuration
 *
 */

#define ALT_MODULE_CLASS_pio_led altera_avalon_pio
#define PIO_LED_BASE 0x18c0
#define PIO_LED_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LED_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_LED_CAPTURE 0
#define PIO_LED_DATA_WIDTH 8
#define PIO_LED_DO_TEST_BENCH_WIRING 0
#define PIO_LED_DRIVEN_SIM_VALUE 0
#define PIO_LED_EDGE_TYPE "NONE"
#define PIO_LED_FREQ 50000000
#define PIO_LED_HAS_IN 0
#define PIO_LED_HAS_OUT 1
#define PIO_LED_HAS_TRI 0
#define PIO_LED_IRQ -1
#define PIO_LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LED_IRQ_TYPE "NONE"
#define PIO_LED_NAME "/dev/pio_led"
#define PIO_LED_RESET_VALUE 15
#define PIO_LED_SPAN 32
#define PIO_LED_TYPE "altera_avalon_pio"


/*
 * pio_onote configuration
 *
 */

#define ALT_MODULE_CLASS_pio_onote altera_avalon_pio
#define PIO_ONOTE_BASE 0x1880
#define PIO_ONOTE_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_ONOTE_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_ONOTE_CAPTURE 0
#define PIO_ONOTE_DATA_WIDTH 8
#define PIO_ONOTE_DO_TEST_BENCH_WIRING 0
#define PIO_ONOTE_DRIVEN_SIM_VALUE 0
#define PIO_ONOTE_EDGE_TYPE "NONE"
#define PIO_ONOTE_FREQ 50000000
#define PIO_ONOTE_HAS_IN 0
#define PIO_ONOTE_HAS_OUT 1
#define PIO_ONOTE_HAS_TRI 0
#define PIO_ONOTE_IRQ -1
#define PIO_ONOTE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_ONOTE_IRQ_TYPE "NONE"
#define PIO_ONOTE_NAME "/dev/pio_onote"
#define PIO_ONOTE_RESET_VALUE 0
#define PIO_ONOTE_SPAN 32
#define PIO_ONOTE_TYPE "altera_avalon_pio"


/*
 * pio_playing configuration
 *
 */

#define ALT_MODULE_CLASS_pio_playing altera_avalon_pio
#define PIO_PLAYING_BASE 0x1860
#define PIO_PLAYING_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_PLAYING_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_PLAYING_CAPTURE 0
#define PIO_PLAYING_DATA_WIDTH 8
#define PIO_PLAYING_DO_TEST_BENCH_WIRING 0
#define PIO_PLAYING_DRIVEN_SIM_VALUE 0
#define PIO_PLAYING_EDGE_TYPE "NONE"
#define PIO_PLAYING_FREQ 50000000
#define PIO_PLAYING_HAS_IN 0
#define PIO_PLAYING_HAS_OUT 1
#define PIO_PLAYING_HAS_TRI 0
#define PIO_PLAYING_IRQ -1
#define PIO_PLAYING_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_PLAYING_IRQ_TYPE "NONE"
#define PIO_PLAYING_NAME "/dev/pio_playing"
#define PIO_PLAYING_RESET_VALUE 0
#define PIO_PLAYING_SPAN 32
#define PIO_PLAYING_TYPE "altera_avalon_pio"


/*
 * pio_volumectrl configuration
 *
 */

#define ALT_MODULE_CLASS_pio_volumectrl altera_avalon_pio
#define PIO_VOLUMECTRL_BASE 0x1820
#define PIO_VOLUMECTRL_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_VOLUMECTRL_BIT_MODIFYING_OUTPUT_REGISTER 1
#define PIO_VOLUMECTRL_CAPTURE 0
#define PIO_VOLUMECTRL_DATA_WIDTH 8
#define PIO_VOLUMECTRL_DO_TEST_BENCH_WIRING 0
#define PIO_VOLUMECTRL_DRIVEN_SIM_VALUE 0
#define PIO_VOLUMECTRL_EDGE_TYPE "NONE"
#define PIO_VOLUMECTRL_FREQ 50000000
#define PIO_VOLUMECTRL_HAS_IN 0
#define PIO_VOLUMECTRL_HAS_OUT 1
#define PIO_VOLUMECTRL_HAS_TRI 0
#define PIO_VOLUMECTRL_IRQ -1
#define PIO_VOLUMECTRL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_VOLUMECTRL_IRQ_TYPE "NONE"
#define PIO_VOLUMECTRL_NAME "/dev/pio_volumectrl"
#define PIO_VOLUMECTRL_RESET_VALUE 0
#define PIO_VOLUMECTRL_SPAN 32
#define PIO_VOLUMECTRL_TYPE "altera_avalon_pio"


/*
 * ram configuration
 *
 */

#define ALT_MODULE_CLASS_ram altera_avalon_onchip_memory2
#define RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define RAM_BASE 0x8000
#define RAM_CONTENTS_INFO ""
#define RAM_DUAL_PORT 0
#define RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define RAM_INIT_CONTENTS_FILE "mysystem_ram"
#define RAM_INIT_MEM_CONTENT 1
#define RAM_INSTANCE_ID "NONE"
#define RAM_IRQ -1
#define RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RAM_NAME "/dev/ram"
#define RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define RAM_RAM_BLOCK_TYPE "AUTO"
#define RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define RAM_SINGLE_CLOCK_OP 0
#define RAM_SIZE_MULTIPLE 1
#define RAM_SIZE_VALUE 13000
#define RAM_SPAN 13000
#define RAM_TYPE "altera_avalon_onchip_memory2"
#define RAM_WRITABLE 1


/*
 * rom configuration
 *
 */

#define ALT_MODULE_CLASS_rom altera_avalon_onchip_memory2
#define ROM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ROM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ROM_BASE 0x0
#define ROM_CONTENTS_INFO ""
#define ROM_DUAL_PORT 0
#define ROM_GUI_RAM_BLOCK_TYPE "AUTO"
#define ROM_INIT_CONTENTS_FILE "mysystem_rom"
#define ROM_INIT_MEM_CONTENT 1
#define ROM_INSTANCE_ID "NONE"
#define ROM_IRQ -1
#define ROM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ROM_NAME "/dev/rom"
#define ROM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ROM_RAM_BLOCK_TYPE "AUTO"
#define ROM_READ_DURING_WRITE_MODE "DONT_CARE"
#define ROM_SINGLE_CLOCK_OP 0
#define ROM_SIZE_MULTIPLE 1
#define ROM_SIZE_VALUE 2048
#define ROM_SPAN 2048
#define ROM_TYPE "altera_avalon_onchip_memory2"
#define ROM_WRITABLE 0


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x1908
#define SYSID_ID -2023406815
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1766722860
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * timer_0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_0 altera_avalon_timer
#define TIMER_0_ALWAYS_RUN 0
#define TIMER_0_BASE 0x1840
#define TIMER_0_COUNTER_SIZE 32
#define TIMER_0_FIXED_PERIOD 0
#define TIMER_0_FREQ 50000000
#define TIMER_0_IRQ 0
#define TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_0_LOAD_VALUE 49999
#define TIMER_0_MULT 0.0010
#define TIMER_0_NAME "/dev/timer_0"
#define TIMER_0_PERIOD 1
#define TIMER_0_PERIOD_UNITS "ms"
#define TIMER_0_RESET_OUTPUT 0
#define TIMER_0_SNAPSHOT 1
#define TIMER_0_SPAN 32
#define TIMER_0_TICKS_PER_SEC 1000.0
#define TIMER_0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_0_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
