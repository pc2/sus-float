
set PART [lindex $argv 0]
set BOARD [lindex $argv 1]
set XCI_DIR [lindex $argv 2]

create_project vivado_proj vivado_proj -part $PART
set_property board_part $BOARD [current_project]
set_property SOURCE_SET sources_1 [get_filesets sim_1]

add_files -norecurse sus_codegen.sv tb.sv

import_ip [glob -type f ${XCI_DIR}/*.xci]

set_property top ComputeRoots_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order

launch_simulation
# start_gui
