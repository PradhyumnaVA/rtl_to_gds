foreach_in_collection my_cell [get_cells * -hier] {
set my_cell_name [get_object_name $my_cell];
set rname [get_attribute [get_cells $my_cell_name] ref_name];
echo "$my_cell_name - $rname";
}

# get_object_name $my_cell - is used because get_cells output is a list, so this command gets each object from the list
# for get_attribute - there is ref_name, direction, period, is_generated, clock, clocks, etc. 
