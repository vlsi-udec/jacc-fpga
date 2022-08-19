`timescale 1ns / 1ps

module leftmost_bit (
	input logic [0:0] clk,
	input logic [15:0] in_data,
	input logic [0:0] in_valid,
	output logic [3:0] leftmost,
	output logic [0:0] leftmost_valid
);

logic [15:0] in_data_[4:0];
logic [0:0] in_valid_[6:0];
logic [2:0] leftmost_bin[2:0];
logic [2:0] leftmost_bin_d[2:0];
logic [3:0] leftmost_p[2:0];
logic [17:0] leftmost_oh[5:0];
logic [16:0] leftmost_oh_or;

always_ff @(posedge clk) begin
	in_data_[0] <= in_data;
	in_data_[1] <= in_data_[0];
	in_data_[2] <= in_data_[1];
	in_data_[3] <= in_data_[2];
	in_data_[4] <= in_data_[3];
	in_valid_[0] <= in_valid;
	in_valid_[1] <= in_valid_[0];
	in_valid_[2] <= in_valid_[1];
	in_valid_[3] <= in_valid_[2];
	in_valid_[4] <= in_valid_[3];
	in_valid_[5] <= in_valid_[4];
	in_valid_[6] <= in_valid_[5];
	leftmost_valid <= in_valid_[6];
	leftmost_oh[0][0] <= 1'd0;
	leftmost_oh_or[0] <= 1'd0;
	leftmost_oh[1][1] <= 1'd0;
	leftmost_oh_or[1] <= 1'd0;
	leftmost_oh[1][0] <= 1'd0;
	leftmost_oh[2][0] <= leftmost_oh[1][0];
	leftmost_oh[2][1] <= leftmost_oh[1][1];
	leftmost_oh[2][2] <= in_data_[1][15] & (! leftmost_oh_or[1]);
	leftmost_oh_or[2] <= in_data_[1][15] | leftmost_oh_or[1];
	leftmost_oh[3][0] <= leftmost_oh[2][0];
	leftmost_oh[3][1] <= leftmost_oh[2][1];
	leftmost_oh[3][2] <= leftmost_oh[2][2];
	leftmost_oh[3][3] <= in_data_[2][14] & (! leftmost_oh_or[2]);
	leftmost_oh_or[3] <= in_data_[2][14] | leftmost_oh_or[2];
	leftmost_oh[4][0] <= leftmost_oh[3][0];
	leftmost_oh[4][1] <= leftmost_oh[3][1];
	leftmost_oh[4][2] <= leftmost_oh[3][2];
	leftmost_oh[4][3] <= leftmost_oh[3][3];
	leftmost_oh[4][4] <= in_data_[3][13] & (! leftmost_oh_or[3]);
	leftmost_oh_or[4] <= in_data_[3][13] | leftmost_oh_or[3];
	leftmost_oh[5][0] <= leftmost_oh[4][0];
	leftmost_oh[5][1] <= leftmost_oh[4][1];
	leftmost_oh[5][2] <= leftmost_oh[4][2];
	leftmost_oh[5][3] <= leftmost_oh[4][3];
	leftmost_oh[5][4] <= leftmost_oh[4][4];
	leftmost_oh[5][5] <= in_data_[4][12] & (! leftmost_oh_or[4]);

	if (leftmost_oh[5][5]) begin
		leftmost_bin[0] <= 3'd6;
	end
	else if (leftmost_oh[5][4]) begin
		leftmost_bin[0] <= 3'd5;
	end
	else if (leftmost_oh[5][3]) begin
		leftmost_bin[0] <= 3'd4;
	end
	else if (leftmost_oh[5][2]) begin
		leftmost_bin[0] <= 3'd3;
	end
	else if (leftmost_oh[5][1]) begin
		leftmost_bin[0] <= 3'd2;
	end
	else if (leftmost_oh[5][0]) begin
		leftmost_bin[0] <= 3'd1;
	end
	else begin
		leftmost_bin[0] <= 3'd0;
	end
	leftmost_oh[0][6] <= in_data[11];
	leftmost_oh_or[6] <= in_data[11];
	leftmost_oh[1][6] <= leftmost_oh[0][6];
	leftmost_oh[1][7] <= in_data_[0][10] & (! leftmost_oh_or[6]);
	leftmost_oh_or[7] <= in_data_[0][10] | leftmost_oh_or[6];
	leftmost_oh[2][6] <= leftmost_oh[1][6];
	leftmost_oh[2][7] <= leftmost_oh[1][7];
	leftmost_oh[2][8] <= in_data_[1][9] & (! leftmost_oh_or[7]);
	leftmost_oh_or[8] <= in_data_[1][9] | leftmost_oh_or[7];
	leftmost_oh[3][6] <= leftmost_oh[2][6];
	leftmost_oh[3][7] <= leftmost_oh[2][7];
	leftmost_oh[3][8] <= leftmost_oh[2][8];
	leftmost_oh[3][9] <= in_data_[2][8] & (! leftmost_oh_or[8]);
	leftmost_oh_or[9] <= in_data_[2][8] | leftmost_oh_or[8];
	leftmost_oh[4][6] <= leftmost_oh[3][6];
	leftmost_oh[4][7] <= leftmost_oh[3][7];
	leftmost_oh[4][8] <= leftmost_oh[3][8];
	leftmost_oh[4][9] <= leftmost_oh[3][9];
	leftmost_oh[4][10] <= in_data_[3][7] & (! leftmost_oh_or[9]);
	leftmost_oh_or[10] <= in_data_[3][7] | leftmost_oh_or[9];
	leftmost_oh[5][6] <= leftmost_oh[4][6];
	leftmost_oh[5][7] <= leftmost_oh[4][7];
	leftmost_oh[5][8] <= leftmost_oh[4][8];
	leftmost_oh[5][9] <= leftmost_oh[4][9];
	leftmost_oh[5][10] <= leftmost_oh[4][10];
	leftmost_oh[5][11] <= in_data_[4][6] & (! leftmost_oh_or[10]);

	if (leftmost_oh[5][11]) begin
		leftmost_bin[1] <= 3'd6;
	end
	else if (leftmost_oh[5][10]) begin
		leftmost_bin[1] <= 3'd5;
	end
	else if (leftmost_oh[5][9]) begin
		leftmost_bin[1] <= 3'd4;
	end
	else if (leftmost_oh[5][8]) begin
		leftmost_bin[1] <= 3'd3;
	end
	else if (leftmost_oh[5][7]) begin
		leftmost_bin[1] <= 3'd2;
	end
	else if (leftmost_oh[5][6]) begin
		leftmost_bin[1] <= 3'd1;
	end
	else begin
		leftmost_bin[1] <= 3'd0;
	end
	leftmost_oh[0][12] <= in_data[5];
	leftmost_oh_or[12] <= in_data[5];
	leftmost_oh[1][12] <= leftmost_oh[0][12];
	leftmost_oh[1][13] <= in_data_[0][4] & (! leftmost_oh_or[12]);
	leftmost_oh_or[13] <= in_data_[0][4] | leftmost_oh_or[12];
	leftmost_oh[2][12] <= leftmost_oh[1][12];
	leftmost_oh[2][13] <= leftmost_oh[1][13];
	leftmost_oh[2][14] <= in_data_[1][3] & (! leftmost_oh_or[13]);
	leftmost_oh_or[14] <= in_data_[1][3] | leftmost_oh_or[13];
	leftmost_oh[3][12] <= leftmost_oh[2][12];
	leftmost_oh[3][13] <= leftmost_oh[2][13];
	leftmost_oh[3][14] <= leftmost_oh[2][14];
	leftmost_oh[3][15] <= in_data_[2][2] & (! leftmost_oh_or[14]);
	leftmost_oh_or[15] <= in_data_[2][2] | leftmost_oh_or[14];
	leftmost_oh[4][12] <= leftmost_oh[3][12];
	leftmost_oh[4][13] <= leftmost_oh[3][13];
	leftmost_oh[4][14] <= leftmost_oh[3][14];
	leftmost_oh[4][15] <= leftmost_oh[3][15];
	leftmost_oh[4][16] <= in_data_[3][1] & (! leftmost_oh_or[15]);
	leftmost_oh_or[16] <= in_data_[3][1] | leftmost_oh_or[15];
	leftmost_oh[5][12] <= leftmost_oh[4][12];
	leftmost_oh[5][13] <= leftmost_oh[4][13];
	leftmost_oh[5][14] <= leftmost_oh[4][14];
	leftmost_oh[5][15] <= leftmost_oh[4][15];
	leftmost_oh[5][16] <= leftmost_oh[4][16];
	leftmost_oh[5][17] <= in_data_[4][0] & (! leftmost_oh_or[16]);

	if (leftmost_oh[5][17]) begin
		leftmost_bin[2] <= 3'd6;
	end
	else if (leftmost_oh[5][16]) begin
		leftmost_bin[2] <= 3'd5;
	end
	else if (leftmost_oh[5][15]) begin
		leftmost_bin[2] <= 3'd4;
	end
	else if (leftmost_oh[5][14]) begin
		leftmost_bin[2] <= 3'd3;
	end
	else if (leftmost_oh[5][13]) begin
		leftmost_bin[2] <= 3'd2;
	end
	else if (leftmost_oh[5][12]) begin
		leftmost_bin[2] <= 3'd1;
	end
	else begin
		leftmost_bin[2] <= 3'd0;
	end
	leftmost_bin_d[0] <= leftmost_bin[0];
	leftmost_bin_d[1] <= leftmost_bin[1];
	leftmost_bin_d[2] <= leftmost_bin[2];
	leftmost_p[0] <= leftmost_bin[0] - 4'd2;
	leftmost_p[1] <= leftmost_bin[1] + 4'd4;
	leftmost_p[2] <= leftmost_bin[2] + 4'd10;

	if (leftmost_bin_d[0] != 3'd0) begin
		leftmost <= leftmost_p[0];
	end
	else if (leftmost_bin_d[1] != 3'd0) begin
		leftmost <= leftmost_p[1];
	end
	else if (leftmost_bin_d[2] != 3'd0) begin
		leftmost <= leftmost_p[2];
	end
	else begin
		leftmost <= 4'd0;
	end
end

endmodule

