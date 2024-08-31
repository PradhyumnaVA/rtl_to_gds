create_clock -name my_clk -per 10 [get_ports clk]

get_clocks * 
# output of this is {my_clk} - as this is the master clock

get_attribute [get_clocks my_clk] period
# output is 10.000000

get_attribute [get_clocks my_clk] is_generated
# output is false as the my_clk is the master clock

report_clocks
# output of this is -
# 
#
# 
# ****************************************
# Report : clocks
# Design : lab8_circuit
# Version: T-2022.03-SP5
# Date   : Fri Aug  2 13:11:20 2024
# ****************************************
#
# Attributes:
# d - dont_touch_network
# f - fix_hold
# p - propagated_clock
# G - generated_clock
# g - lib_generated_clock
#
# Clock          Period   Waveform            Attrs     Sources
# --------------------------------------------------------------------------------
# my_clk          10.00   {0 5}                         {clk}
# --------------------------------------------------------------------------------

# to remove a clock
remove_clock <clock_name>

get_attribute [get_ports clk] clocks 
# this gives the name of the clock connected to the port or pin

get_attribute [get_pins REGA_reg/CLK] clock
# this gives true if the pin mentioned has a clock attribute in its standard cell. 
