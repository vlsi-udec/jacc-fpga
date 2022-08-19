`timescale 1ns / 1ps

module card_wrapper (
	input logic [0:0] aclk,
	input logic [0:0] areset,
	input logic [63:0] data_0,
	input logic [63:0] data_1,
	input logic [63:0] data_2,
	input logic [63:0] data_3,
	input logic [63:0] data_4,
	input logic [63:0] data_5,
	input logic [63:0] data_6,
	input logic [63:0] data_7,
	output logic [63:0] m_tdata,
	input logic [0:0] m_tready,
	output logic [0:0] m_tvalid,
	output logic [0:0] ready_0,
	output logic [0:0] ready_1,
	output logic [0:0] ready_2,
	output logic [0:0] ready_3,
	output logic [0:0] ready_4,
	output logic [0:0] ready_5,
	output logic [0:0] ready_6,
	output logic [0:0] ready_7,
	input logic [0:0] valid_0,
	input logic [0:0] valid_1,
	input logic [0:0] valid_2,
	input logic [0:0] valid_3,
	input logic [0:0] valid_4,
	input logic [0:0] valid_5,
	input logic [0:0] valid_6,
	input logic [0:0] valid_7
);

logic [7:0] valid_d;

always_ff @(posedge aclk) begin

	if (valid_0 & (! valid_d[0])) begin
		m_tdata <= data_0 | 16'd0;
		m_tvalid <= valid_0;
		ready_0 <= m_tready;
		valid_d[0] <= m_tready;
		ready_1 <= 1'd0;
		valid_d[1] <= 1'd0;
		ready_2 <= 1'd0;
		valid_d[2] <= 1'd0;
		ready_3 <= 1'd0;
		valid_d[3] <= 1'd0;
		ready_4 <= 1'd0;
		valid_d[4] <= 1'd0;
		ready_5 <= 1'd0;
		valid_d[5] <= 1'd0;
		ready_6 <= 1'd0;
		valid_d[6] <= 1'd0;
		ready_7 <= 1'd0;
		valid_d[7] <= 1'd0;
	end
	else if (valid_1 & (! valid_d[1])) begin
		m_tdata <= data_1 | 16'd1;
		m_tvalid <= valid_1;
		ready_1 <= m_tready;
		valid_d[1] <= m_tready;
		ready_0 <= 1'd0;
		valid_d[0] <= 1'd0;
		ready_2 <= 1'd0;
		valid_d[2] <= 1'd0;
		ready_3 <= 1'd0;
		valid_d[3] <= 1'd0;
		ready_4 <= 1'd0;
		valid_d[4] <= 1'd0;
		ready_5 <= 1'd0;
		valid_d[5] <= 1'd0;
		ready_6 <= 1'd0;
		valid_d[6] <= 1'd0;
		ready_7 <= 1'd0;
		valid_d[7] <= 1'd0;
	end
	else if (valid_2 & (! valid_d[2])) begin
		m_tdata <= data_2 | 16'd2;
		m_tvalid <= valid_2;
		ready_2 <= m_tready;
		valid_d[2] <= m_tready;
		ready_0 <= 1'd0;
		valid_d[0] <= 1'd0;
		ready_1 <= 1'd0;
		valid_d[1] <= 1'd0;
		ready_3 <= 1'd0;
		valid_d[3] <= 1'd0;
		ready_4 <= 1'd0;
		valid_d[4] <= 1'd0;
		ready_5 <= 1'd0;
		valid_d[5] <= 1'd0;
		ready_6 <= 1'd0;
		valid_d[6] <= 1'd0;
		ready_7 <= 1'd0;
		valid_d[7] <= 1'd0;
	end
	else if (valid_3 & (! valid_d[3])) begin
		m_tdata <= data_3 | 16'd3;
		m_tvalid <= valid_3;
		ready_3 <= m_tready;
		valid_d[3] <= m_tready;
		ready_0 <= 1'd0;
		valid_d[0] <= 1'd0;
		ready_1 <= 1'd0;
		valid_d[1] <= 1'd0;
		ready_2 <= 1'd0;
		valid_d[2] <= 1'd0;
		ready_4 <= 1'd0;
		valid_d[4] <= 1'd0;
		ready_5 <= 1'd0;
		valid_d[5] <= 1'd0;
		ready_6 <= 1'd0;
		valid_d[6] <= 1'd0;
		ready_7 <= 1'd0;
		valid_d[7] <= 1'd0;
	end
	else if (valid_4 & (! valid_d[4])) begin
		m_tdata <= data_4 | 16'd4;
		m_tvalid <= valid_4;
		ready_4 <= m_tready;
		valid_d[4] <= m_tready;
		ready_0 <= 1'd0;
		valid_d[0] <= 1'd0;
		ready_1 <= 1'd0;
		valid_d[1] <= 1'd0;
		ready_2 <= 1'd0;
		valid_d[2] <= 1'd0;
		ready_3 <= 1'd0;
		valid_d[3] <= 1'd0;
		ready_5 <= 1'd0;
		valid_d[5] <= 1'd0;
		ready_6 <= 1'd0;
		valid_d[6] <= 1'd0;
		ready_7 <= 1'd0;
		valid_d[7] <= 1'd0;
	end
	else if (valid_5 & (! valid_d[5])) begin
		m_tdata <= data_5 | 16'd5;
		m_tvalid <= valid_5;
		ready_5 <= m_tready;
		valid_d[5] <= m_tready;
		ready_0 <= 1'd0;
		valid_d[0] <= 1'd0;
		ready_1 <= 1'd0;
		valid_d[1] <= 1'd0;
		ready_2 <= 1'd0;
		valid_d[2] <= 1'd0;
		ready_3 <= 1'd0;
		valid_d[3] <= 1'd0;
		ready_4 <= 1'd0;
		valid_d[4] <= 1'd0;
		ready_6 <= 1'd0;
		valid_d[6] <= 1'd0;
		ready_7 <= 1'd0;
		valid_d[7] <= 1'd0;
	end
	else if (valid_6 & (! valid_d[6])) begin
		m_tdata <= data_6 | 16'd6;
		m_tvalid <= valid_6;
		ready_6 <= m_tready;
		valid_d[6] <= m_tready;
		ready_0 <= 1'd0;
		valid_d[0] <= 1'd0;
		ready_1 <= 1'd0;
		valid_d[1] <= 1'd0;
		ready_2 <= 1'd0;
		valid_d[2] <= 1'd0;
		ready_3 <= 1'd0;
		valid_d[3] <= 1'd0;
		ready_4 <= 1'd0;
		valid_d[4] <= 1'd0;
		ready_5 <= 1'd0;
		valid_d[5] <= 1'd0;
		ready_7 <= 1'd0;
		valid_d[7] <= 1'd0;
	end
	else if (valid_7 & (! valid_d[7])) begin
		m_tdata <= data_7 | 16'd7;
		m_tvalid <= valid_7;
		ready_7 <= m_tready;
		valid_d[7] <= m_tready;
		ready_0 <= 1'd0;
		valid_d[0] <= 1'd0;
		ready_1 <= 1'd0;
		valid_d[1] <= 1'd0;
		ready_2 <= 1'd0;
		valid_d[2] <= 1'd0;
		ready_3 <= 1'd0;
		valid_d[3] <= 1'd0;
		ready_4 <= 1'd0;
		valid_d[4] <= 1'd0;
		ready_5 <= 1'd0;
		valid_d[5] <= 1'd0;
		ready_6 <= 1'd0;
		valid_d[6] <= 1'd0;
	end
	else begin
		m_tvalid <= 1'd0;
		ready_0 <= 1'd0;
		ready_1 <= 1'd0;
		ready_2 <= 1'd0;
		ready_3 <= 1'd0;
		ready_4 <= 1'd0;
		ready_5 <= 1'd0;
		ready_6 <= 1'd0;
		ready_7 <= 1'd0;
		valid_d <= 8'd0;
	end
end

endmodule

