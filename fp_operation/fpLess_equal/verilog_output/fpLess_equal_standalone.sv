// DO NOT EDIT THIS FILE
// This file was generated with SUS Compiler 0.2.0-devel
// ::fpLess_equal #()
module fpLess_equal___(
	input aclk,
	input wire [31:0] value1,
	input wire [31:0] value2,
	output /*mux_wire*/ logic [31:0] result
);

/*mux_wire*/ logic [31:0] fple_s_axis_a_tdata;
/*mux_wire*/ logic [31:0] fple_s_axis_b_tdata;
wire [31:0] fple_m_axis_result_tdata;
floating_point_0 #() fple(
	.aclk(aclk),
	.s_axis_a_tdata(fple_s_axis_a_tdata),
	.s_axis_b_tdata(fple_s_axis_b_tdata),
	.m_axis_result_tdata(fple_m_axis_result_tdata)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	result[0] = 'x;
	result[1] = 'x;
	result[2] = 'x;
	result[3] = 'x;
	result[4] = 'x;
	result[5] = 'x;
	result[6] = 'x;
	result[7] = 'x;
	result[8] = 'x;
	result[9] = 'x;
	result[10] = 'x;
	result[11] = 'x;
	result[12] = 'x;
	result[13] = 'x;
	result[14] = 'x;
	result[15] = 'x;
	result[16] = 'x;
	result[17] = 'x;
	result[18] = 'x;
	result[19] = 'x;
	result[20] = 'x;
	result[21] = 'x;
	result[22] = 'x;
	result[23] = 'x;
	result[24] = 'x;
	result[25] = 'x;
	result[26] = 'x;
	result[27] = 'x;
	result[28] = 'x;
	result[29] = 'x;
	result[30] = 'x;
	result[31] = 'x;
	result = fple_m_axis_result_tdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	fple_s_axis_a_tdata[0] = 'x;
	fple_s_axis_a_tdata[1] = 'x;
	fple_s_axis_a_tdata[2] = 'x;
	fple_s_axis_a_tdata[3] = 'x;
	fple_s_axis_a_tdata[4] = 'x;
	fple_s_axis_a_tdata[5] = 'x;
	fple_s_axis_a_tdata[6] = 'x;
	fple_s_axis_a_tdata[7] = 'x;
	fple_s_axis_a_tdata[8] = 'x;
	fple_s_axis_a_tdata[9] = 'x;
	fple_s_axis_a_tdata[10] = 'x;
	fple_s_axis_a_tdata[11] = 'x;
	fple_s_axis_a_tdata[12] = 'x;
	fple_s_axis_a_tdata[13] = 'x;
	fple_s_axis_a_tdata[14] = 'x;
	fple_s_axis_a_tdata[15] = 'x;
	fple_s_axis_a_tdata[16] = 'x;
	fple_s_axis_a_tdata[17] = 'x;
	fple_s_axis_a_tdata[18] = 'x;
	fple_s_axis_a_tdata[19] = 'x;
	fple_s_axis_a_tdata[20] = 'x;
	fple_s_axis_a_tdata[21] = 'x;
	fple_s_axis_a_tdata[22] = 'x;
	fple_s_axis_a_tdata[23] = 'x;
	fple_s_axis_a_tdata[24] = 'x;
	fple_s_axis_a_tdata[25] = 'x;
	fple_s_axis_a_tdata[26] = 'x;
	fple_s_axis_a_tdata[27] = 'x;
	fple_s_axis_a_tdata[28] = 'x;
	fple_s_axis_a_tdata[29] = 'x;
	fple_s_axis_a_tdata[30] = 'x;
	fple_s_axis_a_tdata[31] = 'x;
	fple_s_axis_a_tdata = value1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesis tool doesn't generate latches
	fple_s_axis_b_tdata[0] = 'x;
	fple_s_axis_b_tdata[1] = 'x;
	fple_s_axis_b_tdata[2] = 'x;
	fple_s_axis_b_tdata[3] = 'x;
	fple_s_axis_b_tdata[4] = 'x;
	fple_s_axis_b_tdata[5] = 'x;
	fple_s_axis_b_tdata[6] = 'x;
	fple_s_axis_b_tdata[7] = 'x;
	fple_s_axis_b_tdata[8] = 'x;
	fple_s_axis_b_tdata[9] = 'x;
	fple_s_axis_b_tdata[10] = 'x;
	fple_s_axis_b_tdata[11] = 'x;
	fple_s_axis_b_tdata[12] = 'x;
	fple_s_axis_b_tdata[13] = 'x;
	fple_s_axis_b_tdata[14] = 'x;
	fple_s_axis_b_tdata[15] = 'x;
	fple_s_axis_b_tdata[16] = 'x;
	fple_s_axis_b_tdata[17] = 'x;
	fple_s_axis_b_tdata[18] = 'x;
	fple_s_axis_b_tdata[19] = 'x;
	fple_s_axis_b_tdata[20] = 'x;
	fple_s_axis_b_tdata[21] = 'x;
	fple_s_axis_b_tdata[22] = 'x;
	fple_s_axis_b_tdata[23] = 'x;
	fple_s_axis_b_tdata[24] = 'x;
	fple_s_axis_b_tdata[25] = 'x;
	fple_s_axis_b_tdata[26] = 'x;
	fple_s_axis_b_tdata[27] = 'x;
	fple_s_axis_b_tdata[28] = 'x;
	fple_s_axis_b_tdata[29] = 'x;
	fple_s_axis_b_tdata[30] = 'x;
	fple_s_axis_b_tdata[31] = 'x;
	fple_s_axis_b_tdata = value2;
end
endmodule

// ::floating_point_0 #()
// Provided externally
// module floating_point_0___(
// 	input aclk,
// 	input wire [31:0] s_axis_a_tdata,
// 	input wire [31:0] s_axis_b_tdata,
// 	output /*mux_wire*/ logic [31:0] m_axis_result_tdata
// );
// 
// 
