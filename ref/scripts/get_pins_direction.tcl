foreach_in_collection my_pin [all_connected n3] {
set pin_name [get_object_name $my_pin];
set dir [get_attribute [get_pins $pin_name] direction];
echo $pin_name - $dir;
}

# this gives the pin direction of all the pins in the design
foreach_in_collection my_pin [get_pins *] {                                                                                                                                                                              set pin_name [get_object_name $my_pin];                                                                                                                                                                            set dir [get_attribute $pin_name direction];
      echo "$pin_name - $dir";
}
