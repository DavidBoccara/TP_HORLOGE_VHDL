## Generated SDC file "test.sdc"

## Copyright (C) 2019  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

## DATE    "Fri Aug 28 18:34:40 2020"

##
## DEVICE  "10M50DAF484C7G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {max10_clk1_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {max10_clk1_50}]
create_clock -name {ctrl:ctrl|seconde_A[0]$latch} -period 1.000 -waveform { 0.000 0.500 } [get_registers {ctrl:ctrl|seconde_A[0]$latch}]
create_clock -name {impulsion:impulsion|top_1s} -period 1.000 -waveform { 0.000 0.500 } [get_registers {impulsion:impulsion|top_1s}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {pll1|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {pll1|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 1 -master_clock {max10_clk1_50} [get_pins {pll1|altpll_component|auto_generated|pll1|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -rise_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -fall_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -rise_to [get_clocks {impulsion:impulsion|top_1s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -fall_to [get_clocks {impulsion:impulsion|top_1s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -rise_to [get_clocks {max10_clk1_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -fall_to [get_clocks {max10_clk1_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -rise_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -fall_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -rise_to [get_clocks {impulsion:impulsion|top_1s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -fall_to [get_clocks {impulsion:impulsion|top_1s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -rise_to [get_clocks {max10_clk1_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -fall_to [get_clocks {max10_clk1_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {impulsion:impulsion|top_1s}] -rise_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {impulsion:impulsion|top_1s}] -fall_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {impulsion:impulsion|top_1s}] -rise_to [get_clocks {impulsion:impulsion|top_1s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {impulsion:impulsion|top_1s}] -fall_to [get_clocks {impulsion:impulsion|top_1s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {impulsion:impulsion|top_1s}] -rise_to [get_clocks {max10_clk1_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {impulsion:impulsion|top_1s}] -fall_to [get_clocks {max10_clk1_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {impulsion:impulsion|top_1s}] -rise_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {impulsion:impulsion|top_1s}] -fall_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {impulsion:impulsion|top_1s}] -rise_to [get_clocks {impulsion:impulsion|top_1s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {impulsion:impulsion|top_1s}] -fall_to [get_clocks {impulsion:impulsion|top_1s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {impulsion:impulsion|top_1s}] -rise_to [get_clocks {max10_clk1_50}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {impulsion:impulsion|top_1s}] -fall_to [get_clocks {max10_clk1_50}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {impulsion:impulsion|top_1s}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {impulsion:impulsion|top_1s}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {impulsion:impulsion|top_1s}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {impulsion:impulsion|top_1s}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {max10_clk1_50}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {max10_clk1_50}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {max10_clk1_50}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {max10_clk1_50}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {ctrl:ctrl|seconde_A[0]$latch}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {impulsion:impulsion|top_1s}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {impulsion:impulsion|top_1s}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {impulsion:impulsion|top_1s}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {impulsion:impulsion|top_1s}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {max10_clk1_50}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {max10_clk1_50}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {max10_clk1_50}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {max10_clk1_50}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {max10_clk1_50}] -rise_to [get_clocks {impulsion:impulsion|top_1s}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {max10_clk1_50}] -fall_to [get_clocks {impulsion:impulsion|top_1s}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {max10_clk1_50}] -rise_to [get_clocks {max10_clk1_50}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {max10_clk1_50}] -fall_to [get_clocks {max10_clk1_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {max10_clk1_50}] -rise_to [get_clocks {impulsion:impulsion|top_1s}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {max10_clk1_50}] -fall_to [get_clocks {impulsion:impulsion|top_1s}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {max10_clk1_50}] -rise_to [get_clocks {max10_clk1_50}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {max10_clk1_50}] -fall_to [get_clocks {max10_clk1_50}]  0.020  


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

