`timescale 1ns / 1ps

module krnl_dist_rtl (
	input wire [0:0] ap_clk,
	input wire [0:0] ap_clk_2,
	input wire [0:0] ap_rst_n,
	input wire [0:0] ap_rst_n_2,
	output wire [63:0] m_axi_gmem_0_ARADDR,
	output wire [1:0] m_axi_gmem_0_ARBURST,
	output wire [3:0] m_axi_gmem_0_ARCACHE,
	output wire [0:0] m_axi_gmem_0_ARID,
	output wire [7:0] m_axi_gmem_0_ARLEN,
	output wire [1:0] m_axi_gmem_0_ARLOCK,
	output wire [2:0] m_axi_gmem_0_ARPROT,
	output wire [3:0] m_axi_gmem_0_ARQOS,
	input wire [0:0] m_axi_gmem_0_ARREADY,
	output wire [3:0] m_axi_gmem_0_ARREGION,
	output wire [2:0] m_axi_gmem_0_ARSIZE,
	output wire [0:0] m_axi_gmem_0_ARVALID,
	output wire [63:0] m_axi_gmem_0_AWADDR,
	output wire [1:0] m_axi_gmem_0_AWBURST,
	output wire [3:0] m_axi_gmem_0_AWCACHE,
	output wire [0:0] m_axi_gmem_0_AWID,
	output wire [7:0] m_axi_gmem_0_AWLEN,
	output wire [1:0] m_axi_gmem_0_AWLOCK,
	output wire [2:0] m_axi_gmem_0_AWPROT,
	output wire [3:0] m_axi_gmem_0_AWQOS,
	input wire [0:0] m_axi_gmem_0_AWREADY,
	output wire [3:0] m_axi_gmem_0_AWREGION,
	output wire [2:0] m_axi_gmem_0_AWSIZE,
	output wire [0:0] m_axi_gmem_0_AWVALID,
	input wire [0:0] m_axi_gmem_0_BID,
	output wire [0:0] m_axi_gmem_0_BREADY,
	input wire [1:0] m_axi_gmem_0_BRESP,
	input wire [0:0] m_axi_gmem_0_BVALID,
	input wire [511:0] m_axi_gmem_0_RDATA,
	input wire [0:0] m_axi_gmem_0_RID,
	input wire [0:0] m_axi_gmem_0_RLAST,
	output wire [0:0] m_axi_gmem_0_RREADY,
	input wire [1:0] m_axi_gmem_0_RRESP,
	input wire [0:0] m_axi_gmem_0_RVALID,
	output wire [511:0] m_axi_gmem_0_WDATA,
	output wire [0:0] m_axi_gmem_0_WLAST,
	input wire [0:0] m_axi_gmem_0_WREADY,
	output wire [63:0] m_axi_gmem_0_WSTRB,
	output wire [0:0] m_axi_gmem_0_WVALID,
	output wire [63:0] m_axi_gmem_1_ARADDR,
	output wire [1:0] m_axi_gmem_1_ARBURST,
	output wire [3:0] m_axi_gmem_1_ARCACHE,
	output wire [0:0] m_axi_gmem_1_ARID,
	output wire [7:0] m_axi_gmem_1_ARLEN,
	output wire [1:0] m_axi_gmem_1_ARLOCK,
	output wire [2:0] m_axi_gmem_1_ARPROT,
	output wire [3:0] m_axi_gmem_1_ARQOS,
	input wire [0:0] m_axi_gmem_1_ARREADY,
	output wire [3:0] m_axi_gmem_1_ARREGION,
	output wire [2:0] m_axi_gmem_1_ARSIZE,
	output wire [0:0] m_axi_gmem_1_ARVALID,
	output wire [63:0] m_axi_gmem_1_AWADDR,
	output wire [1:0] m_axi_gmem_1_AWBURST,
	output wire [3:0] m_axi_gmem_1_AWCACHE,
	output wire [0:0] m_axi_gmem_1_AWID,
	output wire [7:0] m_axi_gmem_1_AWLEN,
	output wire [1:0] m_axi_gmem_1_AWLOCK,
	output wire [2:0] m_axi_gmem_1_AWPROT,
	output wire [3:0] m_axi_gmem_1_AWQOS,
	input wire [0:0] m_axi_gmem_1_AWREADY,
	output wire [3:0] m_axi_gmem_1_AWREGION,
	output wire [2:0] m_axi_gmem_1_AWSIZE,
	output wire [0:0] m_axi_gmem_1_AWVALID,
	input wire [0:0] m_axi_gmem_1_BID,
	output wire [0:0] m_axi_gmem_1_BREADY,
	input wire [1:0] m_axi_gmem_1_BRESP,
	input wire [0:0] m_axi_gmem_1_BVALID,
	input wire [127:0] m_axi_gmem_1_RDATA,
	input wire [0:0] m_axi_gmem_1_RID,
	input wire [0:0] m_axi_gmem_1_RLAST,
	output wire [0:0] m_axi_gmem_1_RREADY,
	input wire [1:0] m_axi_gmem_1_RRESP,
	input wire [0:0] m_axi_gmem_1_RVALID,
	output wire [127:0] m_axi_gmem_1_WDATA,
	output wire [0:0] m_axi_gmem_1_WLAST,
	input wire [0:0] m_axi_gmem_1_WREADY,
	output wire [15:0] m_axi_gmem_1_WSTRB,
	output wire [0:0] m_axi_gmem_1_WVALID,
	output wire [63:0] m_axi_gmem_2_ARADDR,
	output wire [1:0] m_axi_gmem_2_ARBURST,
	output wire [3:0] m_axi_gmem_2_ARCACHE,
	output wire [0:0] m_axi_gmem_2_ARID,
	output wire [7:0] m_axi_gmem_2_ARLEN,
	output wire [1:0] m_axi_gmem_2_ARLOCK,
	output wire [2:0] m_axi_gmem_2_ARPROT,
	output wire [3:0] m_axi_gmem_2_ARQOS,
	input wire [0:0] m_axi_gmem_2_ARREADY,
	output wire [3:0] m_axi_gmem_2_ARREGION,
	output wire [2:0] m_axi_gmem_2_ARSIZE,
	output wire [0:0] m_axi_gmem_2_ARVALID,
	output wire [63:0] m_axi_gmem_2_AWADDR,
	output wire [1:0] m_axi_gmem_2_AWBURST,
	output wire [3:0] m_axi_gmem_2_AWCACHE,
	output wire [0:0] m_axi_gmem_2_AWID,
	output wire [7:0] m_axi_gmem_2_AWLEN,
	output wire [1:0] m_axi_gmem_2_AWLOCK,
	output wire [2:0] m_axi_gmem_2_AWPROT,
	output wire [3:0] m_axi_gmem_2_AWQOS,
	input wire [0:0] m_axi_gmem_2_AWREADY,
	output wire [3:0] m_axi_gmem_2_AWREGION,
	output wire [2:0] m_axi_gmem_2_AWSIZE,
	output wire [0:0] m_axi_gmem_2_AWVALID,
	input wire [0:0] m_axi_gmem_2_BID,
	output wire [0:0] m_axi_gmem_2_BREADY,
	input wire [1:0] m_axi_gmem_2_BRESP,
	input wire [0:0] m_axi_gmem_2_BVALID,
	input wire [511:0] m_axi_gmem_2_RDATA,
	input wire [0:0] m_axi_gmem_2_RID,
	input wire [0:0] m_axi_gmem_2_RLAST,
	output wire [0:0] m_axi_gmem_2_RREADY,
	input wire [1:0] m_axi_gmem_2_RRESP,
	input wire [0:0] m_axi_gmem_2_RVALID,
	output wire [511:0] m_axi_gmem_2_WDATA,
	output wire [0:0] m_axi_gmem_2_WLAST,
	input wire [0:0] m_axi_gmem_2_WREADY,
	output wire [63:0] m_axi_gmem_2_WSTRB,
	output wire [0:0] m_axi_gmem_2_WVALID,
	input wire [31:0] s_axi_control_ARADDR,
	output wire [0:0] s_axi_control_ARREADY,
	input wire [0:0] s_axi_control_ARVALID,
	input wire [31:0] s_axi_control_AWADDR,
	output wire [0:0] s_axi_control_AWREADY,
	input wire [0:0] s_axi_control_AWVALID,
	input wire [0:0] s_axi_control_BREADY,
	output wire [1:0] s_axi_control_BRESP,
	output wire [0:0] s_axi_control_BVALID,
	output wire [31:0] s_axi_control_RDATA,
	input wire [0:0] s_axi_control_RREADY,
	output wire [1:0] s_axi_control_RRESP,
	output wire [0:0] s_axi_control_RVALID,
	input wire [31:0] s_axi_control_WDATA,
	output wire [0:0] s_axi_control_WREADY,
	input wire [3:0] s_axi_control_WSTRB,
	input wire [0:0] s_axi_control_WVALID
);


krnl_dist_rtl_int krnl_dist_rtl_int_inst0 (
	.ap_aclk (ap_clk),
	.ap_aclk_2 (ap_clk_2),
	.ap_rst_n (ap_rst_n),
	.ap_rst_n_2 (ap_rst_n_2),
	.m_axi_gmem_0_ARADDR (m_axi_gmem_0_ARADDR),
	.m_axi_gmem_0_ARBURST (m_axi_gmem_0_ARBURST),
	.m_axi_gmem_0_ARCACHE (m_axi_gmem_0_ARCACHE),
	.m_axi_gmem_0_ARID (m_axi_gmem_0_ARID),
	.m_axi_gmem_0_ARLEN (m_axi_gmem_0_ARLEN),
	.m_axi_gmem_0_ARLOCK (m_axi_gmem_0_ARLOCK),
	.m_axi_gmem_0_ARPROT (m_axi_gmem_0_ARPROT),
	.m_axi_gmem_0_ARQOS (m_axi_gmem_0_ARQOS),
	.m_axi_gmem_0_ARREADY (m_axi_gmem_0_ARREADY),
	.m_axi_gmem_0_ARREGION (m_axi_gmem_0_ARREGION),
	.m_axi_gmem_0_ARSIZE (m_axi_gmem_0_ARSIZE),
	.m_axi_gmem_0_ARVALID (m_axi_gmem_0_ARVALID),
	.m_axi_gmem_0_AWADDR (m_axi_gmem_0_AWADDR),
	.m_axi_gmem_0_AWBURST (m_axi_gmem_0_AWBURST),
	.m_axi_gmem_0_AWCACHE (m_axi_gmem_0_AWCACHE),
	.m_axi_gmem_0_AWID (m_axi_gmem_0_AWID),
	.m_axi_gmem_0_AWLEN (m_axi_gmem_0_AWLEN),
	.m_axi_gmem_0_AWLOCK (m_axi_gmem_0_AWLOCK),
	.m_axi_gmem_0_AWPROT (m_axi_gmem_0_AWPROT),
	.m_axi_gmem_0_AWQOS (m_axi_gmem_0_AWQOS),
	.m_axi_gmem_0_AWREADY (m_axi_gmem_0_AWREADY),
	.m_axi_gmem_0_AWREGION (m_axi_gmem_0_AWREGION),
	.m_axi_gmem_0_AWSIZE (m_axi_gmem_0_AWSIZE),
	.m_axi_gmem_0_AWVALID (m_axi_gmem_0_AWVALID),
	.m_axi_gmem_0_BID (m_axi_gmem_0_BID),
	.m_axi_gmem_0_BREADY (m_axi_gmem_0_BREADY),
	.m_axi_gmem_0_BRESP (m_axi_gmem_0_BRESP),
	.m_axi_gmem_0_BVALID (m_axi_gmem_0_BVALID),
	.m_axi_gmem_0_RDATA (m_axi_gmem_0_RDATA),
	.m_axi_gmem_0_RID (m_axi_gmem_0_RID),
	.m_axi_gmem_0_RLAST (m_axi_gmem_0_RLAST),
	.m_axi_gmem_0_RREADY (m_axi_gmem_0_RREADY),
	.m_axi_gmem_0_RRESP (m_axi_gmem_0_RRESP),
	.m_axi_gmem_0_RVALID (m_axi_gmem_0_RVALID),
	.m_axi_gmem_0_WDATA (m_axi_gmem_0_WDATA),
	.m_axi_gmem_0_WLAST (m_axi_gmem_0_WLAST),
	.m_axi_gmem_0_WREADY (m_axi_gmem_0_WREADY),
	.m_axi_gmem_0_WSTRB (m_axi_gmem_0_WSTRB),
	.m_axi_gmem_0_WVALID (m_axi_gmem_0_WVALID),
	.m_axi_gmem_1_ARADDR (m_axi_gmem_1_ARADDR),
	.m_axi_gmem_1_ARBURST (m_axi_gmem_1_ARBURST),
	.m_axi_gmem_1_ARCACHE (m_axi_gmem_1_ARCACHE),
	.m_axi_gmem_1_ARID (m_axi_gmem_1_ARID),
	.m_axi_gmem_1_ARLEN (m_axi_gmem_1_ARLEN),
	.m_axi_gmem_1_ARLOCK (m_axi_gmem_1_ARLOCK),
	.m_axi_gmem_1_ARPROT (m_axi_gmem_1_ARPROT),
	.m_axi_gmem_1_ARQOS (m_axi_gmem_1_ARQOS),
	.m_axi_gmem_1_ARREADY (m_axi_gmem_1_ARREADY),
	.m_axi_gmem_1_ARREGION (m_axi_gmem_1_ARREGION),
	.m_axi_gmem_1_ARSIZE (m_axi_gmem_1_ARSIZE),
	.m_axi_gmem_1_ARVALID (m_axi_gmem_1_ARVALID),
	.m_axi_gmem_1_AWADDR (m_axi_gmem_1_AWADDR),
	.m_axi_gmem_1_AWBURST (m_axi_gmem_1_AWBURST),
	.m_axi_gmem_1_AWCACHE (m_axi_gmem_1_AWCACHE),
	.m_axi_gmem_1_AWID (m_axi_gmem_1_AWID),
	.m_axi_gmem_1_AWLEN (m_axi_gmem_1_AWLEN),
	.m_axi_gmem_1_AWLOCK (m_axi_gmem_1_AWLOCK),
	.m_axi_gmem_1_AWPROT (m_axi_gmem_1_AWPROT),
	.m_axi_gmem_1_AWQOS (m_axi_gmem_1_AWQOS),
	.m_axi_gmem_1_AWREADY (m_axi_gmem_1_AWREADY),
	.m_axi_gmem_1_AWREGION (m_axi_gmem_1_AWREGION),
	.m_axi_gmem_1_AWSIZE (m_axi_gmem_1_AWSIZE),
	.m_axi_gmem_1_AWVALID (m_axi_gmem_1_AWVALID),
	.m_axi_gmem_1_BID (m_axi_gmem_1_BID),
	.m_axi_gmem_1_BREADY (m_axi_gmem_1_BREADY),
	.m_axi_gmem_1_BRESP (m_axi_gmem_1_BRESP),
	.m_axi_gmem_1_BVALID (m_axi_gmem_1_BVALID),
	.m_axi_gmem_1_RDATA (m_axi_gmem_1_RDATA),
	.m_axi_gmem_1_RID (m_axi_gmem_1_RID),
	.m_axi_gmem_1_RLAST (m_axi_gmem_1_RLAST),
	.m_axi_gmem_1_RREADY (m_axi_gmem_1_RREADY),
	.m_axi_gmem_1_RRESP (m_axi_gmem_1_RRESP),
	.m_axi_gmem_1_RVALID (m_axi_gmem_1_RVALID),
	.m_axi_gmem_1_WDATA (m_axi_gmem_1_WDATA),
	.m_axi_gmem_1_WLAST (m_axi_gmem_1_WLAST),
	.m_axi_gmem_1_WREADY (m_axi_gmem_1_WREADY),
	.m_axi_gmem_1_WSTRB (m_axi_gmem_1_WSTRB),
	.m_axi_gmem_1_WVALID (m_axi_gmem_1_WVALID),
	.m_axi_gmem_2_ARADDR (m_axi_gmem_2_ARADDR),
	.m_axi_gmem_2_ARBURST (m_axi_gmem_2_ARBURST),
	.m_axi_gmem_2_ARCACHE (m_axi_gmem_2_ARCACHE),
	.m_axi_gmem_2_ARID (m_axi_gmem_2_ARID),
	.m_axi_gmem_2_ARLEN (m_axi_gmem_2_ARLEN),
	.m_axi_gmem_2_ARLOCK (m_axi_gmem_2_ARLOCK),
	.m_axi_gmem_2_ARPROT (m_axi_gmem_2_ARPROT),
	.m_axi_gmem_2_ARQOS (m_axi_gmem_2_ARQOS),
	.m_axi_gmem_2_ARREADY (m_axi_gmem_2_ARREADY),
	.m_axi_gmem_2_ARREGION (m_axi_gmem_2_ARREGION),
	.m_axi_gmem_2_ARSIZE (m_axi_gmem_2_ARSIZE),
	.m_axi_gmem_2_ARVALID (m_axi_gmem_2_ARVALID),
	.m_axi_gmem_2_AWADDR (m_axi_gmem_2_AWADDR),
	.m_axi_gmem_2_AWBURST (m_axi_gmem_2_AWBURST),
	.m_axi_gmem_2_AWCACHE (m_axi_gmem_2_AWCACHE),
	.m_axi_gmem_2_AWID (m_axi_gmem_2_AWID),
	.m_axi_gmem_2_AWLEN (m_axi_gmem_2_AWLEN),
	.m_axi_gmem_2_AWLOCK (m_axi_gmem_2_AWLOCK),
	.m_axi_gmem_2_AWPROT (m_axi_gmem_2_AWPROT),
	.m_axi_gmem_2_AWQOS (m_axi_gmem_2_AWQOS),
	.m_axi_gmem_2_AWREADY (m_axi_gmem_2_AWREADY),
	.m_axi_gmem_2_AWREGION (m_axi_gmem_2_AWREGION),
	.m_axi_gmem_2_AWSIZE (m_axi_gmem_2_AWSIZE),
	.m_axi_gmem_2_AWVALID (m_axi_gmem_2_AWVALID),
	.m_axi_gmem_2_BID (m_axi_gmem_2_BID),
	.m_axi_gmem_2_BREADY (m_axi_gmem_2_BREADY),
	.m_axi_gmem_2_BRESP (m_axi_gmem_2_BRESP),
	.m_axi_gmem_2_BVALID (m_axi_gmem_2_BVALID),
	.m_axi_gmem_2_RDATA (m_axi_gmem_2_RDATA),
	.m_axi_gmem_2_RID (m_axi_gmem_2_RID),
	.m_axi_gmem_2_RLAST (m_axi_gmem_2_RLAST),
	.m_axi_gmem_2_RREADY (m_axi_gmem_2_RREADY),
	.m_axi_gmem_2_RRESP (m_axi_gmem_2_RRESP),
	.m_axi_gmem_2_RVALID (m_axi_gmem_2_RVALID),
	.m_axi_gmem_2_WDATA (m_axi_gmem_2_WDATA),
	.m_axi_gmem_2_WLAST (m_axi_gmem_2_WLAST),
	.m_axi_gmem_2_WREADY (m_axi_gmem_2_WREADY),
	.m_axi_gmem_2_WSTRB (m_axi_gmem_2_WSTRB),
	.m_axi_gmem_2_WVALID (m_axi_gmem_2_WVALID),
	.s_axi_control_ARADDR (s_axi_control_ARADDR),
	.s_axi_control_ARREADY (s_axi_control_ARREADY),
	.s_axi_control_ARVALID (s_axi_control_ARVALID),
	.s_axi_control_AWADDR (s_axi_control_AWADDR),
	.s_axi_control_AWREADY (s_axi_control_AWREADY),
	.s_axi_control_AWVALID (s_axi_control_AWVALID),
	.s_axi_control_BREADY (s_axi_control_BREADY),
	.s_axi_control_BRESP (s_axi_control_BRESP),
	.s_axi_control_BVALID (s_axi_control_BVALID),
	.s_axi_control_RDATA (s_axi_control_RDATA),
	.s_axi_control_RREADY (s_axi_control_RREADY),
	.s_axi_control_RRESP (s_axi_control_RRESP),
	.s_axi_control_RVALID (s_axi_control_RVALID),
	.s_axi_control_WDATA (s_axi_control_WDATA),
	.s_axi_control_WREADY (s_axi_control_WREADY),
	.s_axi_control_WSTRB (s_axi_control_WSTRB),
	.s_axi_control_WVALID (s_axi_control_WVALID)
);

endmodule
