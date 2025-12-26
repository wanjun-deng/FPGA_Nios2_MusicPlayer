###############################################################################
# Copyright (C) 1991-2009 Altera Corporation
# Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
# support information,  device programming or simulation file,  and any other
# associated  documentation or information  provided by  Altera  or a partner
# under  Altera's   Megafunction   Partnership   Program  may  be  used  only
# to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
# other  use  of such  megafunction  design,  netlist,  support  information,
# device programming or simulation file,  or any other  related documentation
# or information  is prohibited  for  any  other purpose,  including, but not
# limited to  modification,  reverse engineering,  de-compiling, or use  with
# any other  silicon devices,  unless such use is  explicitly  licensed under
# a separate agreement with  Altera  or a megafunction partner.  Title to the
# intellectual property,  including patents,  copyrights,  trademarks,  trade
# secrets,  or maskworks,  embodied in any such megafunction design, netlist,
# support  information,  device programming or simulation file,  or any other
# related documentation or information provided by  Altera  or a megafunction
# partner, remains with Altera, the megafunction partner, or their respective
# licensors. No other licenses, including any licenses needed under any third
# party's intellectual property, are provided herein.
#
###############################################################################


# FPGA Xchange file generated using Quartus II Version 13.1.0 Build 162 10/23/2013 SJ Full Version

# DESIGN=MusicPlayer_01
# REVISION=MusicPlayer
# DEVICE=EP4CE6
# PACKAGE=FBGA
# SPEEDGRADE=8

Signal Name,Pin Number,Direction,IO Standard,Drive (mA),Termination,Slew Rate,Swap Group,Diff Type

col_raw[0],F3,output,3.3-V LVCMOS,2,Off,FAST,swap_0,--
col_raw[1],J6,output,3.3-V LVCMOS,2,Off,FAST,swap_0,--
col_raw[2],L4,output,3.3-V LVCMOS,2,Off,FAST,swap_0,--
col_raw[3],L3,output,3.3-V LVCMOS,2,Off,FAST,swap_0,--
led[0],A3,output,3.3-V LVTTL,8,Off,FAST,swap_1,--
led[1],A4,output,3.3-V LVTTL,8,Off,FAST,swap_1,--
led[2],B3,output,3.3-V LVTTL,8,Off,FAST,swap_1,--
led[3],A2,output,3.3-V LVTTL,8,Off,FAST,swap_1,--
out,L16,output,3.3-V LVCMOS,2,Off,FAST,swap_0,--
SH_CP,F6,output,3.3-V LVCMOS,2,Off,FAST,swap_0,--
ST_CP,B4,output,3.3-V LVCMOS,2,Off,FAST,swap_0,--
DS,E6,output,3.3-V LVCMOS,2,Off,FAST,swap_0,--
reset_n,E16,input,3.3-V LVCMOS,,Off,--,swap_2,--
row[0],D3,input,3.3-V LVCMOS,,Off,--,swap_2,--
row[1],D1,input,3.3-V LVCMOS,,Off,--,swap_2,--
row[2],F5,input,3.3-V LVCMOS,,Off,--,swap_2,--
row[3],G2,input,3.3-V LVCMOS,,Off,--,swap_2,--
clk_raw,E1,input,3.3-V LVCMOS,,Off,--,swap_2,--
iIR,M1,input,3.3-V LVCMOS,,Off,--,swap_2,--
altera_reserved_tms,J5,input,3.3-V LVTTL,,Off,--,NOSWAP,--
altera_reserved_tck,H3,input,3.3-V LVTTL,,Off,--,NOSWAP,--
altera_reserved_tdi,H4,input,3.3-V LVTTL,,Off,--,NOSWAP,--
altera_reserved_tdo,J4,output,3.3-V LVTTL,Default,Off,FAST,NOSWAP,--
~ALTERA_ASDO_DATA1~,C1,input,3.3-V LVTTL,,Off,--,NOSWAP,--
~ALTERA_FLASH_nCE_nCSO~,D2,input,3.3-V LVTTL,,Off,--,NOSWAP,--
~ALTERA_DCLK~,H1,output,3.3-V LVTTL,Default,Off,FAST,NOSWAP,--
~ALTERA_DATA0~,H2,input,3.3-V LVTTL,,Off,--,NOSWAP,--
~ALTERA_nCEO~,F16,output,3.3-V LVTTL,8,Off,FAST,NOSWAP,--
