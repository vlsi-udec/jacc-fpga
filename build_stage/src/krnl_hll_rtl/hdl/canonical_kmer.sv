`timescale 1ns / 1ps

module canonical_kmer (
	input logic [0:0] clk,
	input logic [61:0] in_data,
	input logic [0:0] in_valid,
	output logic [61:0] out_data,
	output logic [0:0] out_valid
);

logic [61:0] kmer[6:0];
logic [63:0] kmer_r[6:0];
logic [6:0] in_valid_r = 7'd0;

always_ff @(posedge clk) begin
	in_valid_r <= {in_valid_r[5:0], in_valid};
	kmer[0] <= in_data;
	kmer[1] <= kmer[0];
	kmer[2] <= kmer[1];
	kmer[3] <= kmer[2];
	kmer[4] <= kmer[3];
	kmer[5] <= kmer[4];
	kmer[6] <= kmer[5];
	kmer_r[0] <= ((in_data >> 2'd2) & 64'd3689348814741910323) | ((in_data << 2'd2) & 64'd14757395258967641292);
	kmer_r[1] <= ((kmer_r[0] >> 3'd4) & 64'd1085102592571150095) | ((kmer_r[0] << 3'd4) & 64'd17361641481138401520);
	kmer_r[2] <= ((kmer_r[1] >> 4'd8) & 64'd71777214294589695) | ((kmer_r[1] << 4'd8) & 64'd18374966859414961920);
	kmer_r[3] <= ((kmer_r[2] >> 5'd16) & 64'd281470681808895) | ((kmer_r[2] << 5'd16) & 64'd18446462603027742720);
	kmer_r[4] <= (kmer_r[3] >> 6'd32) | (kmer_r[3] << 6'd32);
	kmer_r[5] <= ~kmer_r[4];
	kmer_r[6] <= kmer_r[5] >> 2'd2;
	out_valid <= in_valid_r[6];

	if (kmer[6] < kmer_r[6]) begin
		out_data <= kmer[6];
	end
	else begin
		out_data <= kmer_r[6];
	end
end

endmodule

