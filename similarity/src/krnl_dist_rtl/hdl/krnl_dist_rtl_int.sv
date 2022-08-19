`timescale 1ns / 1ps

module krnl_dist_rtl_int (
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
	input logic [127:0] m_axi_gmem_1_RDATA,
	input logic [0:0] m_axi_gmem_1_RID,
	input logic [0:0] m_axi_gmem_1_RLAST,
	output logic [0:0] m_axi_gmem_1_RREADY,
	input logic [1:0] m_axi_gmem_1_RRESP,
	input logic [0:0] m_axi_gmem_1_RVALID,
	output logic [127:0] m_axi_gmem_1_WDATA,
	output logic [0:0] m_axi_gmem_1_WLAST,
	input logic [0:0] m_axi_gmem_1_WREADY,
	output logic [15:0] m_axi_gmem_1_WSTRB,
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

logic [63:0] mem_ptr[0:0];
logic [63:0] read_ptr[0:0];
logic [31:0] read_offset[0:0];
logic [0:0] mem_start;
logic [31:0] mem_len;
logic [31:0] read_len;
logic [63:0] pivot_ptr;
logic [31:0] pivot_offset;
logic [31:0] pivot_len;
logic [63:0] write_ptr;
logic [31:0] write_len;
logic [31:0] pivot_len_int;
logic [0:0] mem_start_ack = 1'd0;
logic [0:0] ap_start_pulse_d = 1'd0;
logic [63:0] pivot_ptr_offset = 64'd0;
logic [0:0] areset;
logic [0:0] areset2;
logic [0:0] ap_start;
logic [0:0] ap_done;
logic [0:0] ap_ready;
logic [0:0] ap_idle;
logic [0:0] ap_start_r;
logic [0:0] ap_start_pulse = 1'd0;
logic [0:0] stream_out_m_tvalid;
logic [511:0] stream_out_m_tdata;
logic [0:0] stream_out_m_tready;
logic [0:0] ctrl_rd_fifo_prog_full_0;
logic [0:0] read_fifo_0_m_tvalid;
logic [511:0] read_fifo_0_m_tdata;
logic [0:0] read_fifo_0_m_tready;
logic [0:0] read_krnl_0_s_tvalid;
logic [511:0] read_krnl_0_s_tdata;
logic [0:0] read_krnl_0_s_tready;
logic [0:0] read_fifo_0_m_tready_n;
logic [0:0] read_krnl_0_s_tvalid_n;
logic [0:0] ctrl_rd_fifo_prog_full_1;
logic [0:0] read_fifo_1_m_tvalid;
logic [127:0] read_fifo_1_m_tdata;
logic [0:0] read_fifo_1_m_tready;
logic [0:0] read_krnl_1_s_tvalid;
logic [127:0] read_krnl_1_s_tdata;
logic [0:0] read_krnl_1_s_tready;
logic [0:0] read_fifo_1_m_tready_n;
logic [0:0] read_krnl_1_s_tvalid_n;
logic [0:0] stream_out_m_tready_n;
logic [0:0] wr_fifo_out_2_m_tvalid;
logic [511:0] wr_fifo_out_2_m_tdata;
logic [0:0] wr_fifo_out_2_m_tready;
logic [0:0] wr_fifo_out_2_m_tvalid_n;

krnl_dist_rtl_control_s_axi krnl_dist_rtl_control_s_axi_inst0 (
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
	.arg_0 (read_ptr[0]),
	.arg_1 (read_offset[0]),
	.arg_2 (read_len),
	.arg_3 (pivot_ptr),
	.arg_4 (pivot_offset),
	.arg_5 (pivot_len),
	.arg_6 (write_ptr),
	.arg_7 (write_len),
	.interrupt ()
);

krnl_dist_rtl_axi_read_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_ID_WIDTH (1),
	.C_LENGTH_WIDTH (32),
	.C_LOG_BURST_LEN (6),
	.C_MAX_OUTSTANDING (3),
	.C_NUM_CHANNELS (1)
) krnl_dist_rtl_axi_read_master_inst1 (
	.aclk (ap_aclk),
	.araddr (m_axi_gmem_0_ARADDR),
	.areset (areset),
	.arid (m_axi_gmem_0_ARID),
	.arlen (m_axi_gmem_0_ARLEN),
	.arready (m_axi_gmem_0_ARREADY),
	.arsize (m_axi_gmem_0_ARSIZE),
	.arvalid (m_axi_gmem_0_ARVALID),
	.ctrl_done (),
	.ctrl_length (mem_len),
	.ctrl_offset (mem_ptr[0]),
	.ctrl_prog_full (ctrl_rd_fifo_prog_full_0),
	.ctrl_start (mem_start),
	.m_tdata (read_fifo_0_m_tdata),
	.m_tready (read_fifo_0_m_tready),
	.m_tvalid (read_fifo_0_m_tvalid),
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
	.din (read_fifo_0_m_tdata),
	.dout (read_krnl_0_s_tdata),
	.empty (read_krnl_0_s_tvalid_n),
	.full (read_fifo_0_m_tready_n),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (ctrl_rd_fifo_prog_full_0),
	.rd_clk (ap_aclk_2),
	.rd_data_count (),
	.rd_en (read_krnl_0_s_tready),
	.rd_rst_busy (),
	.rst (areset),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk),
	.wr_data_count (),
	.wr_en (read_fifo_0_m_tvalid),
	.wr_rst_busy ()
);

krnl_dist_rtl_axi_read_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (256),
	.C_DATA_WIDTH (128),
	.C_ID_WIDTH (1),
	.C_LENGTH_WIDTH (32),
	.C_LOG_BURST_LEN (8),
	.C_MAX_OUTSTANDING (3),
	.C_NUM_CHANNELS (1)
) krnl_dist_rtl_axi_read_master_inst3 (
	.aclk (ap_aclk),
	.araddr (m_axi_gmem_1_ARADDR),
	.areset (areset),
	.arid (m_axi_gmem_1_ARID),
	.arlen (m_axi_gmem_1_ARLEN),
	.arready (m_axi_gmem_1_ARREADY),
	.arsize (m_axi_gmem_1_ARSIZE),
	.arvalid (m_axi_gmem_1_ARVALID),
	.ctrl_done (),
	.ctrl_length (pivot_len_int),
	.ctrl_offset (pivot_ptr_offset),
	.ctrl_prog_full (ctrl_rd_fifo_prog_full_1),
	.ctrl_start (ap_start_pulse_d),
	.m_tdata (read_fifo_1_m_tdata),
	.m_tready (read_fifo_1_m_tready),
	.m_tvalid (read_fifo_1_m_tvalid),
	.rdata (m_axi_gmem_1_RDATA),
	.rid (m_axi_gmem_1_RID),
	.rlast (m_axi_gmem_1_RLAST),
	.rready (m_axi_gmem_1_RREADY),
	.rresp (m_axi_gmem_1_RRESP),
	.rvalid (m_axi_gmem_1_RVALID)
);

xpm_fifo_async # (
	.DOUT_RESET_VALUE ("0"),
	.ECC_MODE ("no_ecc"),
	.FIFO_MEMORY_TYPE ("auto"),
	.READ_MODE ("fwft"),
	.CDC_SYNC_STAGES (3),
	.FIFO_READ_LATENCY (1),
	.FIFO_WRITE_DEPTH (1024),
	.FULL_RESET_VALUE (1),
	.PROG_EMPTY_THRESH (10),
	.PROG_FULL_THRESH (254),
	.RD_DATA_COUNT_WIDTH (11),
	.READ_DATA_WIDTH (128),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (128),
	.WR_DATA_COUNT_WIDTH (11)
) xpm_fifo_async_inst4 (
	.dbiterr (),
	.din (read_fifo_1_m_tdata),
	.dout (read_krnl_1_s_tdata),
	.empty (read_krnl_1_s_tvalid_n),
	.full (read_fifo_1_m_tready_n),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (ctrl_rd_fifo_prog_full_1),
	.rd_clk (ap_aclk_2),
	.rd_data_count (),
	.rd_en (read_krnl_1_s_tready),
	.rd_rst_busy (),
	.rst (areset),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk),
	.wr_data_count (),
	.wr_en (read_fifo_1_m_tvalid),
	.wr_rst_busy ()
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
) xpm_fifo_async_inst5 (
	.dbiterr (),
	.din (stream_out_m_tdata),
	.dout (wr_fifo_out_2_m_tdata),
	.empty (wr_fifo_out_2_m_tvalid_n),
	.full (),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (stream_out_m_tready_n),
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
	.wr_en (stream_out_m_tvalid),
	.wr_rst_busy ()
);

krnl_dist_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (64),
	.C_DATA_WIDTH (512),
	.C_LOG_BURST_LEN (6),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_dist_rtl_axi_write_master_inst6 (
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
	.ctrl_done (ap_done),
	.ctrl_length (write_len),
	.ctrl_offset (write_ptr),
	.ctrl_start (ap_start_pulse),
	.s_tdata (wr_fifo_out_2_m_tdata),
	.s_tready (wr_fifo_out_2_m_tready),
	.s_tvalid (wr_fifo_out_2_m_tvalid),
	.wdata (m_axi_gmem_2_WDATA),
	.wlast (m_axi_gmem_2_WLAST),
	.wready (m_axi_gmem_2_WREADY),
	.wstrb (m_axi_gmem_2_WSTRB),
	.wvalid (m_axi_gmem_2_WVALID)
);

dist_wrapper dist_wrapper_inst7 (
	.aclk (ap_aclk_2),
	.ap_start (ap_start_pulse),
	.areset (ap_rst_n_2),
	.in_0s_tdata (read_krnl_0_s_tdata),
	.in_0s_tready (read_krnl_0_s_tready),
	.in_0s_tvalid (read_krnl_0_s_tvalid),
	.in_pivots_tdata (read_krnl_1_s_tdata),
	.in_pivots_tready (read_krnl_1_s_tready),
	.in_pivots_tvalid (read_krnl_1_s_tvalid),
	.m_tdata (stream_out_m_tdata),
	.m_tready (stream_out_m_tready),
	.m_tvalid (stream_out_m_tvalid),
	.mem_len (mem_len),
	.mem_ptr_0 (mem_ptr[0]),
	.mem_start (mem_start),
	.mem_start_ack (mem_start_ack),
	.pivot_len (pivot_len),
	.read_len (read_len),
	.read_offset_0 (read_offset[0]),
	.read_ptr_0 (read_ptr[0])
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
	read_fifo_0_m_tready = ! read_fifo_0_m_tready_n;
end

always_comb begin
	read_krnl_0_s_tvalid = ! read_krnl_0_s_tvalid_n;
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
	m_axi_gmem_0_AWVALID = 1'd0;
	m_axi_gmem_0_AWADDR = 64'd0;
	m_axi_gmem_0_AWLEN = 8'd0;
	m_axi_gmem_0_AWSIZE = 3'd0;
	m_axi_gmem_0_WVALID = 1'd0;
	m_axi_gmem_0_WDATA = 512'd0;
	m_axi_gmem_0_WSTRB = 64'd0;
	m_axi_gmem_0_WLAST = 1'd0;
	m_axi_gmem_0_BREADY = 1'd0;
end

always_comb begin
	read_fifo_1_m_tready = ! read_fifo_1_m_tready_n;
end

always_comb begin
	read_krnl_1_s_tvalid = ! read_krnl_1_s_tvalid_n;
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
	m_axi_gmem_1_AWVALID = 1'd0;
	m_axi_gmem_1_AWADDR = 64'd0;
	m_axi_gmem_1_AWLEN = 8'd0;
	m_axi_gmem_1_AWSIZE = 3'd0;
	m_axi_gmem_1_WVALID = 1'd0;
	m_axi_gmem_1_WDATA = 128'd0;
	m_axi_gmem_1_WSTRB = 16'd0;
	m_axi_gmem_1_WLAST = 1'd0;
	m_axi_gmem_1_BREADY = 1'd0;
end

always_comb begin
	stream_out_m_tready = ! stream_out_m_tready_n;
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
	wr_fifo_out_2_m_tvalid = ! wr_fifo_out_2_m_tvalid_n;
end

always_ff @(posedge ap_aclk) begin

	if (mem_start) begin
		mem_start_ack <= 1'd1;
	end
	else begin
		mem_start_ack <= 1'd0;
	end
	pivot_len_int <= pivot_len << 4'd9;
	ap_start_pulse_d <= ap_start_pulse;
	pivot_ptr_offset <= pivot_ptr + pivot_offset;
end

endmodule

