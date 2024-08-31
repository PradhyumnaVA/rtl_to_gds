# if the following commands are run without setting the target library,
# then the tool uses 'gtech' default library loaded into the tool. 

# gtech - virtual library in DC's memory, to understand the design

# loading design file and compiling should be done before commands 
# like get_cells, get_pins, etc. can be used

read_verilog design_name.v
link
compile_ultra

# to write out the netlist in .v format
write -f verilog -out design_netlist.v

# to load a miscellaneous library, should in .db format, as DC only
# understands this
read_db std_library.db


