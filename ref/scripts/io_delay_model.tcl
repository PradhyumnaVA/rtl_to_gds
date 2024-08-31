set_input_delay -max 3 -clock [get_clocks my_clk] [get_ports IN_*]
set_input_delay -min 0.5 -clock [get_clocks my_clk] [get_ports IN_*]

set_input_transition -max 1.5 [get_ports IN_*]
set_input_transition -min 0.75 [get_ports IN_*]

set_output_delay -max 1 -clock [get_clocks my_clk] [get_ports OUT_Y]
set_output_delay -min 0.75 -clock [get_clocks my_clk] [get_ports OUT_Y]

set_load -max 1 [get_ports OUT_Y]
set_load -min .5 [get_ports OUT_Y]


