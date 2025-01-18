transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xbip_utils_v3_0_14
vlib activehdl/axi_utils_v2_0_10
vlib activehdl/xbip_pipe_v3_0_10
vlib activehdl/xbip_dsp48_wrapper_v3_0_6
vlib activehdl/mult_gen_v12_0_22
vlib activehdl/floating_point_v7_1_19
vlib activehdl/xil_defaultlib

vmap xbip_utils_v3_0_14 activehdl/xbip_utils_v3_0_14
vmap axi_utils_v2_0_10 activehdl/axi_utils_v2_0_10
vmap xbip_pipe_v3_0_10 activehdl/xbip_pipe_v3_0_10
vmap xbip_dsp48_wrapper_v3_0_6 activehdl/xbip_dsp48_wrapper_v3_0_6
vmap mult_gen_v12_0_22 activehdl/mult_gen_v12_0_22
vmap floating_point_v7_1_19 activehdl/floating_point_v7_1_19
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xbip_utils_v3_0_14 -93  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_10 -93  \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_10 -93  \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -93  \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_22 -93  \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_19 -93  \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_19  -v2k5 -l xbip_utils_v3_0_14 -l axi_utils_v2_0_10 -l xbip_pipe_v3_0_10 -l xbip_dsp48_wrapper_v3_0_6 -l mult_gen_v12_0_22 -l floating_point_v7_1_19 -l xil_defaultlib \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -v2k5 -l xbip_utils_v3_0_14 -l axi_utils_v2_0_10 -l xbip_pipe_v3_0_10 -l xbip_dsp48_wrapper_v3_0_6 -l mult_gen_v12_0_22 -l floating_point_v7_1_19 -l xil_defaultlib \
"../../../../fpAddWrapperTest01.gen/sources_1/ip/floating_point_0/sim/floating_point_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

