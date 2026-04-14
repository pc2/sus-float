# Simulate with Vivado

create_project -force fp_reduce_tests /tmp/fp_reduce_tests -part xcu280-fsvh2892-2L-e

add_files testbench.sv
add_files codegen.sv

import_ip [glob -type f ../../UltraScalePlus/xci_files/*.xci]

update_compile_order -fileset sources_1

set_property top fp32_reduce_sum_tb [get_filesets sim_1]

# set_property top fp_reduce_tests [get_filesets sim_1]
# set_property top_lib xil_defaultlib [get_filesets sim_1]

launch_simulation
launch_vivado
