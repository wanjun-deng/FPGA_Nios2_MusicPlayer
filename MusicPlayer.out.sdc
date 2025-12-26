## Generated SDC file "MusicPlayer.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

## DATE    "Thu Nov 20 21:52:04 2025"

##
## DEVICE  "EP4CE6F17C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_raw} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk_raw}]
create_clock -name {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]} -period 1.000 -waveform { 0.000 0.500 } [get_registers {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}]
create_clock -name {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]} -period 1.000 -waveform { 0.000 0.500 } [get_registers {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]
create_clock -name {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]} -period 1.000 -waveform { 0.000 0.500 } [get_registers {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {pll0|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {pll0|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -master_clock {clk_raw} [get_pins {pll0|altpll_component|auto_generated|pll1|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -rise_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -fall_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -rise_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -fall_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -rise_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -fall_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -rise_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -fall_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {FreqSynth:FS|preDiv:preDiv1|lpm_counter:LPM_COUNTER_component|cntr_nni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {FreqSynth:FS|cp:cp1|lpm_compare:LPM_COMPARE_component|cmpr_05j:auto_generated|ageb_dffe[0]}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {scorereader:sr|beater:btr|lpm_counter:LPM_COUNTER_component|cntr_sni:auto_generated|counter_reg_bit[0]}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

