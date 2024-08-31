###### these are for constraining REG2REG paths #########

# models source latency of the clock
set_clock_latency -source 2 [get_clocks my_clk]

# models network latency of the clock
set_clock_latency 1 [get_clocks my_clk]

# by default this is for setup time i.e. max delay or can also use -setup flag
set_clock_uncertainty 0.5 [get_clocks my_clk]

# modeling min delay or hold time
set_clock_uncertainty -hold 0.1 [get_clocks my_clk]
