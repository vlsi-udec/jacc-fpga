`timescale 1ns / 1ps

module dist_wrapper (
	input logic [0:0] aclk,
	input logic [0:0] ap_start,
	input logic [0:0] areset,
	input logic [511:0] in_0s_tdata,
	output logic [0:0] in_0s_tready,
	input logic [0:0] in_0s_tvalid,
	input logic [127:0] in_pivots_tdata,
	output logic [0:0] in_pivots_tready,
	input logic [0:0] in_pivots_tvalid,
	output logic [511:0] m_tdata,
	input logic [0:0] m_tready,
	output logic [0:0] m_tvalid,
	output logic [31:0] mem_len,
	output logic [63:0] mem_ptr_0,
	output logic [0:0] mem_start,
	input logic [0:0] mem_start_ack,
	input logic [31:0] pivot_len,
	input logic [31:0] read_len,
	input logic [31:0] read_offset_0,
	input logic [63:0] read_ptr_0
);

logic [15:0] pivot_valid_d[7:0];
logic [8:0] mem_rd_idx[1:0];
logic [8:0] mem_wr_idx[1:0];
logic [127:0] mem_pivot_in[7:0];
logic [63:0] mem_pivot_low_out[15:0];
logic [63:0] mem_pivot_high_out[15:0];
logic [63:0] mem_pivot_l_0[511:0];
logic [63:0] mem_pivot_h_0[511:0];
logic [63:0] mem_pivot_l_1[511:0];
logic [63:0] mem_pivot_h_1[511:0];
logic [63:0] mem_pivot_l_2[511:0];
logic [63:0] mem_pivot_h_2[511:0];
logic [63:0] mem_pivot_l_3[511:0];
logic [63:0] mem_pivot_h_3[511:0];
logic [63:0] mem_pivot_l_4[511:0];
logic [63:0] mem_pivot_h_4[511:0];
logic [63:0] mem_pivot_l_5[511:0];
logic [63:0] mem_pivot_h_5[511:0];
logic [63:0] mem_pivot_l_6[511:0];
logic [63:0] mem_pivot_h_6[511:0];
logic [63:0] mem_pivot_l_7[511:0];
logic [63:0] mem_pivot_h_7[511:0];
logic [63:0] mem_pivot_l_8[511:0];
logic [63:0] mem_pivot_h_8[511:0];
logic [63:0] mem_pivot_l_9[511:0];
logic [63:0] mem_pivot_h_9[511:0];
logic [63:0] mem_pivot_l_10[511:0];
logic [63:0] mem_pivot_h_10[511:0];
logic [63:0] mem_pivot_l_11[511:0];
logic [63:0] mem_pivot_h_11[511:0];
logic [63:0] mem_pivot_l_12[511:0];
logic [63:0] mem_pivot_h_12[511:0];
logic [63:0] mem_pivot_l_13[511:0];
logic [63:0] mem_pivot_h_13[511:0];
logic [63:0] mem_pivot_l_14[511:0];
logic [63:0] mem_pivot_h_14[511:0];
logic [63:0] mem_pivot_l_15[511:0];
logic [63:0] mem_pivot_h_15[511:0];
logic [511:0] b_in_0_0[0:0];
logic [511:0] b_in_0_1[1:0];
logic [511:0] b_in_0_2[3:0];
logic [511:0] b_in_0_3[7:0];
logic [511:0] b_in_0_4[15:0];
logic [511:0] b_in_d_0_0[15:0];
logic [511:0] b_in_d_0_1[15:0];
logic [511:0] b_in_d_0_2[15:0];
logic [511:0] b_in_d_0_3[15:0];
logic [127:0] b_pivot_0[3:0];
logic [127:0] b_pivot_d_0[3:0];
logic [127:0] b_pivot_1[3:0];
logic [127:0] b_pivot_d_1[3:0];
logic [127:0] b_pivot_2[3:0];
logic [127:0] b_pivot_d_2[3:0];
logic [127:0] b_pivot_3[3:0];
logic [127:0] b_pivot_d_3[3:0];
logic [127:0] b_pivot_4[3:0];
logic [127:0] b_pivot_d_4[3:0];
logic [127:0] b_pivot_5[3:0];
logic [127:0] b_pivot_d_5[3:0];
logic [127:0] b_pivot_6[3:0];
logic [127:0] b_pivot_d_6[3:0];
logic [127:0] b_pivot_7[3:0];
logic [127:0] b_pivot_d_7[3:0];
logic [127:0] b_pivot_8[3:0];
logic [127:0] b_pivot_d_8[3:0];
logic [127:0] b_pivot_9[3:0];
logic [127:0] b_pivot_d_9[3:0];
logic [127:0] b_pivot_10[3:0];
logic [127:0] b_pivot_d_10[3:0];
logic [127:0] b_pivot_11[3:0];
logic [127:0] b_pivot_d_11[3:0];
logic [127:0] b_pivot_12[3:0];
logic [127:0] b_pivot_d_12[3:0];
logic [127:0] b_pivot_13[3:0];
logic [127:0] b_pivot_d_13[3:0];
logic [127:0] b_pivot_14[3:0];
logic [127:0] b_pivot_d_14[3:0];
logic [127:0] b_pivot_15[3:0];
logic [127:0] b_pivot_d_15[3:0];
logic [0:0] state = 1'd0;
logic [16:0] state_r = 17'd0;
logic [1:0] ap_start_ = 2'd0;
logic [0:0] krnl_start = 1'd0;
logic [0:0] mem_start_int = 1'd0;
logic [1:0] mem_start_b = 2'd0;
logic [0:0] read_start = 1'd0;
logic [15:0] pivot_valid = 16'd0;
logic [15:0] mem_wr = 16'd0;
logic [0:0] in_ready = 1'd0;
logic [0:0] in_valid;
logic [8:0] valid = 9'd0;
logic [31:0] input_cnt = 32'd0;
logic [8:0] sketch_cnt = 9'd0;
logic [0:0] busy_0_0_0;
logic [0:0] m_out_0_0_0m_tvalid;
logic [47:0] m_out_0_0_0m_tdata;
logic [0:0] m_out_0_0_0m_tready;
logic [0:0] busy_0_0_1;
logic [0:0] m_out_0_0_1m_tvalid;
logic [47:0] m_out_0_0_1m_tdata;
logic [0:0] m_out_0_0_1m_tready;
logic [0:0] busy_0_0_2;
logic [0:0] m_out_0_0_2m_tvalid;
logic [47:0] m_out_0_0_2m_tdata;
logic [0:0] m_out_0_0_2m_tready;
logic [0:0] busy_0_0_3;
logic [0:0] m_out_0_0_3m_tvalid;
logic [47:0] m_out_0_0_3m_tdata;
logic [0:0] m_out_0_0_3m_tready;
logic [0:0] busy_0_1_0;
logic [0:0] m_out_0_1_0m_tvalid;
logic [47:0] m_out_0_1_0m_tdata;
logic [0:0] m_out_0_1_0m_tready;
logic [0:0] busy_0_1_1;
logic [0:0] m_out_0_1_1m_tvalid;
logic [47:0] m_out_0_1_1m_tdata;
logic [0:0] m_out_0_1_1m_tready;
logic [0:0] busy_0_1_2;
logic [0:0] m_out_0_1_2m_tvalid;
logic [47:0] m_out_0_1_2m_tdata;
logic [0:0] m_out_0_1_2m_tready;
logic [0:0] busy_0_1_3;
logic [0:0] m_out_0_1_3m_tvalid;
logic [47:0] m_out_0_1_3m_tdata;
logic [0:0] m_out_0_1_3m_tready;
logic [0:0] busy_0_2_0;
logic [0:0] m_out_0_2_0m_tvalid;
logic [47:0] m_out_0_2_0m_tdata;
logic [0:0] m_out_0_2_0m_tready;
logic [0:0] busy_0_2_1;
logic [0:0] m_out_0_2_1m_tvalid;
logic [47:0] m_out_0_2_1m_tdata;
logic [0:0] m_out_0_2_1m_tready;
logic [0:0] busy_0_2_2;
logic [0:0] m_out_0_2_2m_tvalid;
logic [47:0] m_out_0_2_2m_tdata;
logic [0:0] m_out_0_2_2m_tready;
logic [0:0] busy_0_2_3;
logic [0:0] m_out_0_2_3m_tvalid;
logic [47:0] m_out_0_2_3m_tdata;
logic [0:0] m_out_0_2_3m_tready;
logic [0:0] busy_0_3_0;
logic [0:0] m_out_0_3_0m_tvalid;
logic [47:0] m_out_0_3_0m_tdata;
logic [0:0] m_out_0_3_0m_tready;
logic [0:0] busy_0_3_1;
logic [0:0] m_out_0_3_1m_tvalid;
logic [47:0] m_out_0_3_1m_tdata;
logic [0:0] m_out_0_3_1m_tready;
logic [0:0] busy_0_3_2;
logic [0:0] m_out_0_3_2m_tvalid;
logic [47:0] m_out_0_3_2m_tdata;
logic [0:0] m_out_0_3_2m_tready;
logic [0:0] busy_0_3_3;
logic [0:0] m_out_0_3_3m_tvalid;
logic [47:0] m_out_0_3_3m_tdata;
logic [0:0] m_out_0_3_3m_tready;
logic [0:0] busy_0_4_0;
logic [0:0] m_out_0_4_0m_tvalid;
logic [47:0] m_out_0_4_0m_tdata;
logic [0:0] m_out_0_4_0m_tready;
logic [0:0] busy_0_4_1;
logic [0:0] m_out_0_4_1m_tvalid;
logic [47:0] m_out_0_4_1m_tdata;
logic [0:0] m_out_0_4_1m_tready;
logic [0:0] busy_0_4_2;
logic [0:0] m_out_0_4_2m_tvalid;
logic [47:0] m_out_0_4_2m_tdata;
logic [0:0] m_out_0_4_2m_tready;
logic [0:0] busy_0_4_3;
logic [0:0] m_out_0_4_3m_tvalid;
logic [47:0] m_out_0_4_3m_tdata;
logic [0:0] m_out_0_4_3m_tready;
logic [0:0] busy_0_5_0;
logic [0:0] m_out_0_5_0m_tvalid;
logic [47:0] m_out_0_5_0m_tdata;
logic [0:0] m_out_0_5_0m_tready;
logic [0:0] busy_0_5_1;
logic [0:0] m_out_0_5_1m_tvalid;
logic [47:0] m_out_0_5_1m_tdata;
logic [0:0] m_out_0_5_1m_tready;
logic [0:0] busy_0_5_2;
logic [0:0] m_out_0_5_2m_tvalid;
logic [47:0] m_out_0_5_2m_tdata;
logic [0:0] m_out_0_5_2m_tready;
logic [0:0] busy_0_5_3;
logic [0:0] m_out_0_5_3m_tvalid;
logic [47:0] m_out_0_5_3m_tdata;
logic [0:0] m_out_0_5_3m_tready;
logic [0:0] busy_0_6_0;
logic [0:0] m_out_0_6_0m_tvalid;
logic [47:0] m_out_0_6_0m_tdata;
logic [0:0] m_out_0_6_0m_tready;
logic [0:0] busy_0_6_1;
logic [0:0] m_out_0_6_1m_tvalid;
logic [47:0] m_out_0_6_1m_tdata;
logic [0:0] m_out_0_6_1m_tready;
logic [0:0] busy_0_6_2;
logic [0:0] m_out_0_6_2m_tvalid;
logic [47:0] m_out_0_6_2m_tdata;
logic [0:0] m_out_0_6_2m_tready;
logic [0:0] busy_0_6_3;
logic [0:0] m_out_0_6_3m_tvalid;
logic [47:0] m_out_0_6_3m_tdata;
logic [0:0] m_out_0_6_3m_tready;
logic [0:0] busy_0_7_0;
logic [0:0] m_out_0_7_0m_tvalid;
logic [47:0] m_out_0_7_0m_tdata;
logic [0:0] m_out_0_7_0m_tready;
logic [0:0] busy_0_7_1;
logic [0:0] m_out_0_7_1m_tvalid;
logic [47:0] m_out_0_7_1m_tdata;
logic [0:0] m_out_0_7_1m_tready;
logic [0:0] busy_0_7_2;
logic [0:0] m_out_0_7_2m_tvalid;
logic [47:0] m_out_0_7_2m_tdata;
logic [0:0] m_out_0_7_2m_tready;
logic [0:0] busy_0_7_3;
logic [0:0] m_out_0_7_3m_tvalid;
logic [47:0] m_out_0_7_3m_tdata;
logic [0:0] m_out_0_7_3m_tready;
logic [0:0] busy_0_8_0;
logic [0:0] m_out_0_8_0m_tvalid;
logic [47:0] m_out_0_8_0m_tdata;
logic [0:0] m_out_0_8_0m_tready;
logic [0:0] busy_0_8_1;
logic [0:0] m_out_0_8_1m_tvalid;
logic [47:0] m_out_0_8_1m_tdata;
logic [0:0] m_out_0_8_1m_tready;
logic [0:0] busy_0_8_2;
logic [0:0] m_out_0_8_2m_tvalid;
logic [47:0] m_out_0_8_2m_tdata;
logic [0:0] m_out_0_8_2m_tready;
logic [0:0] busy_0_8_3;
logic [0:0] m_out_0_8_3m_tvalid;
logic [47:0] m_out_0_8_3m_tdata;
logic [0:0] m_out_0_8_3m_tready;
logic [0:0] busy_0_9_0;
logic [0:0] m_out_0_9_0m_tvalid;
logic [47:0] m_out_0_9_0m_tdata;
logic [0:0] m_out_0_9_0m_tready;
logic [0:0] busy_0_9_1;
logic [0:0] m_out_0_9_1m_tvalid;
logic [47:0] m_out_0_9_1m_tdata;
logic [0:0] m_out_0_9_1m_tready;
logic [0:0] busy_0_9_2;
logic [0:0] m_out_0_9_2m_tvalid;
logic [47:0] m_out_0_9_2m_tdata;
logic [0:0] m_out_0_9_2m_tready;
logic [0:0] busy_0_9_3;
logic [0:0] m_out_0_9_3m_tvalid;
logic [47:0] m_out_0_9_3m_tdata;
logic [0:0] m_out_0_9_3m_tready;
logic [0:0] busy_0_10_0;
logic [0:0] m_out_0_10_0m_tvalid;
logic [47:0] m_out_0_10_0m_tdata;
logic [0:0] m_out_0_10_0m_tready;
logic [0:0] busy_0_10_1;
logic [0:0] m_out_0_10_1m_tvalid;
logic [47:0] m_out_0_10_1m_tdata;
logic [0:0] m_out_0_10_1m_tready;
logic [0:0] busy_0_10_2;
logic [0:0] m_out_0_10_2m_tvalid;
logic [47:0] m_out_0_10_2m_tdata;
logic [0:0] m_out_0_10_2m_tready;
logic [0:0] busy_0_10_3;
logic [0:0] m_out_0_10_3m_tvalid;
logic [47:0] m_out_0_10_3m_tdata;
logic [0:0] m_out_0_10_3m_tready;
logic [0:0] busy_0_11_0;
logic [0:0] m_out_0_11_0m_tvalid;
logic [47:0] m_out_0_11_0m_tdata;
logic [0:0] m_out_0_11_0m_tready;
logic [0:0] busy_0_11_1;
logic [0:0] m_out_0_11_1m_tvalid;
logic [47:0] m_out_0_11_1m_tdata;
logic [0:0] m_out_0_11_1m_tready;
logic [0:0] busy_0_11_2;
logic [0:0] m_out_0_11_2m_tvalid;
logic [47:0] m_out_0_11_2m_tdata;
logic [0:0] m_out_0_11_2m_tready;
logic [0:0] busy_0_11_3;
logic [0:0] m_out_0_11_3m_tvalid;
logic [47:0] m_out_0_11_3m_tdata;
logic [0:0] m_out_0_11_3m_tready;
logic [0:0] busy_0_12_0;
logic [0:0] m_out_0_12_0m_tvalid;
logic [47:0] m_out_0_12_0m_tdata;
logic [0:0] m_out_0_12_0m_tready;
logic [0:0] busy_0_12_1;
logic [0:0] m_out_0_12_1m_tvalid;
logic [47:0] m_out_0_12_1m_tdata;
logic [0:0] m_out_0_12_1m_tready;
logic [0:0] busy_0_12_2;
logic [0:0] m_out_0_12_2m_tvalid;
logic [47:0] m_out_0_12_2m_tdata;
logic [0:0] m_out_0_12_2m_tready;
logic [0:0] busy_0_12_3;
logic [0:0] m_out_0_12_3m_tvalid;
logic [47:0] m_out_0_12_3m_tdata;
logic [0:0] m_out_0_12_3m_tready;
logic [0:0] busy_0_13_0;
logic [0:0] m_out_0_13_0m_tvalid;
logic [47:0] m_out_0_13_0m_tdata;
logic [0:0] m_out_0_13_0m_tready;
logic [0:0] busy_0_13_1;
logic [0:0] m_out_0_13_1m_tvalid;
logic [47:0] m_out_0_13_1m_tdata;
logic [0:0] m_out_0_13_1m_tready;
logic [0:0] busy_0_13_2;
logic [0:0] m_out_0_13_2m_tvalid;
logic [47:0] m_out_0_13_2m_tdata;
logic [0:0] m_out_0_13_2m_tready;
logic [0:0] busy_0_13_3;
logic [0:0] m_out_0_13_3m_tvalid;
logic [47:0] m_out_0_13_3m_tdata;
logic [0:0] m_out_0_13_3m_tready;
logic [0:0] busy_0_14_0;
logic [0:0] m_out_0_14_0m_tvalid;
logic [47:0] m_out_0_14_0m_tdata;
logic [0:0] m_out_0_14_0m_tready;
logic [0:0] busy_0_14_1;
logic [0:0] m_out_0_14_1m_tvalid;
logic [47:0] m_out_0_14_1m_tdata;
logic [0:0] m_out_0_14_1m_tready;
logic [0:0] busy_0_14_2;
logic [0:0] m_out_0_14_2m_tvalid;
logic [47:0] m_out_0_14_2m_tdata;
logic [0:0] m_out_0_14_2m_tready;
logic [0:0] busy_0_14_3;
logic [0:0] m_out_0_14_3m_tvalid;
logic [47:0] m_out_0_14_3m_tdata;
logic [0:0] m_out_0_14_3m_tready;
logic [0:0] busy_0_15_0;
logic [0:0] m_out_0_15_0m_tvalid;
logic [47:0] m_out_0_15_0m_tdata;
logic [0:0] m_out_0_15_0m_tready;
logic [0:0] busy_0_15_1;
logic [0:0] m_out_0_15_1m_tvalid;
logic [47:0] m_out_0_15_1m_tdata;
logic [0:0] m_out_0_15_1m_tready;
logic [0:0] busy_0_15_2;
logic [0:0] m_out_0_15_2m_tvalid;
logic [47:0] m_out_0_15_2m_tdata;
logic [0:0] m_out_0_15_2m_tready;
logic [0:0] busy_0_15_3;
logic [0:0] m_out_0_15_3m_tvalid;
logic [47:0] m_out_0_15_3m_tdata;
logic [0:0] m_out_0_15_3m_tready;
logic [63:0] m_out_0_0_0_full;
logic [63:0] m_out_0_0_1_full;
logic [63:0] m_out_0_0_2_full;
logic [63:0] m_out_0_0_3_full;
logic [63:0] m_out_0_1_0_full;
logic [63:0] m_out_0_1_1_full;
logic [63:0] m_out_0_1_2_full;
logic [63:0] m_out_0_1_3_full;
logic [63:0] m_out_0_2_0_full;
logic [63:0] m_out_0_2_1_full;
logic [63:0] m_out_0_2_2_full;
logic [63:0] m_out_0_2_3_full;
logic [63:0] m_out_0_3_0_full;
logic [63:0] m_out_0_3_1_full;
logic [63:0] m_out_0_3_2_full;
logic [63:0] m_out_0_3_3_full;
logic [63:0] m_out_0_4_0_full;
logic [63:0] m_out_0_4_1_full;
logic [63:0] m_out_0_4_2_full;
logic [63:0] m_out_0_4_3_full;
logic [63:0] m_out_0_5_0_full;
logic [63:0] m_out_0_5_1_full;
logic [63:0] m_out_0_5_2_full;
logic [63:0] m_out_0_5_3_full;
logic [63:0] m_out_0_6_0_full;
logic [63:0] m_out_0_6_1_full;
logic [63:0] m_out_0_6_2_full;
logic [63:0] m_out_0_6_3_full;
logic [63:0] m_out_0_7_0_full;
logic [63:0] m_out_0_7_1_full;
logic [63:0] m_out_0_7_2_full;
logic [63:0] m_out_0_7_3_full;
logic [63:0] m_out_0_8_0_full;
logic [63:0] m_out_0_8_1_full;
logic [63:0] m_out_0_8_2_full;
logic [63:0] m_out_0_8_3_full;
logic [63:0] m_out_0_9_0_full;
logic [63:0] m_out_0_9_1_full;
logic [63:0] m_out_0_9_2_full;
logic [63:0] m_out_0_9_3_full;
logic [63:0] m_out_0_10_0_full;
logic [63:0] m_out_0_10_1_full;
logic [63:0] m_out_0_10_2_full;
logic [63:0] m_out_0_10_3_full;
logic [63:0] m_out_0_11_0_full;
logic [63:0] m_out_0_11_1_full;
logic [63:0] m_out_0_11_2_full;
logic [63:0] m_out_0_11_3_full;
logic [63:0] m_out_0_12_0_full;
logic [63:0] m_out_0_12_1_full;
logic [63:0] m_out_0_12_2_full;
logic [63:0] m_out_0_12_3_full;
logic [63:0] m_out_0_13_0_full;
logic [63:0] m_out_0_13_1_full;
logic [63:0] m_out_0_13_2_full;
logic [63:0] m_out_0_13_3_full;
logic [63:0] m_out_0_14_0_full;
logic [63:0] m_out_0_14_1_full;
logic [63:0] m_out_0_14_2_full;
logic [63:0] m_out_0_14_3_full;
logic [63:0] m_out_0_15_0_full;
logic [63:0] m_out_0_15_1_full;
logic [63:0] m_out_0_15_2_full;
logic [63:0] m_out_0_15_3_full;

sketch_merge sketch_merge_inst0 (
	.a1 (b_in_d_0_3[0][127:0]),
	.a2 (b_pivot_d_0[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_0_0m_tdata),
	.m_tready (m_out_0_0_0m_tready),
	.m_tvalid (m_out_0_0_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][0])
);

sketch_merge sketch_merge_inst1 (
	.a1 (b_in_d_0_3[0][255:128]),
	.a2 (b_pivot_d_0[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_0_1m_tdata),
	.m_tready (m_out_0_0_1m_tready),
	.m_tvalid (m_out_0_0_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][0]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst2 (
	.a1 (b_in_d_0_3[0][383:256]),
	.a2 (b_pivot_d_0[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_0_2m_tdata),
	.m_tready (m_out_0_0_2m_tready),
	.m_tvalid (m_out_0_0_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][0]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst3 (
	.a1 (b_in_d_0_3[0][511:384]),
	.a2 (b_pivot_d_0[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_0_3m_tdata),
	.m_tready (m_out_0_0_3m_tready),
	.m_tvalid (m_out_0_0_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][0]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst4 (
	.a1 (b_in_d_0_3[1][127:0]),
	.a2 (b_pivot_d_1[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_1_0m_tdata),
	.m_tready (m_out_0_1_0m_tready),
	.m_tvalid (m_out_0_1_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][1])
);

sketch_merge sketch_merge_inst5 (
	.a1 (b_in_d_0_3[1][255:128]),
	.a2 (b_pivot_d_1[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_1_1m_tdata),
	.m_tready (m_out_0_1_1m_tready),
	.m_tvalid (m_out_0_1_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][1]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst6 (
	.a1 (b_in_d_0_3[1][383:256]),
	.a2 (b_pivot_d_1[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_1_2m_tdata),
	.m_tready (m_out_0_1_2m_tready),
	.m_tvalid (m_out_0_1_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][1]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst7 (
	.a1 (b_in_d_0_3[1][511:384]),
	.a2 (b_pivot_d_1[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_1_3m_tdata),
	.m_tready (m_out_0_1_3m_tready),
	.m_tvalid (m_out_0_1_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][1]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst8 (
	.a1 (b_in_d_0_3[2][127:0]),
	.a2 (b_pivot_d_2[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_2_0m_tdata),
	.m_tready (m_out_0_2_0m_tready),
	.m_tvalid (m_out_0_2_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][2])
);

sketch_merge sketch_merge_inst9 (
	.a1 (b_in_d_0_3[2][255:128]),
	.a2 (b_pivot_d_2[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_2_1m_tdata),
	.m_tready (m_out_0_2_1m_tready),
	.m_tvalid (m_out_0_2_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][2]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst10 (
	.a1 (b_in_d_0_3[2][383:256]),
	.a2 (b_pivot_d_2[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_2_2m_tdata),
	.m_tready (m_out_0_2_2m_tready),
	.m_tvalid (m_out_0_2_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][2]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst11 (
	.a1 (b_in_d_0_3[2][511:384]),
	.a2 (b_pivot_d_2[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_2_3m_tdata),
	.m_tready (m_out_0_2_3m_tready),
	.m_tvalid (m_out_0_2_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][2]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst12 (
	.a1 (b_in_d_0_3[3][127:0]),
	.a2 (b_pivot_d_3[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_3_0m_tdata),
	.m_tready (m_out_0_3_0m_tready),
	.m_tvalid (m_out_0_3_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][3])
);

sketch_merge sketch_merge_inst13 (
	.a1 (b_in_d_0_3[3][255:128]),
	.a2 (b_pivot_d_3[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_3_1m_tdata),
	.m_tready (m_out_0_3_1m_tready),
	.m_tvalid (m_out_0_3_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][3]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst14 (
	.a1 (b_in_d_0_3[3][383:256]),
	.a2 (b_pivot_d_3[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_3_2m_tdata),
	.m_tready (m_out_0_3_2m_tready),
	.m_tvalid (m_out_0_3_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][3]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst15 (
	.a1 (b_in_d_0_3[3][511:384]),
	.a2 (b_pivot_d_3[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_3_3m_tdata),
	.m_tready (m_out_0_3_3m_tready),
	.m_tvalid (m_out_0_3_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][3]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst16 (
	.a1 (b_in_d_0_3[4][127:0]),
	.a2 (b_pivot_d_4[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_4_0m_tdata),
	.m_tready (m_out_0_4_0m_tready),
	.m_tvalid (m_out_0_4_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][4])
);

sketch_merge sketch_merge_inst17 (
	.a1 (b_in_d_0_3[4][255:128]),
	.a2 (b_pivot_d_4[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_4_1m_tdata),
	.m_tready (m_out_0_4_1m_tready),
	.m_tvalid (m_out_0_4_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][4]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst18 (
	.a1 (b_in_d_0_3[4][383:256]),
	.a2 (b_pivot_d_4[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_4_2m_tdata),
	.m_tready (m_out_0_4_2m_tready),
	.m_tvalid (m_out_0_4_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][4]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst19 (
	.a1 (b_in_d_0_3[4][511:384]),
	.a2 (b_pivot_d_4[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_4_3m_tdata),
	.m_tready (m_out_0_4_3m_tready),
	.m_tvalid (m_out_0_4_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][4]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst20 (
	.a1 (b_in_d_0_3[5][127:0]),
	.a2 (b_pivot_d_5[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_5_0m_tdata),
	.m_tready (m_out_0_5_0m_tready),
	.m_tvalid (m_out_0_5_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][5])
);

sketch_merge sketch_merge_inst21 (
	.a1 (b_in_d_0_3[5][255:128]),
	.a2 (b_pivot_d_5[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_5_1m_tdata),
	.m_tready (m_out_0_5_1m_tready),
	.m_tvalid (m_out_0_5_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][5]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst22 (
	.a1 (b_in_d_0_3[5][383:256]),
	.a2 (b_pivot_d_5[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_5_2m_tdata),
	.m_tready (m_out_0_5_2m_tready),
	.m_tvalid (m_out_0_5_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][5]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst23 (
	.a1 (b_in_d_0_3[5][511:384]),
	.a2 (b_pivot_d_5[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_5_3m_tdata),
	.m_tready (m_out_0_5_3m_tready),
	.m_tvalid (m_out_0_5_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][5]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst24 (
	.a1 (b_in_d_0_3[6][127:0]),
	.a2 (b_pivot_d_6[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_6_0m_tdata),
	.m_tready (m_out_0_6_0m_tready),
	.m_tvalid (m_out_0_6_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][6])
);

sketch_merge sketch_merge_inst25 (
	.a1 (b_in_d_0_3[6][255:128]),
	.a2 (b_pivot_d_6[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_6_1m_tdata),
	.m_tready (m_out_0_6_1m_tready),
	.m_tvalid (m_out_0_6_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][6]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst26 (
	.a1 (b_in_d_0_3[6][383:256]),
	.a2 (b_pivot_d_6[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_6_2m_tdata),
	.m_tready (m_out_0_6_2m_tready),
	.m_tvalid (m_out_0_6_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][6]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst27 (
	.a1 (b_in_d_0_3[6][511:384]),
	.a2 (b_pivot_d_6[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_6_3m_tdata),
	.m_tready (m_out_0_6_3m_tready),
	.m_tvalid (m_out_0_6_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][6]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst28 (
	.a1 (b_in_d_0_3[7][127:0]),
	.a2 (b_pivot_d_7[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_7_0m_tdata),
	.m_tready (m_out_0_7_0m_tready),
	.m_tvalid (m_out_0_7_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][7])
);

sketch_merge sketch_merge_inst29 (
	.a1 (b_in_d_0_3[7][255:128]),
	.a2 (b_pivot_d_7[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_7_1m_tdata),
	.m_tready (m_out_0_7_1m_tready),
	.m_tvalid (m_out_0_7_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][7]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst30 (
	.a1 (b_in_d_0_3[7][383:256]),
	.a2 (b_pivot_d_7[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_7_2m_tdata),
	.m_tready (m_out_0_7_2m_tready),
	.m_tvalid (m_out_0_7_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][7]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst31 (
	.a1 (b_in_d_0_3[7][511:384]),
	.a2 (b_pivot_d_7[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_7_3m_tdata),
	.m_tready (m_out_0_7_3m_tready),
	.m_tvalid (m_out_0_7_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][7]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst32 (
	.a1 (b_in_d_0_3[8][127:0]),
	.a2 (b_pivot_d_8[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_8_0m_tdata),
	.m_tready (m_out_0_8_0m_tready),
	.m_tvalid (m_out_0_8_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][8])
);

sketch_merge sketch_merge_inst33 (
	.a1 (b_in_d_0_3[8][255:128]),
	.a2 (b_pivot_d_8[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_8_1m_tdata),
	.m_tready (m_out_0_8_1m_tready),
	.m_tvalid (m_out_0_8_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][8]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst34 (
	.a1 (b_in_d_0_3[8][383:256]),
	.a2 (b_pivot_d_8[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_8_2m_tdata),
	.m_tready (m_out_0_8_2m_tready),
	.m_tvalid (m_out_0_8_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][8]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst35 (
	.a1 (b_in_d_0_3[8][511:384]),
	.a2 (b_pivot_d_8[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_8_3m_tdata),
	.m_tready (m_out_0_8_3m_tready),
	.m_tvalid (m_out_0_8_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][8]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst36 (
	.a1 (b_in_d_0_3[9][127:0]),
	.a2 (b_pivot_d_9[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_9_0m_tdata),
	.m_tready (m_out_0_9_0m_tready),
	.m_tvalid (m_out_0_9_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][9])
);

sketch_merge sketch_merge_inst37 (
	.a1 (b_in_d_0_3[9][255:128]),
	.a2 (b_pivot_d_9[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_9_1m_tdata),
	.m_tready (m_out_0_9_1m_tready),
	.m_tvalid (m_out_0_9_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][9]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst38 (
	.a1 (b_in_d_0_3[9][383:256]),
	.a2 (b_pivot_d_9[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_9_2m_tdata),
	.m_tready (m_out_0_9_2m_tready),
	.m_tvalid (m_out_0_9_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][9]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst39 (
	.a1 (b_in_d_0_3[9][511:384]),
	.a2 (b_pivot_d_9[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_9_3m_tdata),
	.m_tready (m_out_0_9_3m_tready),
	.m_tvalid (m_out_0_9_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][9]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst40 (
	.a1 (b_in_d_0_3[10][127:0]),
	.a2 (b_pivot_d_10[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_10_0m_tdata),
	.m_tready (m_out_0_10_0m_tready),
	.m_tvalid (m_out_0_10_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][10])
);

sketch_merge sketch_merge_inst41 (
	.a1 (b_in_d_0_3[10][255:128]),
	.a2 (b_pivot_d_10[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_10_1m_tdata),
	.m_tready (m_out_0_10_1m_tready),
	.m_tvalid (m_out_0_10_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][10]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst42 (
	.a1 (b_in_d_0_3[10][383:256]),
	.a2 (b_pivot_d_10[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_10_2m_tdata),
	.m_tready (m_out_0_10_2m_tready),
	.m_tvalid (m_out_0_10_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][10]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst43 (
	.a1 (b_in_d_0_3[10][511:384]),
	.a2 (b_pivot_d_10[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_10_3m_tdata),
	.m_tready (m_out_0_10_3m_tready),
	.m_tvalid (m_out_0_10_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][10]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst44 (
	.a1 (b_in_d_0_3[11][127:0]),
	.a2 (b_pivot_d_11[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_11_0m_tdata),
	.m_tready (m_out_0_11_0m_tready),
	.m_tvalid (m_out_0_11_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][11])
);

sketch_merge sketch_merge_inst45 (
	.a1 (b_in_d_0_3[11][255:128]),
	.a2 (b_pivot_d_11[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_11_1m_tdata),
	.m_tready (m_out_0_11_1m_tready),
	.m_tvalid (m_out_0_11_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][11]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst46 (
	.a1 (b_in_d_0_3[11][383:256]),
	.a2 (b_pivot_d_11[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_11_2m_tdata),
	.m_tready (m_out_0_11_2m_tready),
	.m_tvalid (m_out_0_11_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][11]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst47 (
	.a1 (b_in_d_0_3[11][511:384]),
	.a2 (b_pivot_d_11[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_11_3m_tdata),
	.m_tready (m_out_0_11_3m_tready),
	.m_tvalid (m_out_0_11_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][11]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst48 (
	.a1 (b_in_d_0_3[12][127:0]),
	.a2 (b_pivot_d_12[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_12_0m_tdata),
	.m_tready (m_out_0_12_0m_tready),
	.m_tvalid (m_out_0_12_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][12])
);

sketch_merge sketch_merge_inst49 (
	.a1 (b_in_d_0_3[12][255:128]),
	.a2 (b_pivot_d_12[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_12_1m_tdata),
	.m_tready (m_out_0_12_1m_tready),
	.m_tvalid (m_out_0_12_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][12]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst50 (
	.a1 (b_in_d_0_3[12][383:256]),
	.a2 (b_pivot_d_12[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_12_2m_tdata),
	.m_tready (m_out_0_12_2m_tready),
	.m_tvalid (m_out_0_12_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][12]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst51 (
	.a1 (b_in_d_0_3[12][511:384]),
	.a2 (b_pivot_d_12[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_12_3m_tdata),
	.m_tready (m_out_0_12_3m_tready),
	.m_tvalid (m_out_0_12_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][12]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst52 (
	.a1 (b_in_d_0_3[13][127:0]),
	.a2 (b_pivot_d_13[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_13_0m_tdata),
	.m_tready (m_out_0_13_0m_tready),
	.m_tvalid (m_out_0_13_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][13])
);

sketch_merge sketch_merge_inst53 (
	.a1 (b_in_d_0_3[13][255:128]),
	.a2 (b_pivot_d_13[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_13_1m_tdata),
	.m_tready (m_out_0_13_1m_tready),
	.m_tvalid (m_out_0_13_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][13]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst54 (
	.a1 (b_in_d_0_3[13][383:256]),
	.a2 (b_pivot_d_13[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_13_2m_tdata),
	.m_tready (m_out_0_13_2m_tready),
	.m_tvalid (m_out_0_13_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][13]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst55 (
	.a1 (b_in_d_0_3[13][511:384]),
	.a2 (b_pivot_d_13[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_13_3m_tdata),
	.m_tready (m_out_0_13_3m_tready),
	.m_tvalid (m_out_0_13_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][13]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst56 (
	.a1 (b_in_d_0_3[14][127:0]),
	.a2 (b_pivot_d_14[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_14_0m_tdata),
	.m_tready (m_out_0_14_0m_tready),
	.m_tvalid (m_out_0_14_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][14])
);

sketch_merge sketch_merge_inst57 (
	.a1 (b_in_d_0_3[14][255:128]),
	.a2 (b_pivot_d_14[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_14_1m_tdata),
	.m_tready (m_out_0_14_1m_tready),
	.m_tvalid (m_out_0_14_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][14]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst58 (
	.a1 (b_in_d_0_3[14][383:256]),
	.a2 (b_pivot_d_14[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_14_2m_tdata),
	.m_tready (m_out_0_14_2m_tready),
	.m_tvalid (m_out_0_14_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][14]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst59 (
	.a1 (b_in_d_0_3[14][511:384]),
	.a2 (b_pivot_d_14[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_14_3m_tdata),
	.m_tready (m_out_0_14_3m_tready),
	.m_tvalid (m_out_0_14_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][14]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst60 (
	.a1 (b_in_d_0_3[15][127:0]),
	.a2 (b_pivot_d_15[0]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_15_0m_tdata),
	.m_tready (m_out_0_15_0m_tready),
	.m_tvalid (m_out_0_15_0m_tvalid),
	.valid (valid[8] & pivot_valid_d[7][15])
);

sketch_merge sketch_merge_inst61 (
	.a1 (b_in_d_0_3[15][255:128]),
	.a2 (b_pivot_d_15[1]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_15_1m_tdata),
	.m_tready (m_out_0_15_1m_tready),
	.m_tvalid (m_out_0_15_1m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][15]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst62 (
	.a1 (b_in_d_0_3[15][383:256]),
	.a2 (b_pivot_d_15[2]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_15_2m_tdata),
	.m_tready (m_out_0_15_2m_tready),
	.m_tvalid (m_out_0_15_2m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][15]) & (state_r[16] == 1'd1))
);

sketch_merge sketch_merge_inst63 (
	.a1 (b_in_d_0_3[15][511:384]),
	.a2 (b_pivot_d_15[3]),
	.aclk (aclk),
	.areset (areset),
	.m_tdata (m_out_0_15_3m_tdata),
	.m_tready (m_out_0_15_3m_tready),
	.m_tvalid (m_out_0_15_3m_tvalid),
	.valid ((valid[8] & pivot_valid_d[7][15]) & (state_r[16] == 1'd1))
);

gateway gateway_inst64 (
	.aclk (aclk),
	.in_0s_tdata (m_out_0_0_0_full),
	.in_0s_tready (m_out_0_0_0m_tready),
	.in_0s_tvalid (m_out_0_0_0m_tvalid),
	.in_10s_tdata (m_out_0_2_2_full),
	.in_10s_tready (m_out_0_2_2m_tready),
	.in_10s_tvalid (m_out_0_2_2m_tvalid),
	.in_11s_tdata (m_out_0_2_3_full),
	.in_11s_tready (m_out_0_2_3m_tready),
	.in_11s_tvalid (m_out_0_2_3m_tvalid),
	.in_12s_tdata (m_out_0_3_0_full),
	.in_12s_tready (m_out_0_3_0m_tready),
	.in_12s_tvalid (m_out_0_3_0m_tvalid),
	.in_13s_tdata (m_out_0_3_1_full),
	.in_13s_tready (m_out_0_3_1m_tready),
	.in_13s_tvalid (m_out_0_3_1m_tvalid),
	.in_14s_tdata (m_out_0_3_2_full),
	.in_14s_tready (m_out_0_3_2m_tready),
	.in_14s_tvalid (m_out_0_3_2m_tvalid),
	.in_15s_tdata (m_out_0_3_3_full),
	.in_15s_tready (m_out_0_3_3m_tready),
	.in_15s_tvalid (m_out_0_3_3m_tvalid),
	.in_16s_tdata (m_out_0_4_0_full),
	.in_16s_tready (m_out_0_4_0m_tready),
	.in_16s_tvalid (m_out_0_4_0m_tvalid),
	.in_17s_tdata (m_out_0_4_1_full),
	.in_17s_tready (m_out_0_4_1m_tready),
	.in_17s_tvalid (m_out_0_4_1m_tvalid),
	.in_18s_tdata (m_out_0_4_2_full),
	.in_18s_tready (m_out_0_4_2m_tready),
	.in_18s_tvalid (m_out_0_4_2m_tvalid),
	.in_19s_tdata (m_out_0_4_3_full),
	.in_19s_tready (m_out_0_4_3m_tready),
	.in_19s_tvalid (m_out_0_4_3m_tvalid),
	.in_1s_tdata (m_out_0_0_1_full),
	.in_1s_tready (m_out_0_0_1m_tready),
	.in_1s_tvalid (m_out_0_0_1m_tvalid),
	.in_20s_tdata (m_out_0_5_0_full),
	.in_20s_tready (m_out_0_5_0m_tready),
	.in_20s_tvalid (m_out_0_5_0m_tvalid),
	.in_21s_tdata (m_out_0_5_1_full),
	.in_21s_tready (m_out_0_5_1m_tready),
	.in_21s_tvalid (m_out_0_5_1m_tvalid),
	.in_22s_tdata (m_out_0_5_2_full),
	.in_22s_tready (m_out_0_5_2m_tready),
	.in_22s_tvalid (m_out_0_5_2m_tvalid),
	.in_23s_tdata (m_out_0_5_3_full),
	.in_23s_tready (m_out_0_5_3m_tready),
	.in_23s_tvalid (m_out_0_5_3m_tvalid),
	.in_24s_tdata (m_out_0_6_0_full),
	.in_24s_tready (m_out_0_6_0m_tready),
	.in_24s_tvalid (m_out_0_6_0m_tvalid),
	.in_25s_tdata (m_out_0_6_1_full),
	.in_25s_tready (m_out_0_6_1m_tready),
	.in_25s_tvalid (m_out_0_6_1m_tvalid),
	.in_26s_tdata (m_out_0_6_2_full),
	.in_26s_tready (m_out_0_6_2m_tready),
	.in_26s_tvalid (m_out_0_6_2m_tvalid),
	.in_27s_tdata (m_out_0_6_3_full),
	.in_27s_tready (m_out_0_6_3m_tready),
	.in_27s_tvalid (m_out_0_6_3m_tvalid),
	.in_28s_tdata (m_out_0_7_0_full),
	.in_28s_tready (m_out_0_7_0m_tready),
	.in_28s_tvalid (m_out_0_7_0m_tvalid),
	.in_29s_tdata (m_out_0_7_1_full),
	.in_29s_tready (m_out_0_7_1m_tready),
	.in_29s_tvalid (m_out_0_7_1m_tvalid),
	.in_2s_tdata (m_out_0_0_2_full),
	.in_2s_tready (m_out_0_0_2m_tready),
	.in_2s_tvalid (m_out_0_0_2m_tvalid),
	.in_30s_tdata (m_out_0_7_2_full),
	.in_30s_tready (m_out_0_7_2m_tready),
	.in_30s_tvalid (m_out_0_7_2m_tvalid),
	.in_31s_tdata (m_out_0_7_3_full),
	.in_31s_tready (m_out_0_7_3m_tready),
	.in_31s_tvalid (m_out_0_7_3m_tvalid),
	.in_32s_tdata (m_out_0_8_0_full),
	.in_32s_tready (m_out_0_8_0m_tready),
	.in_32s_tvalid (m_out_0_8_0m_tvalid),
	.in_33s_tdata (m_out_0_8_1_full),
	.in_33s_tready (m_out_0_8_1m_tready),
	.in_33s_tvalid (m_out_0_8_1m_tvalid),
	.in_34s_tdata (m_out_0_8_2_full),
	.in_34s_tready (m_out_0_8_2m_tready),
	.in_34s_tvalid (m_out_0_8_2m_tvalid),
	.in_35s_tdata (m_out_0_8_3_full),
	.in_35s_tready (m_out_0_8_3m_tready),
	.in_35s_tvalid (m_out_0_8_3m_tvalid),
	.in_36s_tdata (m_out_0_9_0_full),
	.in_36s_tready (m_out_0_9_0m_tready),
	.in_36s_tvalid (m_out_0_9_0m_tvalid),
	.in_37s_tdata (m_out_0_9_1_full),
	.in_37s_tready (m_out_0_9_1m_tready),
	.in_37s_tvalid (m_out_0_9_1m_tvalid),
	.in_38s_tdata (m_out_0_9_2_full),
	.in_38s_tready (m_out_0_9_2m_tready),
	.in_38s_tvalid (m_out_0_9_2m_tvalid),
	.in_39s_tdata (m_out_0_9_3_full),
	.in_39s_tready (m_out_0_9_3m_tready),
	.in_39s_tvalid (m_out_0_9_3m_tvalid),
	.in_3s_tdata (m_out_0_0_3_full),
	.in_3s_tready (m_out_0_0_3m_tready),
	.in_3s_tvalid (m_out_0_0_3m_tvalid),
	.in_40s_tdata (m_out_0_10_0_full),
	.in_40s_tready (m_out_0_10_0m_tready),
	.in_40s_tvalid (m_out_0_10_0m_tvalid),
	.in_41s_tdata (m_out_0_10_1_full),
	.in_41s_tready (m_out_0_10_1m_tready),
	.in_41s_tvalid (m_out_0_10_1m_tvalid),
	.in_42s_tdata (m_out_0_10_2_full),
	.in_42s_tready (m_out_0_10_2m_tready),
	.in_42s_tvalid (m_out_0_10_2m_tvalid),
	.in_43s_tdata (m_out_0_10_3_full),
	.in_43s_tready (m_out_0_10_3m_tready),
	.in_43s_tvalid (m_out_0_10_3m_tvalid),
	.in_44s_tdata (m_out_0_11_0_full),
	.in_44s_tready (m_out_0_11_0m_tready),
	.in_44s_tvalid (m_out_0_11_0m_tvalid),
	.in_45s_tdata (m_out_0_11_1_full),
	.in_45s_tready (m_out_0_11_1m_tready),
	.in_45s_tvalid (m_out_0_11_1m_tvalid),
	.in_46s_tdata (m_out_0_11_2_full),
	.in_46s_tready (m_out_0_11_2m_tready),
	.in_46s_tvalid (m_out_0_11_2m_tvalid),
	.in_47s_tdata (m_out_0_11_3_full),
	.in_47s_tready (m_out_0_11_3m_tready),
	.in_47s_tvalid (m_out_0_11_3m_tvalid),
	.in_48s_tdata (m_out_0_12_0_full),
	.in_48s_tready (m_out_0_12_0m_tready),
	.in_48s_tvalid (m_out_0_12_0m_tvalid),
	.in_49s_tdata (m_out_0_12_1_full),
	.in_49s_tready (m_out_0_12_1m_tready),
	.in_49s_tvalid (m_out_0_12_1m_tvalid),
	.in_4s_tdata (m_out_0_1_0_full),
	.in_4s_tready (m_out_0_1_0m_tready),
	.in_4s_tvalid (m_out_0_1_0m_tvalid),
	.in_50s_tdata (m_out_0_12_2_full),
	.in_50s_tready (m_out_0_12_2m_tready),
	.in_50s_tvalid (m_out_0_12_2m_tvalid),
	.in_51s_tdata (m_out_0_12_3_full),
	.in_51s_tready (m_out_0_12_3m_tready),
	.in_51s_tvalid (m_out_0_12_3m_tvalid),
	.in_52s_tdata (m_out_0_13_0_full),
	.in_52s_tready (m_out_0_13_0m_tready),
	.in_52s_tvalid (m_out_0_13_0m_tvalid),
	.in_53s_tdata (m_out_0_13_1_full),
	.in_53s_tready (m_out_0_13_1m_tready),
	.in_53s_tvalid (m_out_0_13_1m_tvalid),
	.in_54s_tdata (m_out_0_13_2_full),
	.in_54s_tready (m_out_0_13_2m_tready),
	.in_54s_tvalid (m_out_0_13_2m_tvalid),
	.in_55s_tdata (m_out_0_13_3_full),
	.in_55s_tready (m_out_0_13_3m_tready),
	.in_55s_tvalid (m_out_0_13_3m_tvalid),
	.in_56s_tdata (m_out_0_14_0_full),
	.in_56s_tready (m_out_0_14_0m_tready),
	.in_56s_tvalid (m_out_0_14_0m_tvalid),
	.in_57s_tdata (m_out_0_14_1_full),
	.in_57s_tready (m_out_0_14_1m_tready),
	.in_57s_tvalid (m_out_0_14_1m_tvalid),
	.in_58s_tdata (m_out_0_14_2_full),
	.in_58s_tready (m_out_0_14_2m_tready),
	.in_58s_tvalid (m_out_0_14_2m_tvalid),
	.in_59s_tdata (m_out_0_14_3_full),
	.in_59s_tready (m_out_0_14_3m_tready),
	.in_59s_tvalid (m_out_0_14_3m_tvalid),
	.in_5s_tdata (m_out_0_1_1_full),
	.in_5s_tready (m_out_0_1_1m_tready),
	.in_5s_tvalid (m_out_0_1_1m_tvalid),
	.in_60s_tdata (m_out_0_15_0_full),
	.in_60s_tready (m_out_0_15_0m_tready),
	.in_60s_tvalid (m_out_0_15_0m_tvalid),
	.in_61s_tdata (m_out_0_15_1_full),
	.in_61s_tready (m_out_0_15_1m_tready),
	.in_61s_tvalid (m_out_0_15_1m_tvalid),
	.in_62s_tdata (m_out_0_15_2_full),
	.in_62s_tready (m_out_0_15_2m_tready),
	.in_62s_tvalid (m_out_0_15_2m_tvalid),
	.in_63s_tdata (m_out_0_15_3_full),
	.in_63s_tready (m_out_0_15_3m_tready),
	.in_63s_tvalid (m_out_0_15_3m_tvalid),
	.in_6s_tdata (m_out_0_1_2_full),
	.in_6s_tready (m_out_0_1_2m_tready),
	.in_6s_tvalid (m_out_0_1_2m_tvalid),
	.in_7s_tdata (m_out_0_1_3_full),
	.in_7s_tready (m_out_0_1_3m_tready),
	.in_7s_tvalid (m_out_0_1_3m_tvalid),
	.in_8s_tdata (m_out_0_2_0_full),
	.in_8s_tready (m_out_0_2_0m_tready),
	.in_8s_tvalid (m_out_0_2_0m_tvalid),
	.in_9s_tdata (m_out_0_2_1_full),
	.in_9s_tready (m_out_0_2_1m_tready),
	.in_9s_tvalid (m_out_0_2_1m_tvalid),
	.m_tdata (m_tdata),
	.m_tready (m_tready),
	.m_tvalid (m_tvalid)
);

always_ff @(posedge aclk) begin
	ap_start_[0] <= ap_start;
	ap_start_[1] <= ap_start_[0];

	if (ap_start_[1] & (! ap_start_[0])) begin
		krnl_start <= 1'd1;
	end
	else begin
		krnl_start <= 1'd0;
	end
end

always_comb begin
	mem_start = mem_start_int;
end

always_ff @(posedge aclk) begin
	read_start <= (! state_r[0]) & state;

	if (read_start) begin
		mem_ptr_0 <= read_ptr_0 + read_offset_0;
		mem_len <= read_len * 32'd512;
		mem_start_b <= 2'd1;
	end
	else begin
		mem_start_b <= {mem_start_b[0], 1'd0};
	end

	if (mem_start_b[1]) begin

		if (state == 1'd1) begin
			mem_start_int <= 1'd1;
		end
	end
	else if (mem_start_ack) begin
		mem_start_int <= 1'd0;
	end
end

always_ff @(posedge aclk) begin
	pivot_valid_d[0] <= pivot_valid;
	pivot_valid_d[1] <= pivot_valid_d[0];
	pivot_valid_d[2] <= pivot_valid_d[1];
	pivot_valid_d[3] <= pivot_valid_d[2];
	pivot_valid_d[4] <= pivot_valid_d[3];
	pivot_valid_d[5] <= pivot_valid_d[4];
	pivot_valid_d[6] <= pivot_valid_d[5];
	pivot_valid_d[7] <= pivot_valid_d[6];

	if (mem_wr[0]) begin
		mem_pivot_h_0[mem_wr_idx[0]] <= mem_pivot_in[0][127:64];
		mem_pivot_l_0[mem_wr_idx[0]] <= mem_pivot_in[0][63:0];
	end

	if (mem_wr[1]) begin
		mem_pivot_h_1[mem_wr_idx[0]] <= mem_pivot_in[0][127:64];
		mem_pivot_l_1[mem_wr_idx[0]] <= mem_pivot_in[0][63:0];
	end

	if (mem_wr[2]) begin
		mem_pivot_h_2[mem_wr_idx[0]] <= mem_pivot_in[1][127:64];
		mem_pivot_l_2[mem_wr_idx[0]] <= mem_pivot_in[1][63:0];
	end

	if (mem_wr[3]) begin
		mem_pivot_h_3[mem_wr_idx[0]] <= mem_pivot_in[1][127:64];
		mem_pivot_l_3[mem_wr_idx[0]] <= mem_pivot_in[1][63:0];
	end

	if (mem_wr[4]) begin
		mem_pivot_h_4[mem_wr_idx[0]] <= mem_pivot_in[2][127:64];
		mem_pivot_l_4[mem_wr_idx[0]] <= mem_pivot_in[2][63:0];
	end

	if (mem_wr[5]) begin
		mem_pivot_h_5[mem_wr_idx[0]] <= mem_pivot_in[2][127:64];
		mem_pivot_l_5[mem_wr_idx[0]] <= mem_pivot_in[2][63:0];
	end

	if (mem_wr[6]) begin
		mem_pivot_h_6[mem_wr_idx[0]] <= mem_pivot_in[3][127:64];
		mem_pivot_l_6[mem_wr_idx[0]] <= mem_pivot_in[3][63:0];
	end

	if (mem_wr[7]) begin
		mem_pivot_h_7[mem_wr_idx[0]] <= mem_pivot_in[3][127:64];
		mem_pivot_l_7[mem_wr_idx[0]] <= mem_pivot_in[3][63:0];
	end

	if (mem_wr[8]) begin
		mem_pivot_h_8[mem_wr_idx[1]] <= mem_pivot_in[4][127:64];
		mem_pivot_l_8[mem_wr_idx[1]] <= mem_pivot_in[4][63:0];
	end

	if (mem_wr[9]) begin
		mem_pivot_h_9[mem_wr_idx[1]] <= mem_pivot_in[4][127:64];
		mem_pivot_l_9[mem_wr_idx[1]] <= mem_pivot_in[4][63:0];
	end

	if (mem_wr[10]) begin
		mem_pivot_h_10[mem_wr_idx[1]] <= mem_pivot_in[5][127:64];
		mem_pivot_l_10[mem_wr_idx[1]] <= mem_pivot_in[5][63:0];
	end

	if (mem_wr[11]) begin
		mem_pivot_h_11[mem_wr_idx[1]] <= mem_pivot_in[5][127:64];
		mem_pivot_l_11[mem_wr_idx[1]] <= mem_pivot_in[5][63:0];
	end

	if (mem_wr[12]) begin
		mem_pivot_h_12[mem_wr_idx[1]] <= mem_pivot_in[6][127:64];
		mem_pivot_l_12[mem_wr_idx[1]] <= mem_pivot_in[6][63:0];
	end

	if (mem_wr[13]) begin
		mem_pivot_h_13[mem_wr_idx[1]] <= mem_pivot_in[6][127:64];
		mem_pivot_l_13[mem_wr_idx[1]] <= mem_pivot_in[6][63:0];
	end

	if (mem_wr[14]) begin
		mem_pivot_h_14[mem_wr_idx[1]] <= mem_pivot_in[7][127:64];
		mem_pivot_l_14[mem_wr_idx[1]] <= mem_pivot_in[7][63:0];
	end

	if (mem_wr[15]) begin
		mem_pivot_h_15[mem_wr_idx[1]] <= mem_pivot_in[7][127:64];
		mem_pivot_l_15[mem_wr_idx[1]] <= mem_pivot_in[7][63:0];
	end
	mem_pivot_low_out[0] <= mem_pivot_l_0[mem_rd_idx[0]];
	mem_pivot_high_out[0] <= mem_pivot_h_0[mem_rd_idx[0]];
	mem_pivot_low_out[1] <= mem_pivot_l_1[mem_rd_idx[0]];
	mem_pivot_high_out[1] <= mem_pivot_h_1[mem_rd_idx[0]];
	mem_pivot_low_out[2] <= mem_pivot_l_2[mem_rd_idx[0]];
	mem_pivot_high_out[2] <= mem_pivot_h_2[mem_rd_idx[0]];
	mem_pivot_low_out[3] <= mem_pivot_l_3[mem_rd_idx[0]];
	mem_pivot_high_out[3] <= mem_pivot_h_3[mem_rd_idx[0]];
	mem_pivot_low_out[4] <= mem_pivot_l_4[mem_rd_idx[0]];
	mem_pivot_high_out[4] <= mem_pivot_h_4[mem_rd_idx[0]];
	mem_pivot_low_out[5] <= mem_pivot_l_5[mem_rd_idx[0]];
	mem_pivot_high_out[5] <= mem_pivot_h_5[mem_rd_idx[0]];
	mem_pivot_low_out[6] <= mem_pivot_l_6[mem_rd_idx[0]];
	mem_pivot_high_out[6] <= mem_pivot_h_6[mem_rd_idx[0]];
	mem_pivot_low_out[7] <= mem_pivot_l_7[mem_rd_idx[0]];
	mem_pivot_high_out[7] <= mem_pivot_h_7[mem_rd_idx[0]];
	mem_pivot_low_out[8] <= mem_pivot_l_8[mem_rd_idx[1]];
	mem_pivot_high_out[8] <= mem_pivot_h_8[mem_rd_idx[1]];
	mem_pivot_low_out[9] <= mem_pivot_l_9[mem_rd_idx[1]];
	mem_pivot_high_out[9] <= mem_pivot_h_9[mem_rd_idx[1]];
	mem_pivot_low_out[10] <= mem_pivot_l_10[mem_rd_idx[1]];
	mem_pivot_high_out[10] <= mem_pivot_h_10[mem_rd_idx[1]];
	mem_pivot_low_out[11] <= mem_pivot_l_11[mem_rd_idx[1]];
	mem_pivot_high_out[11] <= mem_pivot_h_11[mem_rd_idx[1]];
	mem_pivot_low_out[12] <= mem_pivot_l_12[mem_rd_idx[1]];
	mem_pivot_high_out[12] <= mem_pivot_h_12[mem_rd_idx[1]];
	mem_pivot_low_out[13] <= mem_pivot_l_13[mem_rd_idx[1]];
	mem_pivot_high_out[13] <= mem_pivot_h_13[mem_rd_idx[1]];
	mem_pivot_low_out[14] <= mem_pivot_l_14[mem_rd_idx[1]];
	mem_pivot_high_out[14] <= mem_pivot_h_14[mem_rd_idx[1]];
	mem_pivot_low_out[15] <= mem_pivot_l_15[mem_rd_idx[1]];
	mem_pivot_high_out[15] <= mem_pivot_h_15[mem_rd_idx[1]];
end

always_comb begin
	in_0s_tready = in_ready;

	if (state == 1'd1) begin
		in_valid = in_0s_tvalid;
	end
	else begin
		in_valid = 1'd0;
	end
end

always_ff @(posedge aclk) begin
	in_ready <= in_valid;
	in_pivots_tready <= in_pivots_tvalid;
end

always_ff @(posedge aclk) begin

	if (state == 1'd0) begin
		b_in_0_0[0] <= in_pivots_tdata;
	end
	else begin
		b_in_0_0[0] <= in_0s_tdata;
	end
	b_in_0_1[0] <= b_in_0_0[0];
	b_in_0_1[1] <= b_in_0_0[0];
	b_in_0_2[0] <= b_in_0_1[0];
	b_in_0_2[1] <= b_in_0_1[0];
	b_in_0_2[2] <= b_in_0_1[1];
	b_in_0_2[3] <= b_in_0_1[1];
	b_in_0_3[0] <= b_in_0_2[0];
	b_in_0_3[1] <= b_in_0_2[0];
	b_in_0_3[2] <= b_in_0_2[1];
	b_in_0_3[3] <= b_in_0_2[1];
	b_in_0_3[4] <= b_in_0_2[2];
	b_in_0_3[5] <= b_in_0_2[2];
	b_in_0_3[6] <= b_in_0_2[3];
	b_in_0_3[7] <= b_in_0_2[3];
	b_in_0_4[0] <= b_in_0_3[0];
	b_in_0_4[1] <= b_in_0_3[0];
	b_in_0_4[2] <= b_in_0_3[1];
	b_in_0_4[3] <= b_in_0_3[1];
	b_in_0_4[4] <= b_in_0_3[2];
	b_in_0_4[5] <= b_in_0_3[2];
	b_in_0_4[6] <= b_in_0_3[3];
	b_in_0_4[7] <= b_in_0_3[3];
	b_in_0_4[8] <= b_in_0_3[4];
	b_in_0_4[9] <= b_in_0_3[4];
	b_in_0_4[10] <= b_in_0_3[5];
	b_in_0_4[11] <= b_in_0_3[5];
	b_in_0_4[12] <= b_in_0_3[6];
	b_in_0_4[13] <= b_in_0_3[6];
	b_in_0_4[14] <= b_in_0_3[7];
	b_in_0_4[15] <= b_in_0_3[7];
	b_in_d_0_0[0] <= b_in_0_4[0];
	b_in_d_0_1[0] <= b_in_d_0_0[0];
	b_in_d_0_2[0] <= b_in_d_0_1[0];
	b_in_d_0_3[0] <= b_in_d_0_2[0];
	b_in_d_0_0[1] <= b_in_0_4[1];
	b_in_d_0_1[1] <= b_in_d_0_0[1];
	b_in_d_0_2[1] <= b_in_d_0_1[1];
	b_in_d_0_3[1] <= b_in_d_0_2[1];
	b_in_d_0_0[2] <= b_in_0_4[2];
	b_in_d_0_1[2] <= b_in_d_0_0[2];
	b_in_d_0_2[2] <= b_in_d_0_1[2];
	b_in_d_0_3[2] <= b_in_d_0_2[2];
	b_in_d_0_0[3] <= b_in_0_4[3];
	b_in_d_0_1[3] <= b_in_d_0_0[3];
	b_in_d_0_2[3] <= b_in_d_0_1[3];
	b_in_d_0_3[3] <= b_in_d_0_2[3];
	b_in_d_0_0[4] <= b_in_0_4[4];
	b_in_d_0_1[4] <= b_in_d_0_0[4];
	b_in_d_0_2[4] <= b_in_d_0_1[4];
	b_in_d_0_3[4] <= b_in_d_0_2[4];
	b_in_d_0_0[5] <= b_in_0_4[5];
	b_in_d_0_1[5] <= b_in_d_0_0[5];
	b_in_d_0_2[5] <= b_in_d_0_1[5];
	b_in_d_0_3[5] <= b_in_d_0_2[5];
	b_in_d_0_0[6] <= b_in_0_4[6];
	b_in_d_0_1[6] <= b_in_d_0_0[6];
	b_in_d_0_2[6] <= b_in_d_0_1[6];
	b_in_d_0_3[6] <= b_in_d_0_2[6];
	b_in_d_0_0[7] <= b_in_0_4[7];
	b_in_d_0_1[7] <= b_in_d_0_0[7];
	b_in_d_0_2[7] <= b_in_d_0_1[7];
	b_in_d_0_3[7] <= b_in_d_0_2[7];
	b_in_d_0_0[8] <= b_in_0_4[8];
	b_in_d_0_1[8] <= b_in_d_0_0[8];
	b_in_d_0_2[8] <= b_in_d_0_1[8];
	b_in_d_0_3[8] <= b_in_d_0_2[8];
	b_in_d_0_0[9] <= b_in_0_4[9];
	b_in_d_0_1[9] <= b_in_d_0_0[9];
	b_in_d_0_2[9] <= b_in_d_0_1[9];
	b_in_d_0_3[9] <= b_in_d_0_2[9];
	b_in_d_0_0[10] <= b_in_0_4[10];
	b_in_d_0_1[10] <= b_in_d_0_0[10];
	b_in_d_0_2[10] <= b_in_d_0_1[10];
	b_in_d_0_3[10] <= b_in_d_0_2[10];
	b_in_d_0_0[11] <= b_in_0_4[11];
	b_in_d_0_1[11] <= b_in_d_0_0[11];
	b_in_d_0_2[11] <= b_in_d_0_1[11];
	b_in_d_0_3[11] <= b_in_d_0_2[11];
	b_in_d_0_0[12] <= b_in_0_4[12];
	b_in_d_0_1[12] <= b_in_d_0_0[12];
	b_in_d_0_2[12] <= b_in_d_0_1[12];
	b_in_d_0_3[12] <= b_in_d_0_2[12];
	b_in_d_0_0[13] <= b_in_0_4[13];
	b_in_d_0_1[13] <= b_in_d_0_0[13];
	b_in_d_0_2[13] <= b_in_d_0_1[13];
	b_in_d_0_3[13] <= b_in_d_0_2[13];
	b_in_d_0_0[14] <= b_in_0_4[14];
	b_in_d_0_1[14] <= b_in_d_0_0[14];
	b_in_d_0_2[14] <= b_in_d_0_1[14];
	b_in_d_0_3[14] <= b_in_d_0_2[14];
	b_in_d_0_0[15] <= b_in_0_4[15];
	b_in_d_0_1[15] <= b_in_d_0_0[15];
	b_in_d_0_2[15] <= b_in_d_0_1[15];
	b_in_d_0_3[15] <= b_in_d_0_2[15];
	b_pivot_0[0] <= {mem_pivot_high_out[0], mem_pivot_low_out[0]};
	b_pivot_0[1] <= b_pivot_0[0];
	b_pivot_0[2] <= b_pivot_0[1];
	b_pivot_0[3] <= b_pivot_0[2];
	b_pivot_d_0[0] <= b_pivot_0[3];
	b_pivot_d_0[1] <= b_pivot_0[3];
	b_pivot_d_0[2] <= b_pivot_0[3];
	b_pivot_d_0[3] <= b_pivot_0[3];
	b_pivot_1[0] <= {mem_pivot_high_out[1], mem_pivot_low_out[1]};
	b_pivot_1[1] <= b_pivot_1[0];
	b_pivot_1[2] <= b_pivot_1[1];
	b_pivot_1[3] <= b_pivot_1[2];
	b_pivot_d_1[0] <= b_pivot_1[3];
	b_pivot_d_1[1] <= b_pivot_1[3];
	b_pivot_d_1[2] <= b_pivot_1[3];
	b_pivot_d_1[3] <= b_pivot_1[3];
	b_pivot_2[0] <= {mem_pivot_high_out[2], mem_pivot_low_out[2]};
	b_pivot_2[1] <= b_pivot_2[0];
	b_pivot_2[2] <= b_pivot_2[1];
	b_pivot_2[3] <= b_pivot_2[2];
	b_pivot_d_2[0] <= b_pivot_2[3];
	b_pivot_d_2[1] <= b_pivot_2[3];
	b_pivot_d_2[2] <= b_pivot_2[3];
	b_pivot_d_2[3] <= b_pivot_2[3];
	b_pivot_3[0] <= {mem_pivot_high_out[3], mem_pivot_low_out[3]};
	b_pivot_3[1] <= b_pivot_3[0];
	b_pivot_3[2] <= b_pivot_3[1];
	b_pivot_3[3] <= b_pivot_3[2];
	b_pivot_d_3[0] <= b_pivot_3[3];
	b_pivot_d_3[1] <= b_pivot_3[3];
	b_pivot_d_3[2] <= b_pivot_3[3];
	b_pivot_d_3[3] <= b_pivot_3[3];
	b_pivot_4[0] <= {mem_pivot_high_out[4], mem_pivot_low_out[4]};
	b_pivot_4[1] <= b_pivot_4[0];
	b_pivot_4[2] <= b_pivot_4[1];
	b_pivot_4[3] <= b_pivot_4[2];
	b_pivot_d_4[0] <= b_pivot_4[3];
	b_pivot_d_4[1] <= b_pivot_4[3];
	b_pivot_d_4[2] <= b_pivot_4[3];
	b_pivot_d_4[3] <= b_pivot_4[3];
	b_pivot_5[0] <= {mem_pivot_high_out[5], mem_pivot_low_out[5]};
	b_pivot_5[1] <= b_pivot_5[0];
	b_pivot_5[2] <= b_pivot_5[1];
	b_pivot_5[3] <= b_pivot_5[2];
	b_pivot_d_5[0] <= b_pivot_5[3];
	b_pivot_d_5[1] <= b_pivot_5[3];
	b_pivot_d_5[2] <= b_pivot_5[3];
	b_pivot_d_5[3] <= b_pivot_5[3];
	b_pivot_6[0] <= {mem_pivot_high_out[6], mem_pivot_low_out[6]};
	b_pivot_6[1] <= b_pivot_6[0];
	b_pivot_6[2] <= b_pivot_6[1];
	b_pivot_6[3] <= b_pivot_6[2];
	b_pivot_d_6[0] <= b_pivot_6[3];
	b_pivot_d_6[1] <= b_pivot_6[3];
	b_pivot_d_6[2] <= b_pivot_6[3];
	b_pivot_d_6[3] <= b_pivot_6[3];
	b_pivot_7[0] <= {mem_pivot_high_out[7], mem_pivot_low_out[7]};
	b_pivot_7[1] <= b_pivot_7[0];
	b_pivot_7[2] <= b_pivot_7[1];
	b_pivot_7[3] <= b_pivot_7[2];
	b_pivot_d_7[0] <= b_pivot_7[3];
	b_pivot_d_7[1] <= b_pivot_7[3];
	b_pivot_d_7[2] <= b_pivot_7[3];
	b_pivot_d_7[3] <= b_pivot_7[3];
	b_pivot_8[0] <= {mem_pivot_high_out[8], mem_pivot_low_out[8]};
	b_pivot_8[1] <= b_pivot_8[0];
	b_pivot_8[2] <= b_pivot_8[1];
	b_pivot_8[3] <= b_pivot_8[2];
	b_pivot_d_8[0] <= b_pivot_8[3];
	b_pivot_d_8[1] <= b_pivot_8[3];
	b_pivot_d_8[2] <= b_pivot_8[3];
	b_pivot_d_8[3] <= b_pivot_8[3];
	b_pivot_9[0] <= {mem_pivot_high_out[9], mem_pivot_low_out[9]};
	b_pivot_9[1] <= b_pivot_9[0];
	b_pivot_9[2] <= b_pivot_9[1];
	b_pivot_9[3] <= b_pivot_9[2];
	b_pivot_d_9[0] <= b_pivot_9[3];
	b_pivot_d_9[1] <= b_pivot_9[3];
	b_pivot_d_9[2] <= b_pivot_9[3];
	b_pivot_d_9[3] <= b_pivot_9[3];
	b_pivot_10[0] <= {mem_pivot_high_out[10], mem_pivot_low_out[10]};
	b_pivot_10[1] <= b_pivot_10[0];
	b_pivot_10[2] <= b_pivot_10[1];
	b_pivot_10[3] <= b_pivot_10[2];
	b_pivot_d_10[0] <= b_pivot_10[3];
	b_pivot_d_10[1] <= b_pivot_10[3];
	b_pivot_d_10[2] <= b_pivot_10[3];
	b_pivot_d_10[3] <= b_pivot_10[3];
	b_pivot_11[0] <= {mem_pivot_high_out[11], mem_pivot_low_out[11]};
	b_pivot_11[1] <= b_pivot_11[0];
	b_pivot_11[2] <= b_pivot_11[1];
	b_pivot_11[3] <= b_pivot_11[2];
	b_pivot_d_11[0] <= b_pivot_11[3];
	b_pivot_d_11[1] <= b_pivot_11[3];
	b_pivot_d_11[2] <= b_pivot_11[3];
	b_pivot_d_11[3] <= b_pivot_11[3];
	b_pivot_12[0] <= {mem_pivot_high_out[12], mem_pivot_low_out[12]};
	b_pivot_12[1] <= b_pivot_12[0];
	b_pivot_12[2] <= b_pivot_12[1];
	b_pivot_12[3] <= b_pivot_12[2];
	b_pivot_d_12[0] <= b_pivot_12[3];
	b_pivot_d_12[1] <= b_pivot_12[3];
	b_pivot_d_12[2] <= b_pivot_12[3];
	b_pivot_d_12[3] <= b_pivot_12[3];
	b_pivot_13[0] <= {mem_pivot_high_out[13], mem_pivot_low_out[13]};
	b_pivot_13[1] <= b_pivot_13[0];
	b_pivot_13[2] <= b_pivot_13[1];
	b_pivot_13[3] <= b_pivot_13[2];
	b_pivot_d_13[0] <= b_pivot_13[3];
	b_pivot_d_13[1] <= b_pivot_13[3];
	b_pivot_d_13[2] <= b_pivot_13[3];
	b_pivot_d_13[3] <= b_pivot_13[3];
	b_pivot_14[0] <= {mem_pivot_high_out[14], mem_pivot_low_out[14]};
	b_pivot_14[1] <= b_pivot_14[0];
	b_pivot_14[2] <= b_pivot_14[1];
	b_pivot_14[3] <= b_pivot_14[2];
	b_pivot_d_14[0] <= b_pivot_14[3];
	b_pivot_d_14[1] <= b_pivot_14[3];
	b_pivot_d_14[2] <= b_pivot_14[3];
	b_pivot_d_14[3] <= b_pivot_14[3];
	b_pivot_15[0] <= {mem_pivot_high_out[15], mem_pivot_low_out[15]};
	b_pivot_15[1] <= b_pivot_15[0];
	b_pivot_15[2] <= b_pivot_15[1];
	b_pivot_15[3] <= b_pivot_15[2];
	b_pivot_d_15[0] <= b_pivot_15[3];
	b_pivot_d_15[1] <= b_pivot_15[3];
	b_pivot_d_15[2] <= b_pivot_15[3];
	b_pivot_d_15[3] <= b_pivot_15[3];
end

always_ff @(posedge aclk) begin

	if (state == 1'd0) begin
		valid <= {valid[7:0], in_pivots_tvalid & in_pivots_tready};
	end
	else begin
		valid <= {valid[7:0], in_valid & in_ready};
	end
end

always_ff @(posedge aclk) begin

	if (krnl_start) begin
		sketch_cnt <= 9'd0;
		input_cnt <= 32'd0;
	end
	else if (valid[0]) begin
		sketch_cnt <= sketch_cnt + 9'd1;

		if (sketch_cnt == 9'd511) begin

			if ((state == 1'd0) && (input_cnt == (pivot_len - 32'd1))) begin
				input_cnt <= 32'd0;
			end
			else if ((state == 1'd1) && (input_cnt == (read_len - 32'd1))) begin
				input_cnt <= 32'd0;
			end
			else begin
				input_cnt <= input_cnt + 32'd1;
			end
		end
	end
	mem_rd_idx[0] <= sketch_cnt - 9'd1;
	mem_wr_idx[0] <= sketch_cnt;
	mem_rd_idx[1] <= sketch_cnt - 9'd1;
	mem_wr_idx[1] <= sketch_cnt;
end

always_ff @(posedge aclk) begin

	if (krnl_start) begin
		pivot_valid <= 16'd0;
		mem_wr <= 16'd0;
	end
	else if ((state == 1'd0) && valid[0]) begin
		mem_wr <= 16'd1 << input_cnt;
		mem_pivot_in[0] <= b_in_0_0[0];
		mem_pivot_in[1] <= b_in_0_0[0];
		mem_pivot_in[2] <= b_in_0_0[0];
		mem_pivot_in[3] <= b_in_0_0[0];
		mem_pivot_in[4] <= b_in_0_0[0];
		mem_pivot_in[5] <= b_in_0_0[0];
		mem_pivot_in[6] <= b_in_0_0[0];
		mem_pivot_in[7] <= b_in_0_0[0];

		if (sketch_cnt == 9'd511) begin
			pivot_valid <= pivot_valid | (16'd1 << input_cnt);
		end
		else begin
			pivot_valid <= pivot_valid;
		end
	end
	else begin
		pivot_valid <= pivot_valid;
		mem_wr <= 16'd0;
	end
end

always_ff @(posedge aclk) begin
	state_r <= {state_r[15:0], state};

	if (krnl_start) begin
		state <= 1'd0;
	end
	else if (valid[0]) begin

		if (sketch_cnt == 9'd511) begin

			if ((state == 1'd0) && (input_cnt == (pivot_len - 32'd1))) begin

				if (read_len == 32'd0) begin
					state <= 1'd0;
				end
				else begin
					state <= 1'd1;
				end
			end
			else if ((state == 1'd1) && (input_cnt == (read_len - 32'd1))) begin
				state <= 1'd0;
			end
			else begin
				state <= state;
			end
		end
		else begin
			state <= state;
		end
	end
	else begin
		state <= state;
	end
end

always_comb begin
	m_out_0_0_0_full = {10'd0, 0'd0, 4'd0, 2'd0, m_out_0_0_0m_tdata};
end

always_comb begin
	m_out_0_0_1_full = {10'd0, 0'd0, 4'd0, 2'd1, m_out_0_0_1m_tdata};
end

always_comb begin
	m_out_0_0_2_full = {10'd0, 0'd0, 4'd0, 2'd2, m_out_0_0_2m_tdata};
end

always_comb begin
	m_out_0_0_3_full = {10'd0, 0'd0, 4'd0, 2'd3, m_out_0_0_3m_tdata};
end

always_comb begin
	m_out_0_1_0_full = {10'd0, 0'd0, 4'd1, 2'd0, m_out_0_1_0m_tdata};
end

always_comb begin
	m_out_0_1_1_full = {10'd0, 0'd0, 4'd1, 2'd1, m_out_0_1_1m_tdata};
end

always_comb begin
	m_out_0_1_2_full = {10'd0, 0'd0, 4'd1, 2'd2, m_out_0_1_2m_tdata};
end

always_comb begin
	m_out_0_1_3_full = {10'd0, 0'd0, 4'd1, 2'd3, m_out_0_1_3m_tdata};
end

always_comb begin
	m_out_0_2_0_full = {10'd0, 0'd0, 4'd2, 2'd0, m_out_0_2_0m_tdata};
end

always_comb begin
	m_out_0_2_1_full = {10'd0, 0'd0, 4'd2, 2'd1, m_out_0_2_1m_tdata};
end

always_comb begin
	m_out_0_2_2_full = {10'd0, 0'd0, 4'd2, 2'd2, m_out_0_2_2m_tdata};
end

always_comb begin
	m_out_0_2_3_full = {10'd0, 0'd0, 4'd2, 2'd3, m_out_0_2_3m_tdata};
end

always_comb begin
	m_out_0_3_0_full = {10'd0, 0'd0, 4'd3, 2'd0, m_out_0_3_0m_tdata};
end

always_comb begin
	m_out_0_3_1_full = {10'd0, 0'd0, 4'd3, 2'd1, m_out_0_3_1m_tdata};
end

always_comb begin
	m_out_0_3_2_full = {10'd0, 0'd0, 4'd3, 2'd2, m_out_0_3_2m_tdata};
end

always_comb begin
	m_out_0_3_3_full = {10'd0, 0'd0, 4'd3, 2'd3, m_out_0_3_3m_tdata};
end

always_comb begin
	m_out_0_4_0_full = {10'd0, 0'd0, 4'd4, 2'd0, m_out_0_4_0m_tdata};
end

always_comb begin
	m_out_0_4_1_full = {10'd0, 0'd0, 4'd4, 2'd1, m_out_0_4_1m_tdata};
end

always_comb begin
	m_out_0_4_2_full = {10'd0, 0'd0, 4'd4, 2'd2, m_out_0_4_2m_tdata};
end

always_comb begin
	m_out_0_4_3_full = {10'd0, 0'd0, 4'd4, 2'd3, m_out_0_4_3m_tdata};
end

always_comb begin
	m_out_0_5_0_full = {10'd0, 0'd0, 4'd5, 2'd0, m_out_0_5_0m_tdata};
end

always_comb begin
	m_out_0_5_1_full = {10'd0, 0'd0, 4'd5, 2'd1, m_out_0_5_1m_tdata};
end

always_comb begin
	m_out_0_5_2_full = {10'd0, 0'd0, 4'd5, 2'd2, m_out_0_5_2m_tdata};
end

always_comb begin
	m_out_0_5_3_full = {10'd0, 0'd0, 4'd5, 2'd3, m_out_0_5_3m_tdata};
end

always_comb begin
	m_out_0_6_0_full = {10'd0, 0'd0, 4'd6, 2'd0, m_out_0_6_0m_tdata};
end

always_comb begin
	m_out_0_6_1_full = {10'd0, 0'd0, 4'd6, 2'd1, m_out_0_6_1m_tdata};
end

always_comb begin
	m_out_0_6_2_full = {10'd0, 0'd0, 4'd6, 2'd2, m_out_0_6_2m_tdata};
end

always_comb begin
	m_out_0_6_3_full = {10'd0, 0'd0, 4'd6, 2'd3, m_out_0_6_3m_tdata};
end

always_comb begin
	m_out_0_7_0_full = {10'd0, 0'd0, 4'd7, 2'd0, m_out_0_7_0m_tdata};
end

always_comb begin
	m_out_0_7_1_full = {10'd0, 0'd0, 4'd7, 2'd1, m_out_0_7_1m_tdata};
end

always_comb begin
	m_out_0_7_2_full = {10'd0, 0'd0, 4'd7, 2'd2, m_out_0_7_2m_tdata};
end

always_comb begin
	m_out_0_7_3_full = {10'd0, 0'd0, 4'd7, 2'd3, m_out_0_7_3m_tdata};
end

always_comb begin
	m_out_0_8_0_full = {10'd0, 0'd0, 4'd8, 2'd0, m_out_0_8_0m_tdata};
end

always_comb begin
	m_out_0_8_1_full = {10'd0, 0'd0, 4'd8, 2'd1, m_out_0_8_1m_tdata};
end

always_comb begin
	m_out_0_8_2_full = {10'd0, 0'd0, 4'd8, 2'd2, m_out_0_8_2m_tdata};
end

always_comb begin
	m_out_0_8_3_full = {10'd0, 0'd0, 4'd8, 2'd3, m_out_0_8_3m_tdata};
end

always_comb begin
	m_out_0_9_0_full = {10'd0, 0'd0, 4'd9, 2'd0, m_out_0_9_0m_tdata};
end

always_comb begin
	m_out_0_9_1_full = {10'd0, 0'd0, 4'd9, 2'd1, m_out_0_9_1m_tdata};
end

always_comb begin
	m_out_0_9_2_full = {10'd0, 0'd0, 4'd9, 2'd2, m_out_0_9_2m_tdata};
end

always_comb begin
	m_out_0_9_3_full = {10'd0, 0'd0, 4'd9, 2'd3, m_out_0_9_3m_tdata};
end

always_comb begin
	m_out_0_10_0_full = {10'd0, 0'd0, 4'd10, 2'd0, m_out_0_10_0m_tdata};
end

always_comb begin
	m_out_0_10_1_full = {10'd0, 0'd0, 4'd10, 2'd1, m_out_0_10_1m_tdata};
end

always_comb begin
	m_out_0_10_2_full = {10'd0, 0'd0, 4'd10, 2'd2, m_out_0_10_2m_tdata};
end

always_comb begin
	m_out_0_10_3_full = {10'd0, 0'd0, 4'd10, 2'd3, m_out_0_10_3m_tdata};
end

always_comb begin
	m_out_0_11_0_full = {10'd0, 0'd0, 4'd11, 2'd0, m_out_0_11_0m_tdata};
end

always_comb begin
	m_out_0_11_1_full = {10'd0, 0'd0, 4'd11, 2'd1, m_out_0_11_1m_tdata};
end

always_comb begin
	m_out_0_11_2_full = {10'd0, 0'd0, 4'd11, 2'd2, m_out_0_11_2m_tdata};
end

always_comb begin
	m_out_0_11_3_full = {10'd0, 0'd0, 4'd11, 2'd3, m_out_0_11_3m_tdata};
end

always_comb begin
	m_out_0_12_0_full = {10'd0, 0'd0, 4'd12, 2'd0, m_out_0_12_0m_tdata};
end

always_comb begin
	m_out_0_12_1_full = {10'd0, 0'd0, 4'd12, 2'd1, m_out_0_12_1m_tdata};
end

always_comb begin
	m_out_0_12_2_full = {10'd0, 0'd0, 4'd12, 2'd2, m_out_0_12_2m_tdata};
end

always_comb begin
	m_out_0_12_3_full = {10'd0, 0'd0, 4'd12, 2'd3, m_out_0_12_3m_tdata};
end

always_comb begin
	m_out_0_13_0_full = {10'd0, 0'd0, 4'd13, 2'd0, m_out_0_13_0m_tdata};
end

always_comb begin
	m_out_0_13_1_full = {10'd0, 0'd0, 4'd13, 2'd1, m_out_0_13_1m_tdata};
end

always_comb begin
	m_out_0_13_2_full = {10'd0, 0'd0, 4'd13, 2'd2, m_out_0_13_2m_tdata};
end

always_comb begin
	m_out_0_13_3_full = {10'd0, 0'd0, 4'd13, 2'd3, m_out_0_13_3m_tdata};
end

always_comb begin
	m_out_0_14_0_full = {10'd0, 0'd0, 4'd14, 2'd0, m_out_0_14_0m_tdata};
end

always_comb begin
	m_out_0_14_1_full = {10'd0, 0'd0, 4'd14, 2'd1, m_out_0_14_1m_tdata};
end

always_comb begin
	m_out_0_14_2_full = {10'd0, 0'd0, 4'd14, 2'd2, m_out_0_14_2m_tdata};
end

always_comb begin
	m_out_0_14_3_full = {10'd0, 0'd0, 4'd14, 2'd3, m_out_0_14_3m_tdata};
end

always_comb begin
	m_out_0_15_0_full = {10'd0, 0'd0, 4'd15, 2'd0, m_out_0_15_0m_tdata};
end

always_comb begin
	m_out_0_15_1_full = {10'd0, 0'd0, 4'd15, 2'd1, m_out_0_15_1m_tdata};
end

always_comb begin
	m_out_0_15_2_full = {10'd0, 0'd0, 4'd15, 2'd2, m_out_0_15_2m_tdata};
end

always_comb begin
	m_out_0_15_3_full = {10'd0, 0'd0, 4'd15, 2'd3, m_out_0_15_3m_tdata};
end

endmodule

