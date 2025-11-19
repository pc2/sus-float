
# Versal
rm -rf vivado_proj
sus_compiler test.sus fp_custom.sus Versal/fp_wrappers.sus --top ComputeRoots -o sus_codegen.sv
ml fpga/xilinx/vivado/23.1
vivado -mode tcl -source test.tcl -tclargs xcvc1902-vsva2197-2MP-e-S xilinx.com:vck190:part0:3.2 Versal/xci_files

# UltraScalePlus
rm -rf vivado_proj
sus_compiler test.sus fp_custom.sus UltraScalePlus/fp_wrappers.sus --top ComputeRoots -o sus_codegen.sv
ml fpga/xilinx/vivado/23.2
vivado -mode tcl -source test.tcl -tclargs xcu280-fsvh2892-2L-e xilinx.com:au280:part0:1.2 UltraScalePlus/xci_files

