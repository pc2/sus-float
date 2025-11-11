start_gui
create_project vivado_proj vivado_proj -part xcvc1902-vsva2197-2MP-e-S
set_property board_part xilinx.com:vck190:part0:3.2 [current_project]
set_property SOURCE_SET sources_1 [get_filesets sim_1]

add_files -fileset sim_1 -norecurse sus_codegen.sv tb.sv

import_ip [glob -type f xci_files/*.xci]

set_property top ComputeRoots_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

launch_simulation
