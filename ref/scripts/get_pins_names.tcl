foreach_in_collection my_pin [get_pins *] {
set pin_name [get_object_name $my_pin];
echo $pin_name;
}

# to check if pin obtained is a clock
get_attribute [get_pins REGB_reg/CLK] clock
# the output to this will be true


