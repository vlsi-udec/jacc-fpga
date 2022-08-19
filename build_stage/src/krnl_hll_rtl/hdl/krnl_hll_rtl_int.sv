`timescale 1ns / 1ps

module krnl_hll_rtl_int (
	input logic [0:0] ap_aclk,
	input logic [0:0] ap_aclk_2,
	input logic [0:0] ap_rst_n,
	input logic [0:0] ap_rst_n_2,
	output logic [63:0] m_axi_gmem_0_ARADDR,
	output logic [1:0] m_axi_gmem_0_ARBURST,
	output logic [3:0] m_axi_gmem_0_ARCACHE,
	output logic [0:0] m_axi_gmem_0_ARID,
	output logic [7:0] m_axi_gmem_0_ARLEN,
	output logic [1:0] m_axi_gmem_0_ARLOCK,
	output logic [2:0] m_axi_gmem_0_ARPROT,
	output logic [3:0] m_axi_gmem_0_ARQOS,
	input logic [0:0] m_axi_gmem_0_ARREADY,
	output logic [3:0] m_axi_gmem_0_ARREGION,
	output logic [2:0] m_axi_gmem_0_ARSIZE,
	output logic [0:0] m_axi_gmem_0_ARVALID,
	output logic [63:0] m_axi_gmem_0_AWADDR,
	output logic [1:0] m_axi_gmem_0_AWBURST,
	output logic [3:0] m_axi_gmem_0_AWCACHE,
	output logic [0:0] m_axi_gmem_0_AWID,
	output logic [7:0] m_axi_gmem_0_AWLEN,
	output logic [1:0] m_axi_gmem_0_AWLOCK,
	output logic [2:0] m_axi_gmem_0_AWPROT,
	output logic [3:0] m_axi_gmem_0_AWQOS,
	input logic [0:0] m_axi_gmem_0_AWREADY,
	output logic [3:0] m_axi_gmem_0_AWREGION,
	output logic [2:0] m_axi_gmem_0_AWSIZE,
	output logic [0:0] m_axi_gmem_0_AWVALID,
	input logic [0:0] m_axi_gmem_0_BID,
	output logic [0:0] m_axi_gmem_0_BREADY,
	input logic [1:0] m_axi_gmem_0_BRESP,
	input logic [0:0] m_axi_gmem_0_BVALID,
	input logic [511:0] m_axi_gmem_0_RDATA,
	input logic [0:0] m_axi_gmem_0_RID,
	input logic [0:0] m_axi_gmem_0_RLAST,
	output logic [0:0] m_axi_gmem_0_RREADY,
	input logic [1:0] m_axi_gmem_0_RRESP,
	input logic [0:0] m_axi_gmem_0_RVALID,
	output logic [511:0] m_axi_gmem_0_WDATA,
	output logic [0:0] m_axi_gmem_0_WLAST,
	input logic [0:0] m_axi_gmem_0_WREADY,
	output logic [63:0] m_axi_gmem_0_WSTRB,
	output logic [0:0] m_axi_gmem_0_WVALID,
	output logic [63:0] m_axi_gmem_1_ARADDR,
	output logic [1:0] m_axi_gmem_1_ARBURST,
	output logic [3:0] m_axi_gmem_1_ARCACHE,
	output logic [0:0] m_axi_gmem_1_ARID,
	output logic [7:0] m_axi_gmem_1_ARLEN,
	output logic [1:0] m_axi_gmem_1_ARLOCK,
	output logic [2:0] m_axi_gmem_1_ARPROT,
	output logic [3:0] m_axi_gmem_1_ARQOS,
	input logic [0:0] m_axi_gmem_1_ARREADY,
	output logic [3:0] m_axi_gmem_1_ARREGION,
	output logic [2:0] m_axi_gmem_1_ARSIZE,
	output logic [0:0] m_axi_gmem_1_ARVALID,
	output logic [63:0] m_axi_gmem_1_AWADDR,
	output logic [1:0] m_axi_gmem_1_AWBURST,
	output logic [3:0] m_axi_gmem_1_AWCACHE,
	output logic [0:0] m_axi_gmem_1_AWID,
	output logic [7:0] m_axi_gmem_1_AWLEN,
	output logic [1:0] m_axi_gmem_1_AWLOCK,
	output logic [2:0] m_axi_gmem_1_AWPROT,
	output logic [3:0] m_axi_gmem_1_AWQOS,
	input logic [0:0] m_axi_gmem_1_AWREADY,
	output logic [3:0] m_axi_gmem_1_AWREGION,
	output logic [2:0] m_axi_gmem_1_AWSIZE,
	output logic [0:0] m_axi_gmem_1_AWVALID,
	input logic [0:0] m_axi_gmem_1_BID,
	output logic [0:0] m_axi_gmem_1_BREADY,
	input logic [1:0] m_axi_gmem_1_BRESP,
	input logic [0:0] m_axi_gmem_1_BVALID,
	input logic [511:0] m_axi_gmem_1_RDATA,
	input logic [0:0] m_axi_gmem_1_RID,
	input logic [0:0] m_axi_gmem_1_RLAST,
	output logic [0:0] m_axi_gmem_1_RREADY,
	input logic [1:0] m_axi_gmem_1_RRESP,
	input logic [0:0] m_axi_gmem_1_RVALID,
	output logic [511:0] m_axi_gmem_1_WDATA,
	output logic [0:0] m_axi_gmem_1_WLAST,
	input logic [0:0] m_axi_gmem_1_WREADY,
	output logic [63:0] m_axi_gmem_1_WSTRB,
	output logic [0:0] m_axi_gmem_1_WVALID,
	output logic [63:0] m_axi_gmem_2_ARADDR,
	output logic [1:0] m_axi_gmem_2_ARBURST,
	output logic [3:0] m_axi_gmem_2_ARCACHE,
	output logic [0:0] m_axi_gmem_2_ARID,
	output logic [7:0] m_axi_gmem_2_ARLEN,
	output logic [1:0] m_axi_gmem_2_ARLOCK,
	output logic [2:0] m_axi_gmem_2_ARPROT,
	output logic [3:0] m_axi_gmem_2_ARQOS,
	input logic [0:0] m_axi_gmem_2_ARREADY,
	output logic [3:0] m_axi_gmem_2_ARREGION,
	output logic [2:0] m_axi_gmem_2_ARSIZE,
	output logic [0:0] m_axi_gmem_2_ARVALID,
	output logic [63:0] m_axi_gmem_2_AWADDR,
	output logic [1:0] m_axi_gmem_2_AWBURST,
	output logic [3:0] m_axi_gmem_2_AWCACHE,
	output logic [0:0] m_axi_gmem_2_AWID,
	output logic [7:0] m_axi_gmem_2_AWLEN,
	output logic [1:0] m_axi_gmem_2_AWLOCK,
	output logic [2:0] m_axi_gmem_2_AWPROT,
	output logic [3:0] m_axi_gmem_2_AWQOS,
	input logic [0:0] m_axi_gmem_2_AWREADY,
	output logic [3:0] m_axi_gmem_2_AWREGION,
	output logic [2:0] m_axi_gmem_2_AWSIZE,
	output logic [0:0] m_axi_gmem_2_AWVALID,
	input logic [0:0] m_axi_gmem_2_BID,
	output logic [0:0] m_axi_gmem_2_BREADY,
	input logic [1:0] m_axi_gmem_2_BRESP,
	input logic [0:0] m_axi_gmem_2_BVALID,
	input logic [511:0] m_axi_gmem_2_RDATA,
	input logic [0:0] m_axi_gmem_2_RID,
	input logic [0:0] m_axi_gmem_2_RLAST,
	output logic [0:0] m_axi_gmem_2_RREADY,
	input logic [1:0] m_axi_gmem_2_RRESP,
	input logic [0:0] m_axi_gmem_2_RVALID,
	output logic [511:0] m_axi_gmem_2_WDATA,
	output logic [0:0] m_axi_gmem_2_WLAST,
	input logic [0:0] m_axi_gmem_2_WREADY,
	output logic [63:0] m_axi_gmem_2_WSTRB,
	output logic [0:0] m_axi_gmem_2_WVALID,
	output logic [63:0] m_axi_gmem_3_ARADDR,
	output logic [1:0] m_axi_gmem_3_ARBURST,
	output logic [3:0] m_axi_gmem_3_ARCACHE,
	output logic [0:0] m_axi_gmem_3_ARID,
	output logic [7:0] m_axi_gmem_3_ARLEN,
	output logic [1:0] m_axi_gmem_3_ARLOCK,
	output logic [2:0] m_axi_gmem_3_ARPROT,
	output logic [3:0] m_axi_gmem_3_ARQOS,
	input logic [0:0] m_axi_gmem_3_ARREADY,
	output logic [3:0] m_axi_gmem_3_ARREGION,
	output logic [2:0] m_axi_gmem_3_ARSIZE,
	output logic [0:0] m_axi_gmem_3_ARVALID,
	output logic [63:0] m_axi_gmem_3_AWADDR,
	output logic [1:0] m_axi_gmem_3_AWBURST,
	output logic [3:0] m_axi_gmem_3_AWCACHE,
	output logic [0:0] m_axi_gmem_3_AWID,
	output logic [7:0] m_axi_gmem_3_AWLEN,
	output logic [1:0] m_axi_gmem_3_AWLOCK,
	output logic [2:0] m_axi_gmem_3_AWPROT,
	output logic [3:0] m_axi_gmem_3_AWQOS,
	input logic [0:0] m_axi_gmem_3_AWREADY,
	output logic [3:0] m_axi_gmem_3_AWREGION,
	output logic [2:0] m_axi_gmem_3_AWSIZE,
	output logic [0:0] m_axi_gmem_3_AWVALID,
	input logic [0:0] m_axi_gmem_3_BID,
	output logic [0:0] m_axi_gmem_3_BREADY,
	input logic [1:0] m_axi_gmem_3_BRESP,
	input logic [0:0] m_axi_gmem_3_BVALID,
	input logic [511:0] m_axi_gmem_3_RDATA,
	input logic [0:0] m_axi_gmem_3_RID,
	input logic [0:0] m_axi_gmem_3_RLAST,
	output logic [0:0] m_axi_gmem_3_RREADY,
	input logic [1:0] m_axi_gmem_3_RRESP,
	input logic [0:0] m_axi_gmem_3_RVALID,
	output logic [511:0] m_axi_gmem_3_WDATA,
	output logic [0:0] m_axi_gmem_3_WLAST,
	input logic [0:0] m_axi_gmem_3_WREADY,
	output logic [63:0] m_axi_gmem_3_WSTRB,
	output logic [0:0] m_axi_gmem_3_WVALID,
	output logic [63:0] m_axi_gmem_4_ARADDR,
	output logic [1:0] m_axi_gmem_4_ARBURST,
	output logic [3:0] m_axi_gmem_4_ARCACHE,
	output logic [0:0] m_axi_gmem_4_ARID,
	output logic [7:0] m_axi_gmem_4_ARLEN,
	output logic [1:0] m_axi_gmem_4_ARLOCK,
	output logic [2:0] m_axi_gmem_4_ARPROT,
	output logic [3:0] m_axi_gmem_4_ARQOS,
	input logic [0:0] m_axi_gmem_4_ARREADY,
	output logic [3:0] m_axi_gmem_4_ARREGION,
	output logic [2:0] m_axi_gmem_4_ARSIZE,
	output logic [0:0] m_axi_gmem_4_ARVALID,
	output logic [63:0] m_axi_gmem_4_AWADDR,
	output logic [1:0] m_axi_gmem_4_AWBURST,
	output logic [3:0] m_axi_gmem_4_AWCACHE,
	output logic [0:0] m_axi_gmem_4_AWID,
	output logic [7:0] m_axi_gmem_4_AWLEN,
	output logic [1:0] m_axi_gmem_4_AWLOCK,
	output logic [2:0] m_axi_gmem_4_AWPROT,
	output logic [3:0] m_axi_gmem_4_AWQOS,
	input logic [0:0] m_axi_gmem_4_AWREADY,
	output logic [3:0] m_axi_gmem_4_AWREGION,
	output logic [2:0] m_axi_gmem_4_AWSIZE,
	output logic [0:0] m_axi_gmem_4_AWVALID,
	input logic [0:0] m_axi_gmem_4_BID,
	output logic [0:0] m_axi_gmem_4_BREADY,
	input logic [1:0] m_axi_gmem_4_BRESP,
	input logic [0:0] m_axi_gmem_4_BVALID,
	input logic [511:0] m_axi_gmem_4_RDATA,
	input logic [0:0] m_axi_gmem_4_RID,
	input logic [0:0] m_axi_gmem_4_RLAST,
	output logic [0:0] m_axi_gmem_4_RREADY,
	input logic [1:0] m_axi_gmem_4_RRESP,
	input logic [0:0] m_axi_gmem_4_RVALID,
	output logic [511:0] m_axi_gmem_4_WDATA,
	output logic [0:0] m_axi_gmem_4_WLAST,
	input logic [0:0] m_axi_gmem_4_WREADY,
	output logic [63:0] m_axi_gmem_4_WSTRB,
	output logic [0:0] m_axi_gmem_4_WVALID,
	output logic [63:0] m_axi_gmem_5_ARADDR,
	output logic [1:0] m_axi_gmem_5_ARBURST,
	output logic [3:0] m_axi_gmem_5_ARCACHE,
	output logic [0:0] m_axi_gmem_5_ARID,
	output logic [7:0] m_axi_gmem_5_ARLEN,
	output logic [1:0] m_axi_gmem_5_ARLOCK,
	output logic [2:0] m_axi_gmem_5_ARPROT,
	output logic [3:0] m_axi_gmem_5_ARQOS,
	input logic [0:0] m_axi_gmem_5_ARREADY,
	output logic [3:0] m_axi_gmem_5_ARREGION,
	output logic [2:0] m_axi_gmem_5_ARSIZE,
	output logic [0:0] m_axi_gmem_5_ARVALID,
	output logic [63:0] m_axi_gmem_5_AWADDR,
	output logic [1:0] m_axi_gmem_5_AWBURST,
	output logic [3:0] m_axi_gmem_5_AWCACHE,
	output logic [0:0] m_axi_gmem_5_AWID,
	output logic [7:0] m_axi_gmem_5_AWLEN,
	output logic [1:0] m_axi_gmem_5_AWLOCK,
	output logic [2:0] m_axi_gmem_5_AWPROT,
	output logic [3:0] m_axi_gmem_5_AWQOS,
	input logic [0:0] m_axi_gmem_5_AWREADY,
	output logic [3:0] m_axi_gmem_5_AWREGION,
	output logic [2:0] m_axi_gmem_5_AWSIZE,
	output logic [0:0] m_axi_gmem_5_AWVALID,
	input logic [0:0] m_axi_gmem_5_BID,
	output logic [0:0] m_axi_gmem_5_BREADY,
	input logic [1:0] m_axi_gmem_5_BRESP,
	input logic [0:0] m_axi_gmem_5_BVALID,
	input logic [511:0] m_axi_gmem_5_RDATA,
	input logic [0:0] m_axi_gmem_5_RID,
	input logic [0:0] m_axi_gmem_5_RLAST,
	output logic [0:0] m_axi_gmem_5_RREADY,
	input logic [1:0] m_axi_gmem_5_RRESP,
	input logic [0:0] m_axi_gmem_5_RVALID,
	output logic [511:0] m_axi_gmem_5_WDATA,
	output logic [0:0] m_axi_gmem_5_WLAST,
	input logic [0:0] m_axi_gmem_5_WREADY,
	output logic [63:0] m_axi_gmem_5_WSTRB,
	output logic [0:0] m_axi_gmem_5_WVALID,
	output logic [63:0] m_axi_gmem_6_ARADDR,
	output logic [1:0] m_axi_gmem_6_ARBURST,
	output logic [3:0] m_axi_gmem_6_ARCACHE,
	output logic [0:0] m_axi_gmem_6_ARID,
	output logic [7:0] m_axi_gmem_6_ARLEN,
	output logic [1:0] m_axi_gmem_6_ARLOCK,
	output logic [2:0] m_axi_gmem_6_ARPROT,
	output logic [3:0] m_axi_gmem_6_ARQOS,
	input logic [0:0] m_axi_gmem_6_ARREADY,
	output logic [3:0] m_axi_gmem_6_ARREGION,
	output logic [2:0] m_axi_gmem_6_ARSIZE,
	output logic [0:0] m_axi_gmem_6_ARVALID,
	output logic [63:0] m_axi_gmem_6_AWADDR,
	output logic [1:0] m_axi_gmem_6_AWBURST,
	output logic [3:0] m_axi_gmem_6_AWCACHE,
	output logic [0:0] m_axi_gmem_6_AWID,
	output logic [7:0] m_axi_gmem_6_AWLEN,
	output logic [1:0] m_axi_gmem_6_AWLOCK,
	output logic [2:0] m_axi_gmem_6_AWPROT,
	output logic [3:0] m_axi_gmem_6_AWQOS,
	input logic [0:0] m_axi_gmem_6_AWREADY,
	output logic [3:0] m_axi_gmem_6_AWREGION,
	output logic [2:0] m_axi_gmem_6_AWSIZE,
	output logic [0:0] m_axi_gmem_6_AWVALID,
	input logic [0:0] m_axi_gmem_6_BID,
	output logic [0:0] m_axi_gmem_6_BREADY,
	input logic [1:0] m_axi_gmem_6_BRESP,
	input logic [0:0] m_axi_gmem_6_BVALID,
	input logic [511:0] m_axi_gmem_6_RDATA,
	input logic [0:0] m_axi_gmem_6_RID,
	input logic [0:0] m_axi_gmem_6_RLAST,
	output logic [0:0] m_axi_gmem_6_RREADY,
	input logic [1:0] m_axi_gmem_6_RRESP,
	input logic [0:0] m_axi_gmem_6_RVALID,
	output logic [511:0] m_axi_gmem_6_WDATA,
	output logic [0:0] m_axi_gmem_6_WLAST,
	input logic [0:0] m_axi_gmem_6_WREADY,
	output logic [63:0] m_axi_gmem_6_WSTRB,
	output logic [0:0] m_axi_gmem_6_WVALID,
	output logic [63:0] m_axi_gmem_7_ARADDR,
	output logic [1:0] m_axi_gmem_7_ARBURST,
	output logic [3:0] m_axi_gmem_7_ARCACHE,
	output logic [0:0] m_axi_gmem_7_ARID,
	output logic [7:0] m_axi_gmem_7_ARLEN,
	output logic [1:0] m_axi_gmem_7_ARLOCK,
	output logic [2:0] m_axi_gmem_7_ARPROT,
	output logic [3:0] m_axi_gmem_7_ARQOS,
	input logic [0:0] m_axi_gmem_7_ARREADY,
	output logic [3:0] m_axi_gmem_7_ARREGION,
	output logic [2:0] m_axi_gmem_7_ARSIZE,
	output logic [0:0] m_axi_gmem_7_ARVALID,
	output logic [63:0] m_axi_gmem_7_AWADDR,
	output logic [1:0] m_axi_gmem_7_AWBURST,
	output logic [3:0] m_axi_gmem_7_AWCACHE,
	output logic [0:0] m_axi_gmem_7_AWID,
	output logic [7:0] m_axi_gmem_7_AWLEN,
	output logic [1:0] m_axi_gmem_7_AWLOCK,
	output logic [2:0] m_axi_gmem_7_AWPROT,
	output logic [3:0] m_axi_gmem_7_AWQOS,
	input logic [0:0] m_axi_gmem_7_AWREADY,
	output logic [3:0] m_axi_gmem_7_AWREGION,
	output logic [2:0] m_axi_gmem_7_AWSIZE,
	output logic [0:0] m_axi_gmem_7_AWVALID,
	input logic [0:0] m_axi_gmem_7_BID,
	output logic [0:0] m_axi_gmem_7_BREADY,
	input logic [1:0] m_axi_gmem_7_BRESP,
	input logic [0:0] m_axi_gmem_7_BVALID,
	input logic [511:0] m_axi_gmem_7_RDATA,
	input logic [0:0] m_axi_gmem_7_RID,
	input logic [0:0] m_axi_gmem_7_RLAST,
	output logic [0:0] m_axi_gmem_7_RREADY,
	input logic [1:0] m_axi_gmem_7_RRESP,
	input logic [0:0] m_axi_gmem_7_RVALID,
	output logic [511:0] m_axi_gmem_7_WDATA,
	output logic [0:0] m_axi_gmem_7_WLAST,
	input logic [0:0] m_axi_gmem_7_WREADY,
	output logic [63:0] m_axi_gmem_7_WSTRB,
	output logic [0:0] m_axi_gmem_7_WVALID,
	output logic [63:0] p0_TDATA,
	input logic [0:0] p0_TREADY,
	output logic [0:0] p0_TVALID,
	output logic [63:0] p1_TDATA,
	input logic [0:0] p1_TREADY,
	output logic [0:0] p1_TVALID,
	output logic [63:0] p2_TDATA,
	input logic [0:0] p2_TREADY,
	output logic [0:0] p2_TVALID,
	output logic [63:0] p3_TDATA,
	input logic [0:0] p3_TREADY,
	output logic [0:0] p3_TVALID,
	output logic [63:0] p4_TDATA,
	input logic [0:0] p4_TREADY,
	output logic [0:0] p4_TVALID,
	output logic [63:0] p5_TDATA,
	input logic [0:0] p5_TREADY,
	output logic [0:0] p5_TVALID,
	output logic [63:0] p6_TDATA,
	input logic [0:0] p6_TREADY,
	output logic [0:0] p6_TVALID,
	output logic [63:0] p7_TDATA,
	input logic [0:0] p7_TREADY,
	output logic [0:0] p7_TVALID,
	input logic [31:0] s_axi_control_ARADDR,
	output logic [0:0] s_axi_control_ARREADY,
	input logic [0:0] s_axi_control_ARVALID,
	input logic [31:0] s_axi_control_AWADDR,
	output logic [0:0] s_axi_control_AWREADY,
	input logic [0:0] s_axi_control_AWVALID,
	input logic [0:0] s_axi_control_BREADY,
	output logic [1:0] s_axi_control_BRESP,
	output logic [0:0] s_axi_control_BVALID,
	output logic [31:0] s_axi_control_RDATA,
	input logic [0:0] s_axi_control_RREADY,
	output logic [1:0] s_axi_control_RRESP,
	output logic [0:0] s_axi_control_RVALID,
	input logic [31:0] s_axi_control_WDATA,
	output logic [0:0] s_axi_control_WREADY,
	input logic [3:0] s_axi_control_WSTRB,
	input logic [0:0] s_axi_control_WVALID
);

logic [7:0] kernel_count_zero;
logic [7:0] kernel_count_zero_ack;
logic [7:0] krnl_write_start;
logic [0:0] areset;
logic [0:0] areset2;
logic [0:0] ap_start;
logic [0:0] ap_done;
logic [0:0] ap_ready;
logic [0:0] ap_idle;
logic [0:0] ap_start_r;
logic [0:0] ap_start_pulse;
logic [0:0] ctrl_rd_fifo_prog_full;
logic [63:0] read_ptr;
logic [31:0] read_len;
logic [31:0] ptr_first;
logic [0:0] ptr_first_d = 1'd0;
logic [0:0] ptr_first_f = 1'd0;
logic [0:0] read_fifo_m_tvalid;
logic [511:0] read_fifo_m_tdata;
logic [0:0] read_fifo_m_tready;
logic [0:0] read_krnl_s_tvalid;
logic [511:0] read_krnl_s_tdata;
logic [0:0] read_krnl_s_tready;
logic [0:0] read_fifo_m_tready_n;
logic [0:0] read_krnl_s_tvalid_n;
logic [63:0] write_ptr_0;
logic [63:0] mem_ptr_0;
logic [63:0] mem_ptr_slow_0;
logic [63:0] write_ptr_1;
logic [63:0] mem_ptr_1;
logic [63:0] mem_ptr_slow_1;
logic [63:0] write_ptr_2;
logic [63:0] mem_ptr_2;
logic [63:0] mem_ptr_slow_2;
logic [63:0] write_ptr_3;
logic [63:0] mem_ptr_3;
logic [63:0] mem_ptr_slow_3;
logic [63:0] write_ptr_4;
logic [63:0] mem_ptr_4;
logic [63:0] mem_ptr_slow_4;
logic [63:0] write_ptr_5;
logic [63:0] mem_ptr_5;
logic [63:0] mem_ptr_slow_5;
logic [63:0] write_ptr_6;
logic [63:0] mem_ptr_6;
logic [63:0] mem_ptr_slow_6;
logic [63:0] write_ptr_7;
logic [63:0] mem_ptr_7;
logic [63:0] mem_ptr_slow_7;
logic [0:0] wr_fifo_out_0_m_tvalid;
logic [511:0] wr_fifo_out_0_m_tdata;
logic [0:0] wr_fifo_out_0_m_tready;
logic [0:0] krnl_hll_out_0_m_tvalid;
logic [511:0] krnl_hll_out_0_m_tdata;
logic [0:0] krnl_hll_out_0_m_tready;
logic [0:0] wr_fifo_out_0_m_tvalid_n;
logic [0:0] wr_fifo_out_1_m_tvalid;
logic [511:0] wr_fifo_out_1_m_tdata;
logic [0:0] wr_fifo_out_1_m_tready;
logic [0:0] krnl_hll_out_1_m_tvalid;
logic [511:0] krnl_hll_out_1_m_tdata;
logic [0:0] krnl_hll_out_1_m_tready;
logic [0:0] wr_fifo_out_1_m_tvalid_n;
logic [0:0] wr_fifo_out_2_m_tvalid;
logic [511:0] wr_fifo_out_2_m_tdata;
logic [0:0] wr_fifo_out_2_m_tready;
logic [0:0] krnl_hll_out_2_m_tvalid;
logic [511:0] krnl_hll_out_2_m_tdata;
logic [0:0] krnl_hll_out_2_m_tready;
logic [0:0] wr_fifo_out_2_m_tvalid_n;
logic [0:0] wr_fifo_out_3_m_tvalid;
logic [511:0] wr_fifo_out_3_m_tdata;
logic [0:0] wr_fifo_out_3_m_tready;
logic [0:0] krnl_hll_out_3_m_tvalid;
logic [511:0] krnl_hll_out_3_m_tdata;
logic [0:0] krnl_hll_out_3_m_tready;
logic [0:0] wr_fifo_out_3_m_tvalid_n;
logic [0:0] wr_fifo_out_4_m_tvalid;
logic [511:0] wr_fifo_out_4_m_tdata;
logic [0:0] wr_fifo_out_4_m_tready;
logic [0:0] krnl_hll_out_4_m_tvalid;
logic [511:0] krnl_hll_out_4_m_tdata;
logic [0:0] krnl_hll_out_4_m_tready;
logic [0:0] wr_fifo_out_4_m_tvalid_n;
logic [0:0] wr_fifo_out_5_m_tvalid;
logic [511:0] wr_fifo_out_5_m_tdata;
logic [0:0] wr_fifo_out_5_m_tready;
logic [0:0] krnl_hll_out_5_m_tvalid;
logic [511:0] krnl_hll_out_5_m_tdata;
logic [0:0] krnl_hll_out_5_m_tready;
logic [0:0] wr_fifo_out_5_m_tvalid_n;
logic [0:0] wr_fifo_out_6_m_tvalid;
logic [511:0] wr_fifo_out_6_m_tdata;
logic [0:0] wr_fifo_out_6_m_tready;
logic [0:0] krnl_hll_out_6_m_tvalid;
logic [511:0] krnl_hll_out_6_m_tdata;
logic [0:0] krnl_hll_out_6_m_tready;
logic [0:0] wr_fifo_out_6_m_tvalid_n;
logic [0:0] wr_fifo_out_7_m_tvalid;
logic [511:0] wr_fifo_out_7_m_tdata;
logic [0:0] wr_fifo_out_7_m_tready;
logic [0:0] krnl_hll_out_7_m_tvalid;
logic [511:0] krnl_hll_out_7_m_tdata;
logic [0:0] krnl_hll_out_7_m_tready;
logic [0:0] wr_fifo_out_7_m_tvalid_n;
logic [0:0] krnl_hll_out_0_m_tready_n;
logic [0:0] krnl_hll_out_1_m_tready_n;
logic [0:0] krnl_hll_out_2_m_tready_n;
logic [0:0] krnl_hll_out_3_m_tready_n;
logic [0:0] krnl_hll_out_4_m_tready_n;
logic [0:0] krnl_hll_out_5_m_tready_n;
logic [0:0] krnl_hll_out_6_m_tready_n;
logic [0:0] krnl_hll_out_7_m_tready_n;

krnl_hll_rtl_control_s_axi krnl_hll_rtl_control_s_axi_inst0 (
	.ARADDR (s_axi_control_ARADDR),
	.ARREADY (s_axi_control_ARREADY),
	.ARVALID (s_axi_control_ARVALID),
	.AWADDR (s_axi_control_AWADDR),
	.AWREADY (s_axi_control_AWREADY),
	.AWVALID (s_axi_control_AWVALID),
	.BREADY (s_axi_control_BREADY),
	.BRESP (s_axi_control_BRESP),
	.BVALID (s_axi_control_BVALID),
	.RDATA (s_axi_control_RDATA),
	.RREADY (s_axi_control_RREADY),
	.RRESP (s_axi_control_RRESP),
	.RVALID (s_axi_control_RVALID),
	.WDATA (s_axi_control_WDATA),
	.WREADY (s_axi_control_WREADY),
	.WSTRB (s_axi_control_WSTRB),
	.WVALID (s_axi_control_WVALID),
	.aclk (ap_aclk),
	.aclken (1'd1),
	.ap_done (ap_done),
	.ap_idle (ap_idle),
	.ap_ready (ap_ready),
	.ap_start (ap_start),
	.areset (areset),
	.arg_0 (read_ptr),
	.arg_1 (read_len),
	.arg_10 (write_ptr_7),
	.arg_2 (ptr_first),
	.arg_3 (write_ptr_0),
	.arg_4 (write_ptr_1),
	.arg_5 (write_ptr_2),
	.arg_6 (write_ptr_3),
	.arg_7 (write_ptr_4),
	.arg_8 (write_ptr_5),
	.arg_9 (write_ptr_6),
	.interrupt ()
);

krnl_hll_rtl_axi_read_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_ID_WIDTH (1),
	.C_LENGTH_WIDTH (32),
	.C_LOG_BURST_LEN (6),
	.C_MAX_OUTSTANDING (3),
	.C_NUM_CHANNELS (1)
) krnl_hll_rtl_axi_read_master_inst1 (
	.aclk (ap_aclk),
	.araddr (m_axi_gmem_0_ARADDR),
	.areset (areset),
	.arid (m_axi_gmem_0_ARID),
	.arlen (m_axi_gmem_0_ARLEN),
	.arready (m_axi_gmem_0_ARREADY),
	.arsize (m_axi_gmem_0_ARSIZE),
	.arvalid (m_axi_gmem_0_ARVALID),
	.ctrl_done (ap_done),
	.ctrl_length (read_len),
	.ctrl_offset (read_ptr),
	.ctrl_prog_full (ctrl_rd_fifo_prog_full),
	.ctrl_start (ap_start_pulse),
	.m_tdata (read_fifo_m_tdata),
	.m_tready (read_fifo_m_tready),
	.m_tvalid (read_fifo_m_tvalid),
	.rdata (m_axi_gmem_0_RDATA),
	.rid (m_axi_gmem_0_RID),
	.rlast (m_axi_gmem_0_RLAST),
	.rready (m_axi_gmem_0_RREADY),
	.rresp (m_axi_gmem_0_RRESP),
	.rvalid (m_axi_gmem_0_RVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (256),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (62),
	.RD_DATA_COUNT_WIDTH (9),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (9)
) xpm_fifo_async_inst2 (
	.dbiterr (),
	.din (read_fifo_m_tdata),
	.dout (read_krnl_s_tdata),
	.empty (read_krnl_s_tvalid_n),
	.full (read_fifo_m_tready_n),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (ctrl_rd_fifo_prog_full),
	.rd_clk (ap_aclk_2),
	.rd_data_count (),
	.rd_en (read_krnl_s_tready),
	.rd_rst_busy (),
	.rst (areset),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk),
	.wr_data_count (),
	.wr_en (read_fifo_m_tvalid),
	.wr_rst_busy ()
);

kernel_wrapper kernel_wrapper_inst3 (
	.aclk (ap_aclk_2),
	.areset (areset2),
	.cardinality_id_0 (p0_TDATA),
	.cardinality_id_1 (p1_TDATA),
	.cardinality_id_2 (p2_TDATA),
	.cardinality_id_3 (p3_TDATA),
	.cardinality_id_4 (p4_TDATA),
	.cardinality_id_5 (p5_TDATA),
	.cardinality_id_6 (p6_TDATA),
	.cardinality_id_7 (p7_TDATA),
	.cardinality_ready_0 (p0_TREADY),
	.cardinality_ready_1 (p1_TREADY),
	.cardinality_ready_2 (p2_TREADY),
	.cardinality_ready_3 (p3_TREADY),
	.cardinality_ready_4 (p4_TREADY),
	.cardinality_ready_5 (p5_TREADY),
	.cardinality_ready_6 (p6_TREADY),
	.cardinality_ready_7 (p7_TREADY),
	.cardinality_valid_0 (p0_TVALID),
	.cardinality_valid_1 (p1_TVALID),
	.cardinality_valid_2 (p2_TVALID),
	.cardinality_valid_3 (p3_TVALID),
	.cardinality_valid_4 (p4_TVALID),
	.cardinality_valid_5 (p5_TVALID),
	.cardinality_valid_6 (p6_TVALID),
	.cardinality_valid_7 (p7_TVALID),
	.count_zero (kernel_count_zero),
	.count_zero_ack (kernel_count_zero_ack),
	.s0m_tdata (krnl_hll_out_0_m_tdata),
	.s0m_tready (krnl_hll_out_0_m_tready),
	.s0m_tvalid (krnl_hll_out_0_m_tvalid),
	.s1m_tdata (krnl_hll_out_1_m_tdata),
	.s1m_tready (krnl_hll_out_1_m_tready),
	.s1m_tvalid (krnl_hll_out_1_m_tvalid),
	.s2m_tdata (krnl_hll_out_2_m_tdata),
	.s2m_tready (krnl_hll_out_2_m_tready),
	.s2m_tvalid (krnl_hll_out_2_m_tvalid),
	.s3m_tdata (krnl_hll_out_3_m_tdata),
	.s3m_tready (krnl_hll_out_3_m_tready),
	.s3m_tvalid (krnl_hll_out_3_m_tvalid),
	.s4m_tdata (krnl_hll_out_4_m_tdata),
	.s4m_tready (krnl_hll_out_4_m_tready),
	.s4m_tvalid (krnl_hll_out_4_m_tvalid),
	.s5m_tdata (krnl_hll_out_5_m_tdata),
	.s5m_tready (krnl_hll_out_5_m_tready),
	.s5m_tvalid (krnl_hll_out_5_m_tvalid),
	.s6m_tdata (krnl_hll_out_6_m_tdata),
	.s6m_tready (krnl_hll_out_6_m_tready),
	.s6m_tvalid (krnl_hll_out_6_m_tvalid),
	.s7m_tdata (krnl_hll_out_7_m_tdata),
	.s7m_tready (krnl_hll_out_7_m_tready),
	.s7m_tvalid (krnl_hll_out_7_m_tvalid),
	.s_tdata (read_krnl_s_tdata),
	.s_tready (read_krnl_s_tready),
	.s_tvalid (read_krnl_s_tvalid),
	.sketch_ptr_0 (write_ptr_0),
	.sketch_ptr_1 (write_ptr_1),
	.sketch_ptr_2 (write_ptr_2),
	.sketch_ptr_3 (write_ptr_3),
	.sketch_ptr_4 (write_ptr_4),
	.sketch_ptr_5 (write_ptr_5),
	.sketch_ptr_6 (write_ptr_6),
	.sketch_ptr_7 (write_ptr_7),
	.sketch_ptr_out_0 (mem_ptr_0),
	.sketch_ptr_out_1 (mem_ptr_1),
	.sketch_ptr_out_2 (mem_ptr_2),
	.sketch_ptr_out_3 (mem_ptr_3),
	.sketch_ptr_out_4 (mem_ptr_4),
	.sketch_ptr_out_5 (mem_ptr_5),
	.sketch_ptr_out_6 (mem_ptr_6),
	.sketch_ptr_out_7 (mem_ptr_7),
	.sketch_ptr_source (ptr_first_f)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (64),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (59),
	.RD_DATA_COUNT_WIDTH (7),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (7)
) xpm_fifo_async_inst4 (
	.dbiterr (),
	.din (krnl_hll_out_0_m_tdata),
	.dout (wr_fifo_out_0_m_tdata),
	.empty (wr_fifo_out_0_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (krnl_hll_out_0_m_tready_n),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_0_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_hll_out_0_m_tvalid),
	.wr_rst_busy ()
);

krnl_hll_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_hll_rtl_axi_write_master_inst5 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_0_AWADDR),
	.awlen (m_axi_gmem_0_AWLEN),
	.awready (m_axi_gmem_0_AWREADY),
	.awsize (m_axi_gmem_0_AWSIZE),
	.awvalid (m_axi_gmem_0_AWVALID),
	.bready (m_axi_gmem_0_BREADY),
	.bresp (m_axi_gmem_0_BRESP),
	.bvalid (m_axi_gmem_0_BVALID),
	.ctrl_done (),
	.ctrl_length (8'd128),
	.ctrl_offset (mem_ptr_slow_0),
	.ctrl_start (krnl_write_start[0]),
	.s_tdata (wr_fifo_out_0_m_tdata),
	.s_tready (wr_fifo_out_0_m_tready),
	.s_tvalid (wr_fifo_out_0_m_tvalid),
	.wdata (m_axi_gmem_0_WDATA),
	.wlast (m_axi_gmem_0_WLAST),
	.wready (m_axi_gmem_0_WREADY),
	.wstrb (m_axi_gmem_0_WSTRB),
	.wvalid (m_axi_gmem_0_WVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (64),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (59),
	.RD_DATA_COUNT_WIDTH (7),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (7)
) xpm_fifo_async_inst6 (
	.dbiterr (),
	.din (krnl_hll_out_1_m_tdata),
	.dout (wr_fifo_out_1_m_tdata),
	.empty (wr_fifo_out_1_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (krnl_hll_out_1_m_tready_n),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_1_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_hll_out_1_m_tvalid),
	.wr_rst_busy ()
);

krnl_hll_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_hll_rtl_axi_write_master_inst7 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_1_AWADDR),
	.awlen (m_axi_gmem_1_AWLEN),
	.awready (m_axi_gmem_1_AWREADY),
	.awsize (m_axi_gmem_1_AWSIZE),
	.awvalid (m_axi_gmem_1_AWVALID),
	.bready (m_axi_gmem_1_BREADY),
	.bresp (m_axi_gmem_1_BRESP),
	.bvalid (m_axi_gmem_1_BVALID),
	.ctrl_done (),
	.ctrl_length (8'd128),
	.ctrl_offset (mem_ptr_slow_1),
	.ctrl_start (krnl_write_start[1]),
	.s_tdata (wr_fifo_out_1_m_tdata),
	.s_tready (wr_fifo_out_1_m_tready),
	.s_tvalid (wr_fifo_out_1_m_tvalid),
	.wdata (m_axi_gmem_1_WDATA),
	.wlast (m_axi_gmem_1_WLAST),
	.wready (m_axi_gmem_1_WREADY),
	.wstrb (m_axi_gmem_1_WSTRB),
	.wvalid (m_axi_gmem_1_WVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (64),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (59),
	.RD_DATA_COUNT_WIDTH (7),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (7)
) xpm_fifo_async_inst8 (
	.dbiterr (),
	.din (krnl_hll_out_2_m_tdata),
	.dout (wr_fifo_out_2_m_tdata),
	.empty (wr_fifo_out_2_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (krnl_hll_out_2_m_tready_n),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_2_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_hll_out_2_m_tvalid),
	.wr_rst_busy ()
);

krnl_hll_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_hll_rtl_axi_write_master_inst9 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_2_AWADDR),
	.awlen (m_axi_gmem_2_AWLEN),
	.awready (m_axi_gmem_2_AWREADY),
	.awsize (m_axi_gmem_2_AWSIZE),
	.awvalid (m_axi_gmem_2_AWVALID),
	.bready (m_axi_gmem_2_BREADY),
	.bresp (m_axi_gmem_2_BRESP),
	.bvalid (m_axi_gmem_2_BVALID),
	.ctrl_done (),
	.ctrl_length (8'd128),
	.ctrl_offset (mem_ptr_slow_2),
	.ctrl_start (krnl_write_start[2]),
	.s_tdata (wr_fifo_out_2_m_tdata),
	.s_tready (wr_fifo_out_2_m_tready),
	.s_tvalid (wr_fifo_out_2_m_tvalid),
	.wdata (m_axi_gmem_2_WDATA),
	.wlast (m_axi_gmem_2_WLAST),
	.wready (m_axi_gmem_2_WREADY),
	.wstrb (m_axi_gmem_2_WSTRB),
	.wvalid (m_axi_gmem_2_WVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (64),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (59),
	.RD_DATA_COUNT_WIDTH (7),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (7)
) xpm_fifo_async_inst10 (
	.dbiterr (),
	.din (krnl_hll_out_3_m_tdata),
	.dout (wr_fifo_out_3_m_tdata),
	.empty (wr_fifo_out_3_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (krnl_hll_out_3_m_tready_n),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_3_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_hll_out_3_m_tvalid),
	.wr_rst_busy ()
);

krnl_hll_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_hll_rtl_axi_write_master_inst11 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_3_AWADDR),
	.awlen (m_axi_gmem_3_AWLEN),
	.awready (m_axi_gmem_3_AWREADY),
	.awsize (m_axi_gmem_3_AWSIZE),
	.awvalid (m_axi_gmem_3_AWVALID),
	.bready (m_axi_gmem_3_BREADY),
	.bresp (m_axi_gmem_3_BRESP),
	.bvalid (m_axi_gmem_3_BVALID),
	.ctrl_done (),
	.ctrl_length (8'd128),
	.ctrl_offset (mem_ptr_slow_3),
	.ctrl_start (krnl_write_start[3]),
	.s_tdata (wr_fifo_out_3_m_tdata),
	.s_tready (wr_fifo_out_3_m_tready),
	.s_tvalid (wr_fifo_out_3_m_tvalid),
	.wdata (m_axi_gmem_3_WDATA),
	.wlast (m_axi_gmem_3_WLAST),
	.wready (m_axi_gmem_3_WREADY),
	.wstrb (m_axi_gmem_3_WSTRB),
	.wvalid (m_axi_gmem_3_WVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (64),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (59),
	.RD_DATA_COUNT_WIDTH (7),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (7)
) xpm_fifo_async_inst12 (
	.dbiterr (),
	.din (krnl_hll_out_4_m_tdata),
	.dout (wr_fifo_out_4_m_tdata),
	.empty (wr_fifo_out_4_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (krnl_hll_out_4_m_tready_n),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_4_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_hll_out_4_m_tvalid),
	.wr_rst_busy ()
);

krnl_hll_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_hll_rtl_axi_write_master_inst13 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_4_AWADDR),
	.awlen (m_axi_gmem_4_AWLEN),
	.awready (m_axi_gmem_4_AWREADY),
	.awsize (m_axi_gmem_4_AWSIZE),
	.awvalid (m_axi_gmem_4_AWVALID),
	.bready (m_axi_gmem_4_BREADY),
	.bresp (m_axi_gmem_4_BRESP),
	.bvalid (m_axi_gmem_4_BVALID),
	.ctrl_done (),
	.ctrl_length (8'd128),
	.ctrl_offset (mem_ptr_slow_4),
	.ctrl_start (krnl_write_start[4]),
	.s_tdata (wr_fifo_out_4_m_tdata),
	.s_tready (wr_fifo_out_4_m_tready),
	.s_tvalid (wr_fifo_out_4_m_tvalid),
	.wdata (m_axi_gmem_4_WDATA),
	.wlast (m_axi_gmem_4_WLAST),
	.wready (m_axi_gmem_4_WREADY),
	.wstrb (m_axi_gmem_4_WSTRB),
	.wvalid (m_axi_gmem_4_WVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (64),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (59),
	.RD_DATA_COUNT_WIDTH (7),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (7)
) xpm_fifo_async_inst14 (
	.dbiterr (),
	.din (krnl_hll_out_5_m_tdata),
	.dout (wr_fifo_out_5_m_tdata),
	.empty (wr_fifo_out_5_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (krnl_hll_out_5_m_tready_n),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_5_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_hll_out_5_m_tvalid),
	.wr_rst_busy ()
);

krnl_hll_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_hll_rtl_axi_write_master_inst15 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_5_AWADDR),
	.awlen (m_axi_gmem_5_AWLEN),
	.awready (m_axi_gmem_5_AWREADY),
	.awsize (m_axi_gmem_5_AWSIZE),
	.awvalid (m_axi_gmem_5_AWVALID),
	.bready (m_axi_gmem_5_BREADY),
	.bresp (m_axi_gmem_5_BRESP),
	.bvalid (m_axi_gmem_5_BVALID),
	.ctrl_done (),
	.ctrl_length (8'd128),
	.ctrl_offset (mem_ptr_slow_5),
	.ctrl_start (krnl_write_start[5]),
	.s_tdata (wr_fifo_out_5_m_tdata),
	.s_tready (wr_fifo_out_5_m_tready),
	.s_tvalid (wr_fifo_out_5_m_tvalid),
	.wdata (m_axi_gmem_5_WDATA),
	.wlast (m_axi_gmem_5_WLAST),
	.wready (m_axi_gmem_5_WREADY),
	.wstrb (m_axi_gmem_5_WSTRB),
	.wvalid (m_axi_gmem_5_WVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (64),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (59),
	.RD_DATA_COUNT_WIDTH (7),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (7)
) xpm_fifo_async_inst16 (
	.dbiterr (),
	.din (krnl_hll_out_6_m_tdata),
	.dout (wr_fifo_out_6_m_tdata),
	.empty (wr_fifo_out_6_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (krnl_hll_out_6_m_tready_n),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_6_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_hll_out_6_m_tvalid),
	.wr_rst_busy ()
);

krnl_hll_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_hll_rtl_axi_write_master_inst17 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_6_AWADDR),
	.awlen (m_axi_gmem_6_AWLEN),
	.awready (m_axi_gmem_6_AWREADY),
	.awsize (m_axi_gmem_6_AWSIZE),
	.awvalid (m_axi_gmem_6_AWVALID),
	.bready (m_axi_gmem_6_BREADY),
	.bresp (m_axi_gmem_6_BRESP),
	.bvalid (m_axi_gmem_6_BVALID),
	.ctrl_done (),
	.ctrl_length (8'd128),
	.ctrl_offset (mem_ptr_slow_6),
	.ctrl_start (krnl_write_start[6]),
	.s_tdata (wr_fifo_out_6_m_tdata),
	.s_tready (wr_fifo_out_6_m_tready),
	.s_tvalid (wr_fifo_out_6_m_tvalid),
	.wdata (m_axi_gmem_6_WDATA),
	.wlast (m_axi_gmem_6_WLAST),
	.wready (m_axi_gmem_6_WREADY),
	.wstrb (m_axi_gmem_6_WSTRB),
	.wvalid (m_axi_gmem_6_WVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (64),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (59),
	.RD_DATA_COUNT_WIDTH (7),
	.READ_DATA_WIDTH (512),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (512),
	.WR_DATA_COUNT_WIDTH (7)
) xpm_fifo_async_inst18 (
	.dbiterr (),
	.din (krnl_hll_out_7_m_tdata),
	.dout (wr_fifo_out_7_m_tdata),
	.empty (wr_fifo_out_7_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (krnl_hll_out_7_m_tready_n),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_7_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_hll_out_7_m_tvalid),
	.wr_rst_busy ()
);

krnl_hll_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_hll_rtl_axi_write_master_inst19 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_7_AWADDR),
	.awlen (m_axi_gmem_7_AWLEN),
	.awready (m_axi_gmem_7_AWREADY),
	.awsize (m_axi_gmem_7_AWSIZE),
	.awvalid (m_axi_gmem_7_AWVALID),
	.bready (m_axi_gmem_7_BREADY),
	.bresp (m_axi_gmem_7_BRESP),
	.bvalid (m_axi_gmem_7_BVALID),
	.ctrl_done (),
	.ctrl_length (8'd128),
	.ctrl_offset (mem_ptr_slow_7),
	.ctrl_start (krnl_write_start[7]),
	.s_tdata (wr_fifo_out_7_m_tdata),
	.s_tready (wr_fifo_out_7_m_tready),
	.s_tvalid (wr_fifo_out_7_m_tvalid),
	.wdata (m_axi_gmem_7_WDATA),
	.wlast (m_axi_gmem_7_WLAST),
	.wready (m_axi_gmem_7_WREADY),
	.wstrb (m_axi_gmem_7_WSTRB),
	.wvalid (m_axi_gmem_7_WVALID)
);

always_ff @(posedge ap_aclk) begin
	areset <= ! ap_rst_n;
end

always_ff @(posedge ap_aclk_2) begin
	areset2 <= ! ap_rst_n_2;
end

always_ff @(posedge ap_aclk) begin
	ap_start_r <= ap_start;
	ap_start_pulse <= ap_start & (! ap_start_r);

	if (areset) begin
		ap_idle <= 1'd1;
	end
	else if (ap_done) begin
		ap_idle <= 1'd1;
	end
	else if (ap_start_pulse) begin
		ap_idle <= 1'd0;
	end
	else begin
		ap_idle <= ap_idle;
	end
end

always_comb begin
	ap_ready = ap_done;
end

always_comb begin
	read_fifo_m_tready = ! read_fifo_m_tready_n;
end

always_comb begin
	read_krnl_s_tvalid = ! read_krnl_s_tvalid_n;
end

always_comb begin
	m_axi_gmem_0_AWID = 1'd0;
	m_axi_gmem_0_AWBURST = 2'd1;
	m_axi_gmem_0_AWLOCK = 2'd0;
	m_axi_gmem_0_AWCACHE = 4'd3;
	m_axi_gmem_0_AWPROT = 3'd0;
	m_axi_gmem_0_AWQOS = 4'd0;
	m_axi_gmem_0_AWREGION = 4'd0;
	m_axi_gmem_0_ARBURST = 2'd1;
	m_axi_gmem_0_ARLOCK = 2'd0;
	m_axi_gmem_0_ARCACHE = 4'd3;
	m_axi_gmem_0_ARPROT = 3'd0;
	m_axi_gmem_0_ARQOS = 4'd0;
	m_axi_gmem_0_ARREGION = 4'd0;
end

always_comb begin
	m_axi_gmem_1_AWID = 1'd0;
	m_axi_gmem_1_AWBURST = 2'd1;
	m_axi_gmem_1_AWLOCK = 2'd0;
	m_axi_gmem_1_AWCACHE = 4'd3;
	m_axi_gmem_1_AWPROT = 3'd0;
	m_axi_gmem_1_AWQOS = 4'd0;
	m_axi_gmem_1_AWREGION = 4'd0;
	m_axi_gmem_1_ARBURST = 2'd1;
	m_axi_gmem_1_ARLOCK = 2'd0;
	m_axi_gmem_1_ARCACHE = 4'd3;
	m_axi_gmem_1_ARPROT = 3'd0;
	m_axi_gmem_1_ARQOS = 4'd0;
	m_axi_gmem_1_ARREGION = 4'd0;
	m_axi_gmem_1_ARVALID = 1'd0;
	m_axi_gmem_1_ARADDR = 64'd0;
	m_axi_gmem_1_ARID = 1'd0;
	m_axi_gmem_1_ARLEN = 8'd0;
	m_axi_gmem_1_ARSIZE = 3'd0;
	m_axi_gmem_1_RREADY = 1'd0;
end

always_comb begin
	m_axi_gmem_2_AWID = 1'd0;
	m_axi_gmem_2_AWBURST = 2'd1;
	m_axi_gmem_2_AWLOCK = 2'd0;
	m_axi_gmem_2_AWCACHE = 4'd3;
	m_axi_gmem_2_AWPROT = 3'd0;
	m_axi_gmem_2_AWQOS = 4'd0;
	m_axi_gmem_2_AWREGION = 4'd0;
	m_axi_gmem_2_ARBURST = 2'd1;
	m_axi_gmem_2_ARLOCK = 2'd0;
	m_axi_gmem_2_ARCACHE = 4'd3;
	m_axi_gmem_2_ARPROT = 3'd0;
	m_axi_gmem_2_ARQOS = 4'd0;
	m_axi_gmem_2_ARREGION = 4'd0;
	m_axi_gmem_2_ARVALID = 1'd0;
	m_axi_gmem_2_ARADDR = 64'd0;
	m_axi_gmem_2_ARID = 1'd0;
	m_axi_gmem_2_ARLEN = 8'd0;
	m_axi_gmem_2_ARSIZE = 3'd0;
	m_axi_gmem_2_RREADY = 1'd0;
end

always_comb begin
	m_axi_gmem_3_AWID = 1'd0;
	m_axi_gmem_3_AWBURST = 2'd1;
	m_axi_gmem_3_AWLOCK = 2'd0;
	m_axi_gmem_3_AWCACHE = 4'd3;
	m_axi_gmem_3_AWPROT = 3'd0;
	m_axi_gmem_3_AWQOS = 4'd0;
	m_axi_gmem_3_AWREGION = 4'd0;
	m_axi_gmem_3_ARBURST = 2'd1;
	m_axi_gmem_3_ARLOCK = 2'd0;
	m_axi_gmem_3_ARCACHE = 4'd3;
	m_axi_gmem_3_ARPROT = 3'd0;
	m_axi_gmem_3_ARQOS = 4'd0;
	m_axi_gmem_3_ARREGION = 4'd0;
	m_axi_gmem_3_ARVALID = 1'd0;
	m_axi_gmem_3_ARADDR = 64'd0;
	m_axi_gmem_3_ARID = 1'd0;
	m_axi_gmem_3_ARLEN = 8'd0;
	m_axi_gmem_3_ARSIZE = 3'd0;
	m_axi_gmem_3_RREADY = 1'd0;
end

always_comb begin
	m_axi_gmem_4_AWID = 1'd0;
	m_axi_gmem_4_AWBURST = 2'd1;
	m_axi_gmem_4_AWLOCK = 2'd0;
	m_axi_gmem_4_AWCACHE = 4'd3;
	m_axi_gmem_4_AWPROT = 3'd0;
	m_axi_gmem_4_AWQOS = 4'd0;
	m_axi_gmem_4_AWREGION = 4'd0;
	m_axi_gmem_4_ARBURST = 2'd1;
	m_axi_gmem_4_ARLOCK = 2'd0;
	m_axi_gmem_4_ARCACHE = 4'd3;
	m_axi_gmem_4_ARPROT = 3'd0;
	m_axi_gmem_4_ARQOS = 4'd0;
	m_axi_gmem_4_ARREGION = 4'd0;
	m_axi_gmem_4_ARVALID = 1'd0;
	m_axi_gmem_4_ARADDR = 64'd0;
	m_axi_gmem_4_ARID = 1'd0;
	m_axi_gmem_4_ARLEN = 8'd0;
	m_axi_gmem_4_ARSIZE = 3'd0;
	m_axi_gmem_4_RREADY = 1'd0;
end

always_comb begin
	m_axi_gmem_5_AWID = 1'd0;
	m_axi_gmem_5_AWBURST = 2'd1;
	m_axi_gmem_5_AWLOCK = 2'd0;
	m_axi_gmem_5_AWCACHE = 4'd3;
	m_axi_gmem_5_AWPROT = 3'd0;
	m_axi_gmem_5_AWQOS = 4'd0;
	m_axi_gmem_5_AWREGION = 4'd0;
	m_axi_gmem_5_ARBURST = 2'd1;
	m_axi_gmem_5_ARLOCK = 2'd0;
	m_axi_gmem_5_ARCACHE = 4'd3;
	m_axi_gmem_5_ARPROT = 3'd0;
	m_axi_gmem_5_ARQOS = 4'd0;
	m_axi_gmem_5_ARREGION = 4'd0;
	m_axi_gmem_5_ARVALID = 1'd0;
	m_axi_gmem_5_ARADDR = 64'd0;
	m_axi_gmem_5_ARID = 1'd0;
	m_axi_gmem_5_ARLEN = 8'd0;
	m_axi_gmem_5_ARSIZE = 3'd0;
	m_axi_gmem_5_RREADY = 1'd0;
end

always_comb begin
	m_axi_gmem_6_AWID = 1'd0;
	m_axi_gmem_6_AWBURST = 2'd1;
	m_axi_gmem_6_AWLOCK = 2'd0;
	m_axi_gmem_6_AWCACHE = 4'd3;
	m_axi_gmem_6_AWPROT = 3'd0;
	m_axi_gmem_6_AWQOS = 4'd0;
	m_axi_gmem_6_AWREGION = 4'd0;
	m_axi_gmem_6_ARBURST = 2'd1;
	m_axi_gmem_6_ARLOCK = 2'd0;
	m_axi_gmem_6_ARCACHE = 4'd3;
	m_axi_gmem_6_ARPROT = 3'd0;
	m_axi_gmem_6_ARQOS = 4'd0;
	m_axi_gmem_6_ARREGION = 4'd0;
	m_axi_gmem_6_ARVALID = 1'd0;
	m_axi_gmem_6_ARADDR = 64'd0;
	m_axi_gmem_6_ARID = 1'd0;
	m_axi_gmem_6_ARLEN = 8'd0;
	m_axi_gmem_6_ARSIZE = 3'd0;
	m_axi_gmem_6_RREADY = 1'd0;
end

always_comb begin
	m_axi_gmem_7_AWID = 1'd0;
	m_axi_gmem_7_AWBURST = 2'd1;
	m_axi_gmem_7_AWLOCK = 2'd0;
	m_axi_gmem_7_AWCACHE = 4'd3;
	m_axi_gmem_7_AWPROT = 3'd0;
	m_axi_gmem_7_AWQOS = 4'd0;
	m_axi_gmem_7_AWREGION = 4'd0;
	m_axi_gmem_7_ARBURST = 2'd1;
	m_axi_gmem_7_ARLOCK = 2'd0;
	m_axi_gmem_7_ARCACHE = 4'd3;
	m_axi_gmem_7_ARPROT = 3'd0;
	m_axi_gmem_7_ARQOS = 4'd0;
	m_axi_gmem_7_ARREGION = 4'd0;
	m_axi_gmem_7_ARVALID = 1'd0;
	m_axi_gmem_7_ARADDR = 64'd0;
	m_axi_gmem_7_ARID = 1'd0;
	m_axi_gmem_7_ARLEN = 8'd0;
	m_axi_gmem_7_ARSIZE = 3'd0;
	m_axi_gmem_7_RREADY = 1'd0;
end

always_comb begin
	wr_fifo_out_0_m_tvalid = ! wr_fifo_out_0_m_tvalid_n;
end

always_comb begin
	wr_fifo_out_1_m_tvalid = ! wr_fifo_out_1_m_tvalid_n;
end

always_comb begin
	wr_fifo_out_2_m_tvalid = ! wr_fifo_out_2_m_tvalid_n;
end

always_comb begin
	wr_fifo_out_3_m_tvalid = ! wr_fifo_out_3_m_tvalid_n;
end

always_comb begin
	wr_fifo_out_4_m_tvalid = ! wr_fifo_out_4_m_tvalid_n;
end

always_comb begin
	wr_fifo_out_5_m_tvalid = ! wr_fifo_out_5_m_tvalid_n;
end

always_comb begin
	wr_fifo_out_6_m_tvalid = ! wr_fifo_out_6_m_tvalid_n;
end

always_comb begin
	wr_fifo_out_7_m_tvalid = ! wr_fifo_out_7_m_tvalid_n;
end

always_ff @(posedge ap_aclk) begin
	ptr_first_d <= ptr_first & ap_start;
end

always_ff @(posedge ap_aclk_2) begin
	ptr_first_f <= ptr_first_d;
end

always_ff @(posedge ap_aclk) begin

	if (kernel_count_zero[0]) begin
		kernel_count_zero_ack[0] <= 1'd1;
		krnl_write_start[0] <= 1'd1;
	end
	else begin
		kernel_count_zero_ack[0] <= 1'd0;
		krnl_write_start[0] <= 1'd0;
	end

	if (kernel_count_zero[1]) begin
		kernel_count_zero_ack[1] <= 1'd1;
		krnl_write_start[1] <= 1'd1;
	end
	else begin
		kernel_count_zero_ack[1] <= 1'd0;
		krnl_write_start[1] <= 1'd0;
	end

	if (kernel_count_zero[2]) begin
		kernel_count_zero_ack[2] <= 1'd1;
		krnl_write_start[2] <= 1'd1;
	end
	else begin
		kernel_count_zero_ack[2] <= 1'd0;
		krnl_write_start[2] <= 1'd0;
	end

	if (kernel_count_zero[3]) begin
		kernel_count_zero_ack[3] <= 1'd1;
		krnl_write_start[3] <= 1'd1;
	end
	else begin
		kernel_count_zero_ack[3] <= 1'd0;
		krnl_write_start[3] <= 1'd0;
	end

	if (kernel_count_zero[4]) begin
		kernel_count_zero_ack[4] <= 1'd1;
		krnl_write_start[4] <= 1'd1;
	end
	else begin
		kernel_count_zero_ack[4] <= 1'd0;
		krnl_write_start[4] <= 1'd0;
	end

	if (kernel_count_zero[5]) begin
		kernel_count_zero_ack[5] <= 1'd1;
		krnl_write_start[5] <= 1'd1;
	end
	else begin
		kernel_count_zero_ack[5] <= 1'd0;
		krnl_write_start[5] <= 1'd0;
	end

	if (kernel_count_zero[6]) begin
		kernel_count_zero_ack[6] <= 1'd1;
		krnl_write_start[6] <= 1'd1;
	end
	else begin
		kernel_count_zero_ack[6] <= 1'd0;
		krnl_write_start[6] <= 1'd0;
	end

	if (kernel_count_zero[7]) begin
		kernel_count_zero_ack[7] <= 1'd1;
		krnl_write_start[7] <= 1'd1;
	end
	else begin
		kernel_count_zero_ack[7] <= 1'd0;
		krnl_write_start[7] <= 1'd0;
	end
	mem_ptr_slow_0 <= mem_ptr_0;
	mem_ptr_slow_1 <= mem_ptr_1;
	mem_ptr_slow_2 <= mem_ptr_2;
	mem_ptr_slow_3 <= mem_ptr_3;
	mem_ptr_slow_4 <= mem_ptr_4;
	mem_ptr_slow_5 <= mem_ptr_5;
	mem_ptr_slow_6 <= mem_ptr_6;
	mem_ptr_slow_7 <= mem_ptr_7;
end

always_comb begin
	krnl_hll_out_0_m_tready = ! krnl_hll_out_0_m_tready_n;
end

always_comb begin
	krnl_hll_out_1_m_tready = ! krnl_hll_out_1_m_tready_n;
end

always_comb begin
	krnl_hll_out_2_m_tready = ! krnl_hll_out_2_m_tready_n;
end

always_comb begin
	krnl_hll_out_3_m_tready = ! krnl_hll_out_3_m_tready_n;
end

always_comb begin
	krnl_hll_out_4_m_tready = ! krnl_hll_out_4_m_tready_n;
end

always_comb begin
	krnl_hll_out_5_m_tready = ! krnl_hll_out_5_m_tready_n;
end

always_comb begin
	krnl_hll_out_6_m_tready = ! krnl_hll_out_6_m_tready_n;
end

always_comb begin
	krnl_hll_out_7_m_tready = ! krnl_hll_out_7_m_tready_n;
end

endmodule

