// DO NOT EDIT THIS FILE
// This file was generated with SUS Compiler 0.1.1// ::fpMult
module fpMult(
	input clk,
	input wire [31:0] value1,
	input wire [31:0] value2,
	output /*mux_wire*/ logic [31:0] result
);

/*mux_wire*/ logic [31:0] fpm_s_axis_a_tdata;
/*mux_wire*/ logic [31:0] fpm_s_axis_b_tdata;
wire [31:0] fpm_m_axis_result_tdata;
floating_point_0 fpm(
	.clk(clk),
	.s_axis_a_tdata(fpm_s_axis_a_tdata),
	.s_axis_b_tdata(fpm_s_axis_b_tdata),
	.m_axis_result_tdata(fpm_m_axis_result_tdata)
);
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesys tool doesn't generate latches
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
	result = fpm_m_axis_result_tdata;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesys tool doesn't generate latches
	fpm_s_axis_a_tdata[0] = 'x;
	fpm_s_axis_a_tdata[1] = 'x;
	fpm_s_axis_a_tdata[2] = 'x;
	fpm_s_axis_a_tdata[3] = 'x;
	fpm_s_axis_a_tdata[4] = 'x;
	fpm_s_axis_a_tdata[5] = 'x;
	fpm_s_axis_a_tdata[6] = 'x;
	fpm_s_axis_a_tdata[7] = 'x;
	fpm_s_axis_a_tdata[8] = 'x;
	fpm_s_axis_a_tdata[9] = 'x;
	fpm_s_axis_a_tdata[10] = 'x;
	fpm_s_axis_a_tdata[11] = 'x;
	fpm_s_axis_a_tdata[12] = 'x;
	fpm_s_axis_a_tdata[13] = 'x;
	fpm_s_axis_a_tdata[14] = 'x;
	fpm_s_axis_a_tdata[15] = 'x;
	fpm_s_axis_a_tdata[16] = 'x;
	fpm_s_axis_a_tdata[17] = 'x;
	fpm_s_axis_a_tdata[18] = 'x;
	fpm_s_axis_a_tdata[19] = 'x;
	fpm_s_axis_a_tdata[20] = 'x;
	fpm_s_axis_a_tdata[21] = 'x;
	fpm_s_axis_a_tdata[22] = 'x;
	fpm_s_axis_a_tdata[23] = 'x;
	fpm_s_axis_a_tdata[24] = 'x;
	fpm_s_axis_a_tdata[25] = 'x;
	fpm_s_axis_a_tdata[26] = 'x;
	fpm_s_axis_a_tdata[27] = 'x;
	fpm_s_axis_a_tdata[28] = 'x;
	fpm_s_axis_a_tdata[29] = 'x;
	fpm_s_axis_a_tdata[30] = 'x;
	fpm_s_axis_a_tdata[31] = 'x;
	fpm_s_axis_a_tdata = value1;
end
always_comb begin
	// Combinatorial wires are not defined when not valid. This is just so that the synthesys tool doesn't generate latches
	fpm_s_axis_b_tdata[0] = 'x;
	fpm_s_axis_b_tdata[1] = 'x;
	fpm_s_axis_b_tdata[2] = 'x;
	fpm_s_axis_b_tdata[3] = 'x;
	fpm_s_axis_b_tdata[4] = 'x;
	fpm_s_axis_b_tdata[5] = 'x;
	fpm_s_axis_b_tdata[6] = 'x;
	fpm_s_axis_b_tdata[7] = 'x;
	fpm_s_axis_b_tdata[8] = 'x;
	fpm_s_axis_b_tdata[9] = 'x;
	fpm_s_axis_b_tdata[10] = 'x;
	fpm_s_axis_b_tdata[11] = 'x;
	fpm_s_axis_b_tdata[12] = 'x;
	fpm_s_axis_b_tdata[13] = 'x;
	fpm_s_axis_b_tdata[14] = 'x;
	fpm_s_axis_b_tdata[15] = 'x;
	fpm_s_axis_b_tdata[16] = 'x;
	fpm_s_axis_b_tdata[17] = 'x;
	fpm_s_axis_b_tdata[18] = 'x;
	fpm_s_axis_b_tdata[19] = 'x;
	fpm_s_axis_b_tdata[20] = 'x;
	fpm_s_axis_b_tdata[21] = 'x;
	fpm_s_axis_b_tdata[22] = 'x;
	fpm_s_axis_b_tdata[23] = 'x;
	fpm_s_axis_b_tdata[24] = 'x;
	fpm_s_axis_b_tdata[25] = 'x;
	fpm_s_axis_b_tdata[26] = 'x;
	fpm_s_axis_b_tdata[27] = 'x;
	fpm_s_axis_b_tdata[28] = 'x;
	fpm_s_axis_b_tdata[29] = 'x;
	fpm_s_axis_b_tdata[30] = 'x;
	fpm_s_axis_b_tdata[31] = 'x;
	fpm_s_axis_b_tdata = value2;
end
endmodule

// ::floating_point_0
// Provided externally
// module floating_point_0(
// 	input clk,
// 	input wire [31:0] s_axis_a_tdata,
// 	input wire [31:0] s_axis_b_tdata,
// 	output /*mux_wire*/ logic [31:0] m_axis_result_tdata
// );
