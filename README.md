# rtl_to_gds

**Brief description:** Learning RTL to GDSII flow using Mod-N conditional counter design

---

## Table of Contents

1. [Introduction](#introduction)

---

## Introduction

Mod-N conditional counter is implementated using verilog. Mod-6 counter is taken as example to conduct functional verification of the design. 
The logic design for the circuit made using Logisim.

- Logic design
![image](/images/Mod-6_conditional_counter.png)

- RTL design : 
[up_down_counter.v](/RTL/up_down_counter.v)

- Test bench : 
[tb_count.v](/RTL/tb_count.v)

- Simulation result : 
![image](/images/modN_counter_waveform.png)

- Constraints : 
``` tcl 
create_clock -name my_clk -period 10 [get_ports i_clk]

set_clock_latency 1 my_clk

set_clock_uncertainty 0.25 my_clk

set_input_delay -max 2 -clock [get_clocks my_clk] [get_ports i_rst]
set_input_delay -max 2 -clock [get_clocks my_clk] [get_ports i_en]
set_input_delay -max 2 -clock [get_clocks my_clk] [get_ports i_up_down]

set_input_delay -min 0.5 -clock [get_clocks my_clk] [get_ports i_rst]
set_input_delay -min 0.5 -clock [get_clocks my_clk] [get_ports i_en]
set_input_delay -min 0.5 -clock [get_clocks my_clk] [get_ports i_up_down]

set_input_transition -max 1.5 [get_ports i_rst]
set_input_transition -max 1.5 [get_ports i_en]
set_input_transition -max 1.5 [get_ports i_up_down]

set_input_transition -min .75 [get_ports i_rst]
set_input_transition -min .75 [get_ports i_en]
set_input_transition -min .75 [get_ports i_up_down]

set_output_delay -max 2.5 -clock [get_clocks my_clk] [get_ports o_Q]
set_output_delay -min 0.75 -clock [get_clocks my_clk] [get_ports o_Q]

set_load -max 2 [get_ports o_Q];
set_load -min 0.75 [get_ports o_Q];
```

- Gate level implementation of the design obtained using Design Compiler and Design Vision : 
![image](/images/netlist_schematic.png) 

