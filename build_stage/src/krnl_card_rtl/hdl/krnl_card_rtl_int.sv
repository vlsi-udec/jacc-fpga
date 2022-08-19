`timescale 1ns / 1ps

module krnl_card_rtl_int (
	input logic [0:0] ap_aclk,
	input logic [0:0] ap_aclk_2,
	input logic [0:0] ap_rst_n,
	input logic [0:0] ap_rst_n_2,
	output logic [63:0] m_axi_gmem_ARADDR,
	output logic [1:0] m_axi_gmem_ARBURST,
	output logic [3:0] m_axi_gmem_ARCACHE,
	output logic [0:0] m_axi_gmem_ARID,
	output logic [7:0] m_axi_gmem_ARLEN,
	output logic [1:0] m_axi_gmem_ARLOCK,
	output logic [2:0] m_axi_gmem_ARPROT,
	output logic [3:0] m_axi_gmem_ARQOS,
	input logic [0:0] m_axi_gmem_ARREADY,
	output logic [3:0] m_axi_gmem_ARREGION,
	output logic [2:0] m_axi_gmem_ARSIZE,
	output logic [0:0] m_axi_gmem_ARVALID,
	output logic [63:0] m_axi_gmem_AWADDR,
	output logic [1:0] m_axi_gmem_AWBURST,
	output logic [3:0] m_axi_gmem_AWCACHE,
	output logic [0:0] m_axi_gmem_AWID,
	output logic [7:0] m_axi_gmem_AWLEN,
	output logic [1:0] m_axi_gmem_AWLOCK,
	output logic [2:0] m_axi_gmem_AWPROT,
	output logic [3:0] m_axi_gmem_AWQOS,
	input logic [0:0] m_axi_gmem_AWREADY,
	output logic [3:0] m_axi_gmem_AWREGION,
	output logic [2:0] m_axi_gmem_AWSIZE,
	output logic [0:0] m_axi_gmem_AWVALID,
	input logic [0:0] m_axi_gmem_BID,
	output logic [0:0] m_axi_gmem_BREADY,
	input logic [1:0] m_axi_gmem_BRESP,
	input logic [0:0] m_axi_gmem_BVALID,
	input logic [63:0] m_axi_gmem_RDATA,
	input logic [0:0] m_axi_gmem_RID,
	input logic [0:0] m_axi_gmem_RLAST,
	output logic [0:0] m_axi_gmem_RREADY,
	input logic [1:0] m_axi_gmem_RRESP,
	input logic [0:0] m_axi_gmem_RVALID,
	output logic [63:0] m_axi_gmem_WDATA,
	output logic [0:0] m_axi_gmem_WLAST,
	input logic [0:0] m_axi_gmem_WREADY,
	output logic [7:0] m_axi_gmem_WSTRB,
	output logic [0:0] m_axi_gmem_WVALID,
	input logic [63:0] p0_TDATA,
	output logic [0:0] p0_TREADY,
	input logic [0:0] p0_TVALID,
	input logic [63:0] p1_TDATA,
	output logic [0:0] p1_TREADY,
	input logic [0:0] p1_TVALID,
	input logic [63:0] p2_TDATA,
	output logic [0:0] p2_TREADY,
	input logic [0:0] p2_TVALID,
	input logic [63:0] p3_TDATA,
	output logic [0:0] p3_TREADY,
	input logic [0:0] p3_TVALID,
	input logic [63:0] p4_TDATA,
	output logic [0:0] p4_TREADY,
	input logic [0:0] p4_TVALID,
	input logic [63:0] p5_TDATA,
	output logic [0:0] p5_TREADY,
	input logic [0:0] p5_TVALID,
	input logic [63:0] p6_TDATA,
	output logic [0:0] p6_TREADY,
	input logic [0:0] p6_TVALID,
	input logic [63:0] p7_TDATA,
	output logic [0:0] p7_TREADY,
	input logic [0:0] p7_TVALID,
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

logic [0:0] areset;
logic [0:0] areset2;
logic [0:0] ap_start;
logic [0:0] ap_done;
logic [0:0] ap_ready;
logic [0:0] ap_idle;
logic [0:0] ap_start_r;
logic [0:0] ap_start_pulse;
logic [0:0] ctrl_rd_fifo_prog_full;
logic [0:0] krnl_out_m_tvalid;
logic [63:0] krnl_out_m_tdata;
logic [0:0] krnl_out_m_tready;
logic [0:0] wr_fifo_out_m_tvalid;
logic [63:0] wr_fifo_out_m_tdata;
logic [0:0] wr_fifo_out_m_tready;
logic [0:0] krnl_out_m_tready_n;
logic [0:0] wr_fifo_out_m_tvalid_n;
logic [63:0] write_ptr;
logic [31:0] write_len;

krnl_card_rtl_control_s_axi krnl_card_rtl_control_s_axi_inst0 (
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
	.arg_0 (write_ptr),
	.arg_1 (write_len),
	.interrupt ()
);

card_wrapper card_wrapper_inst1 (
	.aclk (ap_aclk_2),
	.areset (areset2),
	.data_0 (p0_TDATA),
	.data_1 (p1_TDATA),
	.data_2 (p2_TDATA),
	.data_3 (p3_TDATA),
	.data_4 (p4_TDATA),
	.data_5 (p5_TDATA),
	.data_6 (p6_TDATA),
	.data_7 (p7_TDATA),
	.m_tdata (krnl_out_m_tdata),
	.m_tready (krnl_out_m_tready),
	.m_tvalid (krnl_out_m_tvalid),
	.ready_0 (p0_TREADY),
	.ready_1 (p1_TREADY),
	.ready_2 (p2_TREADY),
	.ready_3 (p3_TREADY),
	.ready_4 (p4_TREADY),
	.ready_5 (p5_TREADY),
	.ready_6 (p6_TREADY),
	.ready_7 (p7_TREADY),
	.valid_0 (p0_TVALID),
	.valid_1 (p1_TVALID),
	.valid_2 (p2_TVALID),
	.valid_3 (p3_TVALID),
	.valid_4 (p4_TVALID),
	.valid_5 (p5_TVALID),
	.valid_6 (p6_TVALID),
	.valid_7 (p7_TVALID)
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
	.PROG_FULL_THRESH (251),
	.RD_DATA_COUNT_WIDTH (9),
	.READ_DATA_WIDTH (64),
	.RELATED_CLOCKS (0),
	.WAKEUP_TIME (0),
	.WRITE_DATA_WIDTH (64),
	.WR_DATA_COUNT_WIDTH (9)
) xpm_fifo_async_inst2 (
	.dbiterr (),
	.din (krnl_out_m_tdata),
	.dout (wr_fifo_out_m_tdata),
	.empty (wr_fifo_out_m_tvalid_n),
	.full (krnl_out_m_tready_n),
	.injectdbiterr (1'd0),
	.injectsbiterr (1'd0),
	.overflow (),
	.prog_empty (),
	.prog_full (),
	.rd_clk (ap_aclk),
	.rd_data_count (),
	.rd_en (wr_fifo_out_m_tready),
	.rd_rst_busy (),
	.rst (areset2),
	.sbiterr (),
	.sleep (1'd0),
	.underflow (),
	.wr_clk (ap_aclk_2),
	.wr_data_count (),
	.wr_en (krnl_out_m_tvalid),
	.wr_rst_busy ()
);

krnl_card_rtl_axi_write_master # (
	.C_ADDR_WIDTH (64),
	.C_BURST_LEN (256),
	.C_DATA_WIDTH (64),
	.C_LOG_BURST_LEN (8),
	.C_MAX_LENGTH_WIDTH (32)
) krnl_card_rtl_axi_write_master_inst3 (
	.aclk (ap_aclk),
	.areset (areset),
	.awaddr (m_axi_gmem_AWADDR),
	.awlen (m_axi_gmem_AWLEN),
	.awready (m_axi_gmem_AWREADY),
	.awsize (m_axi_gmem_AWSIZE),
	.awvalid (m_axi_gmem_AWVALID),
	.bready (m_axi_gmem_BREADY),
	.bresp (m_axi_gmem_BRESP),
	.bvalid (m_axi_gmem_BVALID),
	.ctrl_done (ap_done),
	.ctrl_length (write_len),
	.ctrl_offset (write_ptr),
	.ctrl_start (ap_start_pulse),
	.s_tdata (wr_fifo_out_m_tdata),
	.s_tready (wr_fifo_out_m_tready),
	.s_tvalid (wr_fifo_out_m_tvalid),
	.wdata (m_axi_gmem_WDATA),
	.wlast (m_axi_gmem_WLAST),
	.wready (m_axi_gmem_WREADY),
	.wstrb (m_axi_gmem_WSTRB),
	.wvalid (m_axi_gmem_WVALID)
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
	m_axi_gmem_AWID = 1'd0;
	m_axi_gmem_AWBURST = 2'd1;
	m_axi_gmem_AWLOCK = 2'd0;
	m_axi_gmem_AWCACHE = 4'd3;
	m_axi_gmem_AWPROT = 3'd0;
	m_axi_gmem_AWQOS = 4'd0;
	m_axi_gmem_AWREGION = 4'd0;
	m_axi_gmem_ARBURST = 2'd1;
	m_axi_gmem_ARLOCK = 2'd0;
	m_axi_gmem_ARCACHE = 4'd3;
	m_axi_gmem_ARPROT = 3'd0;
	m_axi_gmem_ARQOS = 4'd0;
	m_axi_gmem_ARREGION = 4'd0;
	m_axi_gmem_ARVALID = 1'd0;
	m_axi_gmem_ARADDR = 64'd0;
	m_axi_gmem_ARID = 1'd0;
	m_axi_gmem_ARLEN = 8'd0;
	m_axi_gmem_ARSIZE = 3'd0;
	m_axi_gmem_RREADY = 1'd0;
end

always_comb begin
	krnl_out_m_tready = ! krnl_out_m_tready_n;
end

always_comb begin
	wr_fifo_out_m_tvalid = ! wr_fifo_out_m_tvalid_n;
end

endmodule

