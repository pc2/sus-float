sus_compiler ../../fp_custom.sus ../../UltraScalePlus/*.sus -o codegen.sv --top fp32_reduce_sum --gen-tb

vivado -mode batch -script sim.tcl
