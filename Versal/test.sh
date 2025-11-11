rm -r vivado*

sus_compiler test.sus fp_custom.sus fp_wrappers.sus --top ComputeRoots -o sus_codegen.sv

vivado -mode tcl -source test.tcl
