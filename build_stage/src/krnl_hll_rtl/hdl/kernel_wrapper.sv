`timescale 1ns / 1ps

module kernel_wrapper (
	input logic [0:0] aclk,
	input logic [0:0] areset,
	output logic [63:0] cardinality_id_0,
	output logic [63:0] cardinality_id_1,
	output logic [63:0] cardinality_id_2,
	output logic [63:0] cardinality_id_3,
	output logic [63:0] cardinality_id_4,
	output logic [63:0] cardinality_id_5,
	output logic [63:0] cardinality_id_6,
	output logic [63:0] cardinality_id_7,
	input logic [0:0] cardinality_ready_0,
	input logic [0:0] cardinality_ready_1,
	input logic [0:0] cardinality_ready_2,
	input logic [0:0] cardinality_ready_3,
	input logic [0:0] cardinality_ready_4,
	input logic [0:0] cardinality_ready_5,
	input logic [0:0] cardinality_ready_6,
	input logic [0:0] cardinality_ready_7,
	output logic [0:0] cardinality_valid_0,
	output logic [0:0] cardinality_valid_1,
	output logic [0:0] cardinality_valid_2,
	output logic [0:0] cardinality_valid_3,
	output logic [0:0] cardinality_valid_4,
	output logic [0:0] cardinality_valid_5,
	output logic [0:0] cardinality_valid_6,
	output logic [0:0] cardinality_valid_7,
	output logic [7:0] count_zero,
	input logic [7:0] count_zero_ack,
	output logic [511:0] s0m_tdata,
	input logic [0:0] s0m_tready,
	output logic [0:0] s0m_tvalid,
	output logic [511:0] s1m_tdata,
	input logic [0:0] s1m_tready,
	output logic [0:0] s1m_tvalid,
	output logic [511:0] s2m_tdata,
	input logic [0:0] s2m_tready,
	output logic [0:0] s2m_tvalid,
	output logic [511:0] s3m_tdata,
	input logic [0:0] s3m_tready,
	output logic [0:0] s3m_tvalid,
	output logic [511:0] s4m_tdata,
	input logic [0:0] s4m_tready,
	output logic [0:0] s4m_tvalid,
	output logic [511:0] s5m_tdata,
	input logic [0:0] s5m_tready,
	output logic [0:0] s5m_tvalid,
	output logic [511:0] s6m_tdata,
	input logic [0:0] s6m_tready,
	output logic [0:0] s6m_tvalid,
	output logic [511:0] s7m_tdata,
	input logic [0:0] s7m_tready,
	output logic [0:0] s7m_tvalid,
	input logic [511:0] s_tdata,
	output logic [0:0] s_tready,
	input logic [0:0] s_tvalid,
	input logic [63:0] sketch_ptr_0,
	input logic [63:0] sketch_ptr_1,
	input logic [63:0] sketch_ptr_2,
	input logic [63:0] sketch_ptr_3,
	input logic [63:0] sketch_ptr_4,
	input logic [63:0] sketch_ptr_5,
	input logic [63:0] sketch_ptr_6,
	input logic [63:0] sketch_ptr_7,
	output logic [63:0] sketch_ptr_out_0,
	output logic [63:0] sketch_ptr_out_1,
	output logic [63:0] sketch_ptr_out_2,
	output logic [63:0] sketch_ptr_out_3,
	output logic [63:0] sketch_ptr_out_4,
	output logic [63:0] sketch_ptr_out_5,
	output logic [63:0] sketch_ptr_out_6,
	output logic [63:0] sketch_ptr_out_7,
	input logic [0:0] sketch_ptr_source
);

logic [7:0] last_input_d[4:0];
logic [47:0] cardinality_in_0;
logic [47:0] cardinality_in_1;
logic [47:0] cardinality_in_2;
logic [47:0] cardinality_in_3;
logic [47:0] cardinality_in_4;
logic [47:0] cardinality_in_5;
logic [47:0] cardinality_in_6;
logic [47:0] cardinality_in_7;
logic [0:0] ibusy;
logic [7:0] busy;
logic [7:0] last_input;
logic [0:0] sketch_ptr_source_d = 1'd0;
logic [0:0] sketch_ptr_source_pulse = 1'd0;

hyperloglog hyperloglog_inst0 (
	.busy (busy[0]),
	.cardinality (cardinality_in_0),
	.cardinality_ready (cardinality_ready_0),
	.cardinality_valid (cardinality_valid_0),
	.clk (aclk),
	.in_data (s_tdata[63:0]),
	.in_valid (s_tvalid && s_tready),
	.last_input (last_input[0]),
	.out_data (s0m_tdata),
	.out_ready (s0m_tready),
	.out_valid (s0m_tvalid)
);

hyperloglog hyperloglog_inst1 (
	.busy (busy[1]),
	.cardinality (cardinality_in_1),
	.cardinality_ready (cardinality_ready_1),
	.cardinality_valid (cardinality_valid_1),
	.clk (aclk),
	.in_data (s_tdata[127:64]),
	.in_valid (s_tvalid && s_tready),
	.last_input (last_input[1]),
	.out_data (s1m_tdata),
	.out_ready (s1m_tready),
	.out_valid (s1m_tvalid)
);

hyperloglog hyperloglog_inst2 (
	.busy (busy[2]),
	.cardinality (cardinality_in_2),
	.cardinality_ready (cardinality_ready_2),
	.cardinality_valid (cardinality_valid_2),
	.clk (aclk),
	.in_data (s_tdata[191:128]),
	.in_valid (s_tvalid && s_tready),
	.last_input (last_input[2]),
	.out_data (s2m_tdata),
	.out_ready (s2m_tready),
	.out_valid (s2m_tvalid)
);

hyperloglog hyperloglog_inst3 (
	.busy (busy[3]),
	.cardinality (cardinality_in_3),
	.cardinality_ready (cardinality_ready_3),
	.cardinality_valid (cardinality_valid_3),
	.clk (aclk),
	.in_data (s_tdata[255:192]),
	.in_valid (s_tvalid && s_tready),
	.last_input (last_input[3]),
	.out_data (s3m_tdata),
	.out_ready (s3m_tready),
	.out_valid (s3m_tvalid)
);

hyperloglog hyperloglog_inst4 (
	.busy (busy[4]),
	.cardinality (cardinality_in_4),
	.cardinality_ready (cardinality_ready_4),
	.cardinality_valid (cardinality_valid_4),
	.clk (aclk),
	.in_data (s_tdata[319:256]),
	.in_valid (s_tvalid && s_tready),
	.last_input (last_input[4]),
	.out_data (s4m_tdata),
	.out_ready (s4m_tready),
	.out_valid (s4m_tvalid)
);

hyperloglog hyperloglog_inst5 (
	.busy (busy[5]),
	.cardinality (cardinality_in_5),
	.cardinality_ready (cardinality_ready_5),
	.cardinality_valid (cardinality_valid_5),
	.clk (aclk),
	.in_data (s_tdata[383:320]),
	.in_valid (s_tvalid && s_tready),
	.last_input (last_input[5]),
	.out_data (s5m_tdata),
	.out_ready (s5m_tready),
	.out_valid (s5m_tvalid)
);

hyperloglog hyperloglog_inst6 (
	.busy (busy[6]),
	.cardinality (cardinality_in_6),
	.cardinality_ready (cardinality_ready_6),
	.cardinality_valid (cardinality_valid_6),
	.clk (aclk),
	.in_data (s_tdata[447:384]),
	.in_valid (s_tvalid && s_tready),
	.last_input (last_input[6]),
	.out_data (s6m_tdata),
	.out_ready (s6m_tready),
	.out_valid (s6m_tvalid)
);

hyperloglog hyperloglog_inst7 (
	.busy (busy[7]),
	.cardinality (cardinality_in_7),
	.cardinality_ready (cardinality_ready_7),
	.cardinality_valid (cardinality_valid_7),
	.clk (aclk),
	.in_data (s_tdata[511:448]),
	.in_valid (s_tvalid && s_tready),
	.last_input (last_input[7]),
	.out_data (s7m_tdata),
	.out_ready (s7m_tready),
	.out_valid (s7m_tvalid)
);

always_comb begin
	ibusy = |busy;
	cardinality_id_0 = {cardinality_in_0, 16'd0};
	cardinality_id_1 = {cardinality_in_1, 16'd1};
	cardinality_id_2 = {cardinality_in_2, 16'd2};
	cardinality_id_3 = {cardinality_in_3, 16'd3};
	cardinality_id_4 = {cardinality_in_4, 16'd4};
	cardinality_id_5 = {cardinality_in_5, 16'd5};
	cardinality_id_6 = {cardinality_in_6, 16'd6};
	cardinality_id_7 = {cardinality_in_7, 16'd7};
end

always_ff @(posedge aclk) begin
	s_tready <= s_tvalid & (! ibusy);
	last_input_d[0] <= last_input;
	last_input_d[1] <= last_input_d[0];
	last_input_d[2] <= last_input_d[1];
	last_input_d[3] <= last_input_d[2];
	last_input_d[4] <= last_input_d[3];
	sketch_ptr_source_d <= sketch_ptr_source;
	sketch_ptr_source_pulse <= (! sketch_ptr_source_d) & sketch_ptr_source;

	if (last_input_d[4][0] & (! last_input_d[3][0])) begin
		count_zero[0] <= 1'd1;
	end
	else if (count_zero_ack[0]) begin
		count_zero[0] <= 1'd0;
	end

	if (last_input_d[4][1] & (! last_input_d[3][1])) begin
		count_zero[1] <= 1'd1;
	end
	else if (count_zero_ack[1]) begin
		count_zero[1] <= 1'd0;
	end

	if (last_input_d[4][2] & (! last_input_d[3][2])) begin
		count_zero[2] <= 1'd1;
	end
	else if (count_zero_ack[2]) begin
		count_zero[2] <= 1'd0;
	end

	if (last_input_d[4][3] & (! last_input_d[3][3])) begin
		count_zero[3] <= 1'd1;
	end
	else if (count_zero_ack[3]) begin
		count_zero[3] <= 1'd0;
	end

	if (last_input_d[4][4] & (! last_input_d[3][4])) begin
		count_zero[4] <= 1'd1;
	end
	else if (count_zero_ack[4]) begin
		count_zero[4] <= 1'd0;
	end

	if (last_input_d[4][5] & (! last_input_d[3][5])) begin
		count_zero[5] <= 1'd1;
	end
	else if (count_zero_ack[5]) begin
		count_zero[5] <= 1'd0;
	end

	if (last_input_d[4][6] & (! last_input_d[3][6])) begin
		count_zero[6] <= 1'd1;
	end
	else if (count_zero_ack[6]) begin
		count_zero[6] <= 1'd0;
	end

	if (last_input_d[4][7] & (! last_input_d[3][7])) begin
		count_zero[7] <= 1'd1;
	end
	else if (count_zero_ack[7]) begin
		count_zero[7] <= 1'd0;
	end

	if (sketch_ptr_source_pulse) begin
		sketch_ptr_out_0 <= sketch_ptr_0;
	end
	else if (last_input[0] & (! last_input_d[0][0])) begin
		sketch_ptr_out_0 <= sketch_ptr_out_0 + 64'd8192;
	end
	else begin
		sketch_ptr_out_0 <= sketch_ptr_out_0;
	end

	if (sketch_ptr_source_pulse) begin
		sketch_ptr_out_1 <= sketch_ptr_1;
	end
	else if (last_input[1] & (! last_input_d[0][1])) begin
		sketch_ptr_out_1 <= sketch_ptr_out_1 + 64'd8192;
	end
	else begin
		sketch_ptr_out_1 <= sketch_ptr_out_1;
	end

	if (sketch_ptr_source_pulse) begin
		sketch_ptr_out_2 <= sketch_ptr_2;
	end
	else if (last_input[2] & (! last_input_d[0][2])) begin
		sketch_ptr_out_2 <= sketch_ptr_out_2 + 64'd8192;
	end
	else begin
		sketch_ptr_out_2 <= sketch_ptr_out_2;
	end

	if (sketch_ptr_source_pulse) begin
		sketch_ptr_out_3 <= sketch_ptr_3;
	end
	else if (last_input[3] & (! last_input_d[0][3])) begin
		sketch_ptr_out_3 <= sketch_ptr_out_3 + 64'd8192;
	end
	else begin
		sketch_ptr_out_3 <= sketch_ptr_out_3;
	end

	if (sketch_ptr_source_pulse) begin
		sketch_ptr_out_4 <= sketch_ptr_4;
	end
	else if (last_input[4] & (! last_input_d[0][4])) begin
		sketch_ptr_out_4 <= sketch_ptr_out_4 + 64'd8192;
	end
	else begin
		sketch_ptr_out_4 <= sketch_ptr_out_4;
	end

	if (sketch_ptr_source_pulse) begin
		sketch_ptr_out_5 <= sketch_ptr_5;
	end
	else if (last_input[5] & (! last_input_d[0][5])) begin
		sketch_ptr_out_5 <= sketch_ptr_out_5 + 64'd8192;
	end
	else begin
		sketch_ptr_out_5 <= sketch_ptr_out_5;
	end

	if (sketch_ptr_source_pulse) begin
		sketch_ptr_out_6 <= sketch_ptr_6;
	end
	else if (last_input[6] & (! last_input_d[0][6])) begin
		sketch_ptr_out_6 <= sketch_ptr_out_6 + 64'd8192;
	end
	else begin
		sketch_ptr_out_6 <= sketch_ptr_out_6;
	end

	if (sketch_ptr_source_pulse) begin
		sketch_ptr_out_7 <= sketch_ptr_7;
	end
	else if (last_input[7] & (! last_input_d[0][7])) begin
		sketch_ptr_out_7 <= sketch_ptr_out_7 + 64'd8192;
	end
	else begin
		sketch_ptr_out_7 <= sketch_ptr_out_7;
	end
end

endmodule

