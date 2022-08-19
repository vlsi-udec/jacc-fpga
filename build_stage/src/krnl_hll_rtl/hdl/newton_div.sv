`timescale 1ns / 1ps

module newton_div (
	input logic [0:0] clk,
	input logic [31:0] in_data,
	input logic [0:0] in_valid,
	output logic [0:0] out_valid,
	output logic [47:0] out_value
);

logic [31:0] in_data_[2:0];
logic [0:0] in_valid_[5:0];
logic [5:0] current_it;
logic [4:0] leftmost_out;
logic [0:0] leftmost_valid;
logic [4:0] r_leftmost;
logic [0:0] r_leftmost_valid;
logic [48:0] x0;
logic [48:0] xi;
logic [31:0] b;
logic [48:0] m1;
logic [48:0] m2;

leftmost_bit_0 leftmost_bit_0_inst0 (
	.clk (clk),
	.in_data (in_data),
	.in_valid (in_valid),
	.leftmost (leftmost_out),
	.leftmost_valid (leftmost_valid)
);

always_ff @(posedge clk) begin
	in_data_[0] <= in_data;
	in_valid_[0] <= in_valid;
	in_data_[1] <= in_data_[0];
	in_data_[2] <= in_data_[1];
	in_valid_[1] <= in_valid_[0];
	in_valid_[2] <= in_valid_[1];
	in_valid_[3] <= in_valid_[2];
	in_valid_[4] <= in_valid_[3];
	in_valid_[5] <= in_valid_[4];
	r_leftmost <= 6'd32 - leftmost_out;
	r_leftmost_valid <= leftmost_valid;

	if (in_valid) begin
		b <= in_data;
	end

	if (r_leftmost_valid) begin
		current_it <= 6'd1;
		out_valid <= 1'd0;
	end
	else if (((current_it[5:2] == 4'd12) && current_it[1]) && current_it[0]) begin
		current_it <= 6'd0;
		out_valid <= 1'd1;
	end
	else if (current_it > 6'd0) begin
		current_it <= current_it + 6'd1;
		out_valid <= 1'd0;
	end
	else begin
		out_valid <= 1'd0;
	end
	m1 <= xi[48:18] * x0[48:15];
	m2 <= b * x0[48:15];

	if (r_leftmost_valid) begin
		x0 <= 49'd281474976710656 >> r_leftmost;
	end
	else if (current_it[1] && (! current_it[0])) begin
		xi <= 35'd17179869184 - m2;
	end
	else if ((! current_it[1]) && (! current_it[0])) begin
		x0 <= m1;
	end
	out_value <= x0;
end

endmodule

