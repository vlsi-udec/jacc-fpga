`timescale 1ns / 1ps

module krnl_hll_rtl_control_s_axi (
	input logic [31:0] ARADDR,
	output logic [0:0] ARREADY,
	input logic [0:0] ARVALID,
	input logic [31:0] AWADDR,
	output logic [0:0] AWREADY,
	input logic [0:0] AWVALID,
	input logic [0:0] BREADY,
	output logic [1:0] BRESP,
	output logic [0:0] BVALID,
	output logic [31:0] RDATA,
	input logic [0:0] RREADY,
	output logic [1:0] RRESP,
	output logic [0:0] RVALID,
	input logic [31:0] WDATA,
	output logic [0:0] WREADY,
	input logic [3:0] WSTRB,
	input logic [0:0] WVALID,
	input logic [0:0] aclk,
	input logic [0:0] aclken,
	input logic [0:0] ap_done,
	input logic [0:0] ap_idle,
	input logic [0:0] ap_ready,
	output logic [0:0] ap_start,
	input logic [0:0] areset,
	output logic [63:0] arg_0,
	output logic [31:0] arg_1,
	output logic [63:0] arg_10,
	output logic [31:0] arg_2,
	output logic [63:0] arg_3,
	output logic [63:0] arg_4,
	output logic [63:0] arg_5,
	output logic [63:0] arg_6,
	output logic [63:0] arg_7,
	output logic [63:0] arg_8,
	output logic [63:0] arg_9,
	output logic [0:0] interrupt
);

logic [1:0] wstate = 2'd0;
logic [1:0] wnext;
logic [7:0] waddr;
logic [31:0] wmask;
logic [0:0] aw_hs;
logic [0:0] w_hs;
logic [1:0] rstate = 2'd0;
logic [1:0] rnext;
logic [31:0] rdata;
logic [0:0] ar_hs;
logic [7:0] raddr;
logic [0:0] int_ap_idle;
logic [0:0] int_ap_ready;
logic [0:0] int_ap_done = 1'd0;
logic [0:0] int_ap_start = 1'd0;
logic [0:0] int_auto_restart = 1'd0;
logic [0:0] int_gie = 1'd0;
logic [1:0] int_ier = 2'd0;
logic [1:0] int_isr = 2'd0;
logic [63:0] int_a = 64'd0;
logic [63:0] int_b = 64'd0;
logic [63:0] int_c = 64'd0;
logic [31:0] int_length_r = 32'd0;

always_comb begin
	AWREADY = (! areset) & (wstate == 2'd0);
	WREADY = wstate == 2'd1;
	BRESP = 2'd0;
	BVALID = wstate == 2'd2;
	aw_hs = AWVALID & AWREADY;
	w_hs = WVALID & WREADY;

	if (WSTRB[0]) begin
		wmask[7:0] = 8'd255;
	end
	else begin
		wmask[7:0] = 8'd0;
	end

	if (WSTRB[1]) begin
		wmask[15:8] = 8'd255;
	end
	else begin
		wmask[15:8] = 8'd0;
	end

	if (WSTRB[2]) begin
		wmask[23:16] = 8'd255;
	end
	else begin
		wmask[23:16] = 8'd0;
	end

	if (WSTRB[3]) begin
		wmask[31:24] = 8'd255;
	end
	else begin
		wmask[31:24] = 8'd0;
	end
	interrupt = int_gie & (int_isr[0] | int_isr[1]);
	ap_start = int_ap_start;
	int_ap_idle = ap_idle;
	int_ap_ready = ap_ready;
end

always_ff @(posedge aclk) begin
	if (areset) begin
		wstate <= 2'd0;
	end
	else begin

		if (aclken) begin
			wstate <= wnext;
		end
	end
end

always_ff @(*) begin

	if (wstate == 2'd0) begin

		if (AWVALID) begin
			wnext <= 2'd1;
		end
		else begin
			wnext <= 2'd0;
		end
	end
	else if (wstate == 2'd1) begin

		if (WVALID) begin
			wnext <= 2'd2;
		end
		else begin
			wnext <= 2'd1;
		end
	end
	else if (wstate == 2'd2) begin

		if (BREADY) begin
			wnext <= 2'd0;
		end
		else begin
			wnext <= 2'd2;
		end
	end
	else begin
		wnext <= 2'd0;
	end
end

always_ff @(posedge aclk) begin

	if (aclken && aw_hs) begin
		waddr <= AWADDR[7:0];
	end
end

always_comb begin
	ARREADY = (! areset) && (rstate == 2'd0);
	RDATA = rdata;
	RRESP = 2'd0;
	RVALID = rstate == 2'd1;
	ar_hs = ARVALID && ARREADY;
	raddr = ARADDR[7:0];
end

always_ff @(posedge aclk) begin
	if (areset) begin
		rstate <= 2'd0;
	end
	else begin

		if (aclken) begin
			rstate <= rnext;
		end
	end
end

always_ff @(*) begin

	if (rstate == 2'd0) begin

		if (ARVALID) begin
			rnext <= 2'd1;
		end
		else begin
			rnext <= 2'd0;
		end
	end
	else if (rstate == 2'd1) begin

		if (RREADY && RVALID) begin
			rnext <= 2'd0;
		end
		else begin
			rnext <= 2'd1;
		end
	end
	else begin
		rnext <= 2'd0;
	end
end

always_ff @(posedge aclk) begin

	if (aclken && ar_hs) begin

		if (raddr == 8'd0) begin
			rdata[0] <= int_ap_start;
			rdata[1] <= int_ap_done;
			rdata[2] <= int_ap_idle;
			rdata[3] <= int_ap_ready;
			rdata[4] <= 1'd0;
			rdata[5] <= 1'd0;
			rdata[6] <= 1'd0;
			rdata[7] <= int_auto_restart;
		end
		else if (raddr == 8'd4) begin
			rdata <= int_gie;
		end
		else if (raddr == 8'd8) begin
			rdata <= int_ier;
		end
		else if (raddr == 8'd12) begin
			rdata <= int_isr;
		end
		else if (raddr == 8'd16) begin
			rdata <= arg_0[31:0];
		end
		else if (raddr == 8'd20) begin
			rdata <= arg_0[63:32];
		end
		else if (raddr == 8'd28) begin
			rdata <= arg_1;
		end
		else if (raddr == 8'd36) begin
			rdata <= arg_2;
		end
		else if (raddr == 8'd44) begin
			rdata <= arg_3[31:0];
		end
		else if (raddr == 8'd48) begin
			rdata <= arg_3[63:32];
		end
		else if (raddr == 8'd56) begin
			rdata <= arg_4[31:0];
		end
		else if (raddr == 8'd60) begin
			rdata <= arg_4[63:32];
		end
		else if (raddr == 8'd68) begin
			rdata <= arg_5[31:0];
		end
		else if (raddr == 8'd72) begin
			rdata <= arg_5[63:32];
		end
		else if (raddr == 8'd80) begin
			rdata <= arg_6[31:0];
		end
		else if (raddr == 8'd84) begin
			rdata <= arg_6[63:32];
		end
		else if (raddr == 8'd92) begin
			rdata <= arg_7[31:0];
		end
		else if (raddr == 8'd96) begin
			rdata <= arg_7[63:32];
		end
		else if (raddr == 8'd104) begin
			rdata <= arg_8[31:0];
		end
		else if (raddr == 8'd108) begin
			rdata <= arg_8[63:32];
		end
		else if (raddr == 8'd116) begin
			rdata <= arg_9[31:0];
		end
		else if (raddr == 8'd120) begin
			rdata <= arg_9[63:32];
		end
		else if (raddr == 8'd128) begin
			rdata <= arg_10[31:0];
		end
		else if (raddr == 8'd132) begin
			rdata <= arg_10[63:32];
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		int_ap_start <= 1'd0;
	end
	else if (aclken) begin

		if (((w_hs && (waddr == 8'd0)) && WSTRB[0]) && WDATA[0]) begin
			int_ap_start <= 1'd1;
		end
		else if (int_ap_ready) begin
			int_ap_start <= int_auto_restart;
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		int_ap_done <= 1'd0;
	end
	else if (aclken) begin

		if (ap_done) begin
			int_ap_done <= 1'd1;
		end
		else if (ar_hs && (raddr == 8'd0)) begin
			int_ap_done <= 1'd0;
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		int_auto_restart <= 1'd0;
	end
	else if (aclken) begin

		if ((w_hs && (waddr == 8'd0)) && WSTRB[0]) begin
			int_auto_restart <= WDATA[7];
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		int_gie <= 1'd0;
	end
	else if (aclken) begin

		if ((w_hs && (waddr == 8'd4)) && WSTRB[0]) begin
			int_gie <= WDATA[0];
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		int_ier <= 2'd0;
	end
	else if (aclken) begin

		if ((w_hs && (waddr == 8'd8)) && WSTRB[0]) begin
			int_ier <= WDATA[1:0];
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		int_isr[0] <= 1'd0;
	end
	else if (aclken) begin

		if (int_ier[0] && ap_done) begin
			int_isr[0] <= 1'd1;
		end
		else if ((w_hs && (waddr == 8'd12)) && WSTRB[0]) begin
			int_isr[0] <= int_isr[0] ^ WDATA[0];
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		int_isr[1] <= 1'd0;
	end
	else if (aclken) begin

		if (int_ier[1] && ap_ready) begin
			int_isr[1] <= 1'd1;
		end
		else if ((w_hs && (waddr == 8'd12)) && WSTRB[0]) begin
			int_isr[1] <= int_isr[1] ^ WDATA[1];
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_0[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd16)) begin
			arg_0[31:0] <= (WDATA & wmask) | (arg_0[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_0[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd20)) begin
			arg_0[63:32] <= (WDATA & wmask) | (arg_0[63:32] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_1 <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd28)) begin
			arg_1 <= (WDATA & wmask) | (arg_1 & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_2 <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd36)) begin
			arg_2 <= (WDATA & wmask) | (arg_2 & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_3[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd44)) begin
			arg_3[31:0] <= (WDATA & wmask) | (arg_3[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_3[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd48)) begin
			arg_3[63:32] <= (WDATA & wmask) | (arg_3[63:32] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_4[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd56)) begin
			arg_4[31:0] <= (WDATA & wmask) | (arg_4[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_4[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd60)) begin
			arg_4[63:32] <= (WDATA & wmask) | (arg_4[63:32] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_5[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd68)) begin
			arg_5[31:0] <= (WDATA & wmask) | (arg_5[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_5[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd72)) begin
			arg_5[63:32] <= (WDATA & wmask) | (arg_5[63:32] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_6[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd80)) begin
			arg_6[31:0] <= (WDATA & wmask) | (arg_6[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_6[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd84)) begin
			arg_6[63:32] <= (WDATA & wmask) | (arg_6[63:32] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_7[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd92)) begin
			arg_7[31:0] <= (WDATA & wmask) | (arg_7[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_7[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd96)) begin
			arg_7[63:32] <= (WDATA & wmask) | (arg_7[63:32] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_8[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd104)) begin
			arg_8[31:0] <= (WDATA & wmask) | (arg_8[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_8[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd108)) begin
			arg_8[63:32] <= (WDATA & wmask) | (arg_8[63:32] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_9[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd116)) begin
			arg_9[31:0] <= (WDATA & wmask) | (arg_9[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_9[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd120)) begin
			arg_9[63:32] <= (WDATA & wmask) | (arg_9[63:32] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_10[31:0] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd128)) begin
			arg_10[31:0] <= (WDATA & wmask) | (arg_10[31:0] & (~wmask));
		end
	end
end

always_ff @(posedge aclk) begin

	if (areset) begin
		arg_10[63:32] <= 32'd0;
	end
	else if (aclken) begin

		if (w_hs && (waddr == 8'd132)) begin
			arg_10[63:32] <= (WDATA & wmask) | (arg_10[63:32] & (~wmask));
		end
	end
end

endmodule

