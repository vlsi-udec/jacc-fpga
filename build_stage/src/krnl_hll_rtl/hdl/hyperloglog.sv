`timescale 1ns / 1ps

module hyperloglog (
	output logic [0:0] busy,
	output logic [47:0] cardinality,
	input logic [0:0] cardinality_ready,
	output logic [0:0] cardinality_valid,
	input logic [0:0] clk,
	input logic [63:0] in_data,
	input logic [0:0] in_valid,
	output logic [0:0] last_input,
	output logic [511:0] out_data,
	input logic [0:0] out_ready,
	output logic [0:0] out_valid
);

logic [61:0] kmers_out[7:0];
logic [61:0] canonical_out[7:0];
logic [63:0] hash_out[7:0];
logic [3:0] leftmost_out[7:0];
logic [13:0] bucket_idx[7:0];
logic [7:0] last_input_i = 8'd0;
logic [0:0] last_input_in = 1'd0;
logic [34:0] last_input_d = 35'd0;
logic [1:0] in_valid_d = 2'd0;
logic [0:0] busy_in = 1'd0;
logic [15:0] basebin;
logic [7:0] basebin_valid;
logic [13:0] basebin_nl;
logic [6:0] basebin_valid_nl;
logic [15:0] basebin_d;
logic [7:0] basebin_valid_d;
logic [7:0] nl;
logic [0:0] nl_bin;
logic [79:0] kmer;
logic [39:0] kmer_mask = 40'd0;
logic [7:0] kmers_valid;
logic [7:0] canonical_valid;
logic [7:0] hash_valid;
logic [7:0] leftmost_valid;
logic [7:0] bucket_valid;
logic [0:0] hll_select = 1'd0;
logic [0:0] hll_busy_1;
logic [0:0] hll_busy_2;
logic [511:0] hll_out_1;
logic [511:0] hll_out_2;
logic [0:0] hll_valid_1;
logic [0:0] hll_valid_2;
logic [7:0] hll_valid_in1;
logic [7:0] hll_valid_in2;

base2bin base2bin_inst0 (
	.clk (clk),
	.in_data (in_data[63:56]),
	.in_valid (in_valid),
	.nl (nl[0]),
	.out_data (basebin[1:0]),
	.out_valid (basebin_valid[0])
);

base2bin base2bin_inst1 (
	.clk (clk),
	.in_data (in_data[55:48]),
	.in_valid (in_valid),
	.nl (nl[1]),
	.out_data (basebin[3:2]),
	.out_valid (basebin_valid[1])
);

base2bin base2bin_inst2 (
	.clk (clk),
	.in_data (in_data[47:40]),
	.in_valid (in_valid),
	.nl (nl[2]),
	.out_data (basebin[5:4]),
	.out_valid (basebin_valid[2])
);

base2bin base2bin_inst3 (
	.clk (clk),
	.in_data (in_data[39:32]),
	.in_valid (in_valid),
	.nl (nl[3]),
	.out_data (basebin[7:6]),
	.out_valid (basebin_valid[3])
);

base2bin base2bin_inst4 (
	.clk (clk),
	.in_data (in_data[31:24]),
	.in_valid (in_valid),
	.nl (nl[4]),
	.out_data (basebin[9:8]),
	.out_valid (basebin_valid[4])
);

base2bin base2bin_inst5 (
	.clk (clk),
	.in_data (in_data[23:16]),
	.in_valid (in_valid),
	.nl (nl[5]),
	.out_data (basebin[11:10]),
	.out_valid (basebin_valid[5])
);

base2bin base2bin_inst6 (
	.clk (clk),
	.in_data (in_data[15:8]),
	.in_valid (in_valid),
	.nl (nl[6]),
	.out_data (basebin[13:12]),
	.out_valid (basebin_valid[6])
);

base2bin base2bin_inst7 (
	.clk (clk),
	.in_data (in_data[7:0]),
	.in_valid (in_valid),
	.nl (nl[7]),
	.out_data (basebin[15:14]),
	.out_valid (basebin_valid[7])
);

canonical_kmer canonical_kmer_inst8 (
	.clk (clk),
	.in_data (kmers_out[0]),
	.in_valid (kmers_valid[0]),
	.out_data (canonical_out[0]),
	.out_valid (canonical_valid[0])
);

mmh3_f64 mmh3_f64_inst9 (
	.clk (clk),
	.hash (hash_out[0]),
	.in_data (canonical_out[0]),
	.in_valid (canonical_valid[0]),
	.out_valid (hash_valid[0])
);

leftmost_bit leftmost_bit_inst10 (
	.clk (clk),
	.in_data (hash_out[0][29:14]),
	.in_valid (hash_valid[0]),
	.leftmost (leftmost_out[0]),
	.leftmost_valid (leftmost_valid[0])
);

delay delay_inst11 (
	.clk (clk),
	.in_data (hash_out[0][13:0]),
	.in_valid (hash_valid[0]),
	.out_data (bucket_idx[0]),
	.out_valid (bucket_valid[0])
);

canonical_kmer canonical_kmer_inst12 (
	.clk (clk),
	.in_data (kmers_out[1]),
	.in_valid (kmers_valid[1]),
	.out_data (canonical_out[1]),
	.out_valid (canonical_valid[1])
);

mmh3_f64 mmh3_f64_inst13 (
	.clk (clk),
	.hash (hash_out[1]),
	.in_data (canonical_out[1]),
	.in_valid (canonical_valid[1]),
	.out_valid (hash_valid[1])
);

leftmost_bit leftmost_bit_inst14 (
	.clk (clk),
	.in_data (hash_out[1][29:14]),
	.in_valid (hash_valid[1]),
	.leftmost (leftmost_out[1]),
	.leftmost_valid (leftmost_valid[1])
);

delay delay_inst15 (
	.clk (clk),
	.in_data (hash_out[1][13:0]),
	.in_valid (hash_valid[1]),
	.out_data (bucket_idx[1]),
	.out_valid (bucket_valid[1])
);

canonical_kmer canonical_kmer_inst16 (
	.clk (clk),
	.in_data (kmers_out[2]),
	.in_valid (kmers_valid[2]),
	.out_data (canonical_out[2]),
	.out_valid (canonical_valid[2])
);

mmh3_f64 mmh3_f64_inst17 (
	.clk (clk),
	.hash (hash_out[2]),
	.in_data (canonical_out[2]),
	.in_valid (canonical_valid[2]),
	.out_valid (hash_valid[2])
);

leftmost_bit leftmost_bit_inst18 (
	.clk (clk),
	.in_data (hash_out[2][29:14]),
	.in_valid (hash_valid[2]),
	.leftmost (leftmost_out[2]),
	.leftmost_valid (leftmost_valid[2])
);

delay delay_inst19 (
	.clk (clk),
	.in_data (hash_out[2][13:0]),
	.in_valid (hash_valid[2]),
	.out_data (bucket_idx[2]),
	.out_valid (bucket_valid[2])
);

canonical_kmer canonical_kmer_inst20 (
	.clk (clk),
	.in_data (kmers_out[3]),
	.in_valid (kmers_valid[3]),
	.out_data (canonical_out[3]),
	.out_valid (canonical_valid[3])
);

mmh3_f64 mmh3_f64_inst21 (
	.clk (clk),
	.hash (hash_out[3]),
	.in_data (canonical_out[3]),
	.in_valid (canonical_valid[3]),
	.out_valid (hash_valid[3])
);

leftmost_bit leftmost_bit_inst22 (
	.clk (clk),
	.in_data (hash_out[3][29:14]),
	.in_valid (hash_valid[3]),
	.leftmost (leftmost_out[3]),
	.leftmost_valid (leftmost_valid[3])
);

delay delay_inst23 (
	.clk (clk),
	.in_data (hash_out[3][13:0]),
	.in_valid (hash_valid[3]),
	.out_data (bucket_idx[3]),
	.out_valid (bucket_valid[3])
);

canonical_kmer canonical_kmer_inst24 (
	.clk (clk),
	.in_data (kmers_out[4]),
	.in_valid (kmers_valid[4]),
	.out_data (canonical_out[4]),
	.out_valid (canonical_valid[4])
);

mmh3_f64 mmh3_f64_inst25 (
	.clk (clk),
	.hash (hash_out[4]),
	.in_data (canonical_out[4]),
	.in_valid (canonical_valid[4]),
	.out_valid (hash_valid[4])
);

leftmost_bit leftmost_bit_inst26 (
	.clk (clk),
	.in_data (hash_out[4][29:14]),
	.in_valid (hash_valid[4]),
	.leftmost (leftmost_out[4]),
	.leftmost_valid (leftmost_valid[4])
);

delay delay_inst27 (
	.clk (clk),
	.in_data (hash_out[4][13:0]),
	.in_valid (hash_valid[4]),
	.out_data (bucket_idx[4]),
	.out_valid (bucket_valid[4])
);

canonical_kmer canonical_kmer_inst28 (
	.clk (clk),
	.in_data (kmers_out[5]),
	.in_valid (kmers_valid[5]),
	.out_data (canonical_out[5]),
	.out_valid (canonical_valid[5])
);

mmh3_f64 mmh3_f64_inst29 (
	.clk (clk),
	.hash (hash_out[5]),
	.in_data (canonical_out[5]),
	.in_valid (canonical_valid[5]),
	.out_valid (hash_valid[5])
);

leftmost_bit leftmost_bit_inst30 (
	.clk (clk),
	.in_data (hash_out[5][29:14]),
	.in_valid (hash_valid[5]),
	.leftmost (leftmost_out[5]),
	.leftmost_valid (leftmost_valid[5])
);

delay delay_inst31 (
	.clk (clk),
	.in_data (hash_out[5][13:0]),
	.in_valid (hash_valid[5]),
	.out_data (bucket_idx[5]),
	.out_valid (bucket_valid[5])
);

canonical_kmer canonical_kmer_inst32 (
	.clk (clk),
	.in_data (kmers_out[6]),
	.in_valid (kmers_valid[6]),
	.out_data (canonical_out[6]),
	.out_valid (canonical_valid[6])
);

mmh3_f64 mmh3_f64_inst33 (
	.clk (clk),
	.hash (hash_out[6]),
	.in_data (canonical_out[6]),
	.in_valid (canonical_valid[6]),
	.out_valid (hash_valid[6])
);

leftmost_bit leftmost_bit_inst34 (
	.clk (clk),
	.in_data (hash_out[6][29:14]),
	.in_valid (hash_valid[6]),
	.leftmost (leftmost_out[6]),
	.leftmost_valid (leftmost_valid[6])
);

delay delay_inst35 (
	.clk (clk),
	.in_data (hash_out[6][13:0]),
	.in_valid (hash_valid[6]),
	.out_data (bucket_idx[6]),
	.out_valid (bucket_valid[6])
);

canonical_kmer canonical_kmer_inst36 (
	.clk (clk),
	.in_data (kmers_out[7]),
	.in_valid (kmers_valid[7]),
	.out_data (canonical_out[7]),
	.out_valid (canonical_valid[7])
);

mmh3_f64 mmh3_f64_inst37 (
	.clk (clk),
	.hash (hash_out[7]),
	.in_data (canonical_out[7]),
	.in_valid (canonical_valid[7]),
	.out_valid (hash_valid[7])
);

leftmost_bit leftmost_bit_inst38 (
	.clk (clk),
	.in_data (hash_out[7][29:14]),
	.in_valid (hash_valid[7]),
	.leftmost (leftmost_out[7]),
	.leftmost_valid (leftmost_valid[7])
);

delay delay_inst39 (
	.clk (clk),
	.in_data (hash_out[7][13:0]),
	.in_valid (hash_valid[7]),
	.out_data (bucket_idx[7]),
	.out_valid (bucket_valid[7])
);

hll_mem hll_mem_inst40 (
	.busy_out (hll_busy_1),
	.clk (clk),
	.data_0 (leftmost_out[0]),
	.data_1 (leftmost_out[1]),
	.data_2 (leftmost_out[2]),
	.data_3 (leftmost_out[3]),
	.data_4 (leftmost_out[4]),
	.data_5 (leftmost_out[5]),
	.data_6 (leftmost_out[6]),
	.data_7 (leftmost_out[7]),
	.idx_0 (bucket_idx[0]),
	.idx_1 (bucket_idx[1]),
	.idx_2 (bucket_idx[2]),
	.idx_3 (bucket_idx[3]),
	.idx_4 (bucket_idx[4]),
	.idx_5 (bucket_idx[5]),
	.idx_6 (bucket_idx[6]),
	.idx_7 (bucket_idx[7]),
	.last (last_input_d[34] & (! hll_select)),
	.out_data (hll_out_1),
	.out_ready (out_ready & (! hll_busy_2)),
	.out_valid (hll_valid_1),
	.valid (hll_valid_in1)
);

hll_mem hll_mem_inst41 (
	.busy_out (hll_busy_2),
	.clk (clk),
	.data_0 (leftmost_out[0]),
	.data_1 (leftmost_out[1]),
	.data_2 (leftmost_out[2]),
	.data_3 (leftmost_out[3]),
	.data_4 (leftmost_out[4]),
	.data_5 (leftmost_out[5]),
	.data_6 (leftmost_out[6]),
	.data_7 (leftmost_out[7]),
	.idx_0 (bucket_idx[0]),
	.idx_1 (bucket_idx[1]),
	.idx_2 (bucket_idx[2]),
	.idx_3 (bucket_idx[3]),
	.idx_4 (bucket_idx[4]),
	.idx_5 (bucket_idx[5]),
	.idx_6 (bucket_idx[6]),
	.idx_7 (bucket_idx[7]),
	.last (last_input_d[34] & hll_select),
	.out_data (hll_out_2),
	.out_ready (out_ready & (! hll_busy_1)),
	.out_valid (hll_valid_2),
	.valid (hll_valid_in2)
);

no_estimator no_estimator_inst42 (
	.clk (clk),
	.data (out_data),
	.out_data (cardinality),
	.out_ready (cardinality_ready),
	.out_valid (cardinality_valid),
	.valid (out_valid)
);

always_comb begin
	busy = (hll_busy_1 & hll_busy_2) | busy_in;
end

always_ff @(posedge clk) begin

	if ((in_data[7:0] == 8'd25) && in_valid) begin
		last_input_i[0] <= 1'd1;
	end
	else begin
		last_input_i[0] <= 1'd0;
	end

	if ((in_data[15:8] == 8'd25) && in_valid) begin
		last_input_i[1] <= 1'd1;
	end
	else begin
		last_input_i[1] <= 1'd0;
	end

	if ((in_data[23:16] == 8'd25) && in_valid) begin
		last_input_i[2] <= 1'd1;
	end
	else begin
		last_input_i[2] <= 1'd0;
	end

	if ((in_data[31:24] == 8'd25) && in_valid) begin
		last_input_i[3] <= 1'd1;
	end
	else begin
		last_input_i[3] <= 1'd0;
	end

	if ((in_data[39:32] == 8'd25) && in_valid) begin
		last_input_i[4] <= 1'd1;
	end
	else begin
		last_input_i[4] <= 1'd0;
	end

	if ((in_data[47:40] == 8'd25) && in_valid) begin
		last_input_i[5] <= 1'd1;
	end
	else begin
		last_input_i[5] <= 1'd0;
	end

	if ((in_data[55:48] == 8'd25) && in_valid) begin
		last_input_i[6] <= 1'd1;
	end
	else begin
		last_input_i[6] <= 1'd0;
	end

	if ((in_data[63:56] == 8'd25) && in_valid) begin
		last_input_i[7] <= 1'd1;
	end
	else begin
		last_input_i[7] <= 1'd0;
	end
end

always_comb begin
	kmers_out[0] = kmer[61:0];
	kmers_valid[0] = in_valid_d[1] & (&kmer_mask[30:0]);
	kmers_out[1] = kmer[63:2];
	kmers_valid[1] = in_valid_d[1] & (&kmer_mask[31:1]);
	kmers_out[2] = kmer[65:4];
	kmers_valid[2] = in_valid_d[1] & (&kmer_mask[32:2]);
	kmers_out[3] = kmer[67:6];
	kmers_valid[3] = in_valid_d[1] & (&kmer_mask[33:3]);
	kmers_out[4] = kmer[69:8];
	kmers_valid[4] = in_valid_d[1] & (&kmer_mask[34:4]);
	kmers_out[5] = kmer[71:10];
	kmers_valid[5] = in_valid_d[1] & (&kmer_mask[35:5]);
	kmers_out[6] = kmer[73:12];
	kmers_valid[6] = in_valid_d[1] & (&kmer_mask[36:6]);
	kmers_out[7] = kmer[75:14];
	kmers_valid[7] = in_valid_d[1] & (&kmer_mask[37:7]);
end

always_ff @(posedge clk) begin
	nl_bin <= |nl;
	basebin_d <= basebin;
	basebin_valid_d <= basebin_valid;

	if (nl[0]) begin
		basebin_nl <= basebin[15:2];
		basebin_valid_nl <= basebin_valid[7:1];
	end
	else if (nl[1]) begin
		basebin_nl <= {basebin[15:4], basebin[1:0]};
		basebin_valid_nl <= {basebin_valid[7:2], basebin_valid[0]};
	end
	else if (nl[2]) begin
		basebin_nl <= {basebin[15:6], basebin[3:0]};
		basebin_valid_nl <= {basebin_valid[7:3], basebin_valid[1:0]};
	end
	else if (nl[3]) begin
		basebin_nl <= {basebin[15:8], basebin[5:0]};
		basebin_valid_nl <= {basebin_valid[7:4], basebin_valid[2:0]};
	end
	else if (nl[4]) begin
		basebin_nl <= {basebin[15:10], basebin[7:0]};
		basebin_valid_nl <= {basebin_valid[7:5], basebin_valid[3:0]};
	end
	else if (nl[5]) begin
		basebin_nl <= {basebin[15:12], basebin[9:0]};
		basebin_valid_nl <= {basebin_valid[7:6], basebin_valid[4:0]};
	end
	else if (nl[6]) begin
		basebin_nl <= {basebin[15:14], basebin[11:0]};
		basebin_valid_nl <= {basebin_valid[7], basebin_valid[5:0]};
	end
	else begin
		basebin_nl <= basebin[13:0];
		basebin_valid_nl <= basebin_valid[6:0];
	end
end

always_ff @(posedge clk) begin
	in_valid_d <= {in_valid_d[0], in_valid};
	last_input_d <= {last_input_d[33:0], last_input & (! last_input_d[0])};

	if (in_valid_d[1] && nl_bin) begin
		kmer <= {kmer[65:0], basebin_nl};
		kmer_mask <= {kmer_mask[32:0], basebin_valid_nl};
	end
	else if (in_valid_d[1]) begin
		kmer <= {kmer[63:0], basebin_d};
		kmer_mask <= {kmer_mask[31:0], basebin_valid_d};
	end
end

always_ff @(posedge clk) begin
	last_input_in <= &last_input_i;

	if (busy_in) begin

		if ((! hll_busy_1) && (! hll_busy_2)) begin
			busy_in <= 1'd0;
			last_input <= 1'd1;
		end
		else begin
			busy_in <= 1'd1;
			last_input <= 1'd0;
		end
	end
	else if (last_input_in) begin

		if (hll_busy_1 || hll_busy_2) begin
			busy_in <= 1'd1;
			last_input <= 1'd0;
		end
		else begin
			busy_in <= 1'd0;
			last_input <= 1'd1;
		end
	end
	else begin
		busy_in <= 1'd0;
		last_input <= 1'd0;
	end

	if (last_input_d[34]) begin
		hll_select <= ! hll_select;
	end
end

always_comb begin

	if (hll_select) begin
		out_data = hll_out_1;
		out_valid = hll_valid_1;
	end
	else begin
		out_data = hll_out_2;
		out_valid = hll_valid_2;
	end

	if (hll_select) begin
		hll_valid_in1 = 8'd0;
		hll_valid_in2 = bucket_valid & leftmost_valid;
	end
	else begin
		hll_valid_in1 = bucket_valid & leftmost_valid;
		hll_valid_in2 = 8'd0;
	end
end

endmodule

