vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_14
vlib modelsim_lib/msim/axi_utils_v2_0_10
vlib modelsim_lib/msim/xbip_pipe_v3_0_10
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_6
vlib modelsim_lib/msim/mult_gen_v12_0_22
vlib modelsim_lib/msim/floating_point_v7_1_19
vlib modelsim_lib/msim/xil_defaultlib

vmap xbip_utils_v3_0_14 modelsim_lib/msim/xbip_utils_v3_0_14
vmap axi_utils_v2_0_10 modelsim_lib/msim/axi_utils_v2_0_10
vmap xbip_pipe_v3_0_10 modelsim_lib/msim/xbip_pipe_v3_0_10
vmap xbip_dsp48_wrapper_v3_0_6 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_6
vmap mult_gen_v12_0_22 modelsim_lib/msim/mult_gen_v12_0_22
vmap floating_point_v7_1_19 modelsim_lib/msim/floating_point_v7_1_19
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xbip_utils_v3_0_14  -93  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_10  -93  \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_10  -93  \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6  -93  \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_22  -93  \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_19  -93  \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_19  -incr -mfcu  \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../../fpAbsolute.gen/sources_1/ip/floating_point_0/sim/floating_point_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

