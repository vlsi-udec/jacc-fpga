`timescale 1ns / 1ps

module leftmost_bit_0 (
	input logic [0:0] clk,
	input logic [31:0] in_data,
	input logic [0:0] in_valid,
	output logic [4:0] leftmost,
	output logic [0:0] leftmost_valid
);

logic [31:0] in_data_[4:0];
logic [0:0] in_valid_[6:0];
logic [5:0] leftmost_bin[5:0];
logic [35:0] leftmost_oh[5:0];
logic [34:0] leftmost_oh_or;

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
	leftmost_oh[2][2] <= 1'd0;
	leftmost_oh_or[2] <= 1'd0;
	leftmost_oh[2][0] <= 1'd0;
	leftmost_oh[2][1] <= 1'd0;
	leftmost_oh[3][3] <= 1'd0;
	leftmost_oh_or[3] <= 1'd0;
	leftmost_oh[3][0] <= 1'd0;
	leftmost_oh[3][1] <= 1'd0;
	leftmost_oh[3][2] <= 1'd0;
	leftmost_oh[4][0] <= leftmost_oh[3][0];
	leftmost_oh[4][1] <= leftmost_oh[3][1];
	leftmost_oh[4][2] <= leftmost_oh[3][2];
	leftmost_oh[4][3] <= leftmost_oh[3][3];
	leftmost_oh[4][4] <= in_data_[3][31] & (! leftmost_oh_or[3]);
	leftmost_oh_or[4] <= in_data_[3][31] | leftmost_oh_or[3];
	leftmost_oh[5][0] <= leftmost_oh[4][0];
	leftmost_oh[5][1] <= leftmost_oh[4][1];
	leftmost_oh[5][2] <= leftmost_oh[4][2];
	leftmost_oh[5][3] <= leftmost_oh[4][3];
	leftmost_oh[5][4] <= leftmost_oh[4][4];
	leftmost_oh[5][5] <= in_data_[4][30] & (! leftmost_oh_or[4]);

	if (leftmost_oh[5][5]) begin
		leftmost_bin[0] <= 6'd6;
	end
	else if (leftmost_oh[5][4]) begin
		leftmost_bin[0] <= 6'd5;
	end
	else if (leftmost_oh[5][3]) begin
		leftmost_bin[0] <= 6'd4;
	end
	else if (leftmost_oh[5][2]) begin
		leftmost_bin[0] <= 6'd3;
	end
	else if (leftmost_oh[5][1]) begin
		leftmost_bin[0] <= 6'd2;
	end
	else if (leftmost_oh[5][0]) begin
		leftmost_bin[0] <= 6'd1;
	end
	else begin
		leftmost_bin[0] <= 6'd0;
	end
	leftmost_oh[0][6] <= in_data[29];
	leftmost_oh_or[6] <= in_data[29];
	leftmost_oh[1][6] <= leftmost_oh[0][6];
	leftmost_oh[1][7] <= in_data_[0][28] & (! leftmost_oh_or[6]);
	leftmost_oh_or[7] <= in_data_[0][28] | leftmost_oh_or[6];
	leftmost_oh[2][6] <= leftmost_oh[1][6];
	leftmost_oh[2][7] <= leftmost_oh[1][7];
	leftmost_oh[2][8] <= in_data_[1][27] & (! leftmost_oh_or[7]);
	leftmost_oh_or[8] <= in_data_[1][27] | leftmost_oh_or[7];
	leftmost_oh[3][6] <= leftmost_oh[2][6];
	leftmost_oh[3][7] <= leftmost_oh[2][7];
	leftmost_oh[3][8] <= leftmost_oh[2][8];
	leftmost_oh[3][9] <= in_data_[2][26] & (! leftmost_oh_or[8]);
	leftmost_oh_or[9] <= in_data_[2][26] | leftmost_oh_or[8];
	leftmost_oh[4][6] <= leftmost_oh[3][6];
	leftmost_oh[4][7] <= leftmost_oh[3][7];
	leftmost_oh[4][8] <= leftmost_oh[3][8];
	leftmost_oh[4][9] <= leftmost_oh[3][9];
	leftmost_oh[4][10] <= in_data_[3][25] & (! leftmost_oh_or[9]);
	leftmost_oh_or[10] <= in_data_[3][25] | leftmost_oh_or[9];
	leftmost_oh[5][6] <= leftmost_oh[4][6];
	leftmost_oh[5][7] <= leftmost_oh[4][7];
	leftmost_oh[5][8] <= leftmost_oh[4][8];
	leftmost_oh[5][9] <= leftmost_oh[4][9];
	leftmost_oh[5][10] <= leftmost_oh[4][10];
	leftmost_oh[5][11] <= in_data_[4][24] & (! leftmost_oh_or[10]);

	if (leftmost_oh[5][11]) begin
		leftmost_bin[1] <= 6'd6;
	end
	else if (leftmost_oh[5][10]) begin
		leftmost_bin[1] <= 6'd5;
	end
	else if (leftmost_oh[5][9]) begin
		leftmost_bin[1] <= 6'd4;
	end
	else if (leftmost_oh[5][8]) begin
		leftmost_bin[1] <= 6'd3;
	end
	else if (leftmost_oh[5][7]) begin
		leftmost_bin[1] <= 6'd2;
	end
	else if (leftmost_oh[5][6]) begin
		leftmost_bin[1] <= 6'd1;
	end
	else begin
		leftmost_bin[1] <= 6'd0;
	end
	leftmost_oh[0][12] <= in_data[23];
	leftmost_oh_or[12] <= in_data[23];
	leftmost_oh[1][12] <= leftmost_oh[0][12];
	leftmost_oh[1][13] <= in_data_[0][22] & (! leftmost_oh_or[12]);
	leftmost_oh_or[13] <= in_data_[0][22] | leftmost_oh_or[12];
	leftmost_oh[2][12] <= leftmost_oh[1][12];
	leftmost_oh[2][13] <= leftmost_oh[1][13];
	leftmost_oh[2][14] <= in_data_[1][21] & (! leftmost_oh_or[13]);
	leftmost_oh_or[14] <= in_data_[1][21] | leftmost_oh_or[13];
	leftmost_oh[3][12] <= leftmost_oh[2][12];
	leftmost_oh[3][13] <= leftmost_oh[2][13];
	leftmost_oh[3][14] <= leftmost_oh[2][14];
	leftmost_oh[3][15] <= in_data_[2][20] & (! leftmost_oh_or[14]);
	leftmost_oh_or[15] <= in_data_[2][20] | leftmost_oh_or[14];
	leftmost_oh[4][12] <= leftmost_oh[3][12];
	leftmost_oh[4][13] <= leftmost_oh[3][13];
	leftmost_oh[4][14] <= leftmost_oh[3][14];
	leftmost_oh[4][15] <= leftmost_oh[3][15];
	leftmost_oh[4][16] <= in_data_[3][19] & (! leftmost_oh_or[15]);
	leftmost_oh_or[16] <= in_data_[3][19] | leftmost_oh_or[15];
	leftmost_oh[5][12] <= leftmost_oh[4][12];
	leftmost_oh[5][13] <= leftmost_oh[4][13];
	leftmost_oh[5][14] <= leftmost_oh[4][14];
	leftmost_oh[5][15] <= leftmost_oh[4][15];
	leftmost_oh[5][16] <= leftmost_oh[4][16];
	leftmost_oh[5][17] <= in_data_[4][18] & (! leftmost_oh_or[16]);

	if (leftmost_oh[5][17]) begin
		leftmost_bin[2] <= 6'd6;
	end
	else if (leftmost_oh[5][16]) begin
		leftmost_bin[2] <= 6'd5;
	end
	else if (leftmost_oh[5][15]) begin
		leftmost_bin[2] <= 6'd4;
	end
	else if (leftmost_oh[5][14]) begin
		leftmost_bin[2] <= 6'd3;
	end
	else if (leftmost_oh[5][13]) begin
		leftmost_bin[2] <= 6'd2;
	end
	else if (leftmost_oh[5][12]) begin
		leftmost_bin[2] <= 6'd1;
	end
	else begin
		leftmost_bin[2] <= 6'd0;
	end
	leftmost_oh[0][18] <= in_data[17];
	leftmost_oh_or[18] <= in_data[17];
	leftmost_oh[1][18] <= leftmost_oh[0][18];
	leftmost_oh[1][19] <= in_data_[0][16] & (! leftmost_oh_or[18]);
	leftmost_oh_or[19] <= in_data_[0][16] | leftmost_oh_or[18];
	leftmost_oh[2][18] <= leftmost_oh[1][18];
	leftmost_oh[2][19] <= leftmost_oh[1][19];
	leftmost_oh[2][20] <= in_data_[1][15] & (! leftmost_oh_or[19]);
	leftmost_oh_or[20] <= in_data_[1][15] | leftmost_oh_or[19];
	leftmost_oh[3][18] <= leftmost_oh[2][18];
	leftmost_oh[3][19] <= leftmost_oh[2][19];
	leftmost_oh[3][20] <= leftmost_oh[2][20];
	leftmost_oh[3][21] <= in_data_[2][14] & (! leftmost_oh_or[20]);
	leftmost_oh_or[21] <= in_data_[2][14] | leftmost_oh_or[20];
	leftmost_oh[4][18] <= leftmost_oh[3][18];
	leftmost_oh[4][19] <= leftmost_oh[3][19];
	leftmost_oh[4][20] <= leftmost_oh[3][20];
	leftmost_oh[4][21] <= leftmost_oh[3][21];
	leftmost_oh[4][22] <= in_data_[3][13] & (! leftmost_oh_or[21]);
	leftmost_oh_or[22] <= in_data_[3][13] | leftmost_oh_or[21];
	leftmost_oh[5][18] <= leftmost_oh[4][18];
	leftmost_oh[5][19] <= leftmost_oh[4][19];
	leftmost_oh[5][20] <= leftmost_oh[4][20];
	leftmost_oh[5][21] <= leftmost_oh[4][21];
	leftmost_oh[5][22] <= leftmost_oh[4][22];
	leftmost_oh[5][23] <= in_data_[4][12] & (! leftmost_oh_or[22]);

	if (leftmost_oh[5][23]) begin
		leftmost_bin[3] <= 6'd6;
	end
	else if (leftmost_oh[5][22]) begin
		leftmost_bin[3] <= 6'd5;
	end
	else if (leftmost_oh[5][21]) begin
		leftmost_bin[3] <= 6'd4;
	end
	else if (leftmost_oh[5][20]) begin
		leftmost_bin[3] <= 6'd3;
	end
	else if (leftmost_oh[5][19]) begin
		leftmost_bin[3] <= 6'd2;
	end
	else if (leftmost_oh[5][18]) begin
		leftmost_bin[3] <= 6'd1;
	end
	else begin
		leftmost_bin[3] <= 6'd0;
	end
	leftmost_oh[0][24] <= in_data[11];
	leftmost_oh_or[24] <= in_data[11];
	leftmost_oh[1][24] <= leftmost_oh[0][24];
	leftmost_oh[1][25] <= in_data_[0][10] & (! leftmost_oh_or[24]);
	leftmost_oh_or[25] <= in_data_[0][10] | leftmost_oh_or[24];
	leftmost_oh[2][24] <= leftmost_oh[1][24];
	leftmost_oh[2][25] <= leftmost_oh[1][25];
	leftmost_oh[2][26] <= in_data_[1][9] & (! leftmost_oh_or[25]);
	leftmost_oh_or[26] <= in_data_[1][9] | leftmost_oh_or[25];
	leftmost_oh[3][24] <= leftmost_oh[2][24];
	leftmost_oh[3][25] <= leftmost_oh[2][25];
	leftmost_oh[3][26] <= leftmost_oh[2][26];
	leftmost_oh[3][27] <= in_data_[2][8] & (! leftmost_oh_or[26]);
	leftmost_oh_or[27] <= in_data_[2][8] | leftmost_oh_or[26];
	leftmost_oh[4][24] <= leftmost_oh[3][24];
	leftmost_oh[4][25] <= leftmost_oh[3][25];
	leftmost_oh[4][26] <= leftmost_oh[3][26];
	leftmost_oh[4][27] <= leftmost_oh[3][27];
	leftmost_oh[4][28] <= in_data_[3][7] & (! leftmost_oh_or[27]);
	leftmost_oh_or[28] <= in_data_[3][7] | leftmost_oh_or[27];
	leftmost_oh[5][24] <= leftmost_oh[4][24];
	leftmost_oh[5][25] <= leftmost_oh[4][25];
	leftmost_oh[5][26] <= leftmost_oh[4][26];
	leftmost_oh[5][27] <= leftmost_oh[4][27];
	leftmost_oh[5][28] <= leftmost_oh[4][28];
	leftmost_oh[5][29] <= in_data_[4][6] & (! leftmost_oh_or[28]);

	if (leftmost_oh[5][29]) begin
		leftmost_bin[4] <= 6'd6;
	end
	else if (leftmost_oh[5][28]) begin
		leftmost_bin[4] <= 6'd5;
	end
	else if (leftmost_oh[5][27]) begin
		leftmost_bin[4] <= 6'd4;
	end
	else if (leftmost_oh[5][26]) begin
		leftmost_bin[4] <= 6'd3;
	end
	else if (leftmost_oh[5][25]) begin
		leftmost_bin[4] <= 6'd2;
	end
	else if (leftmost_oh[5][24]) begin
		leftmost_bin[4] <= 6'd1;
	end
	else begin
		leftmost_bin[4] <= 6'd0;
	end
	leftmost_oh[0][30] <= in_data[5];
	leftmost_oh_or[30] <= in_data[5];
	leftmost_oh[1][30] <= leftmost_oh[0][30];
	leftmost_oh[1][31] <= in_data_[0][4] & (! leftmost_oh_or[30]);
	leftmost_oh_or[31] <= in_data_[0][4] | leftmost_oh_or[30];
	leftmost_oh[2][30] <= leftmost_oh[1][30];
	leftmost_oh[2][31] <= leftmost_oh[1][31];
	leftmost_oh[2][32] <= in_data_[1][3] & (! leftmost_oh_or[31]);
	leftmost_oh_or[32] <= in_data_[1][3] | leftmost_oh_or[31];
	leftmost_oh[3][30] <= leftmost_oh[2][30];
	leftmost_oh[3][31] <= leftmost_oh[2][31];
	leftmost_oh[3][32] <= leftmost_oh[2][32];
	leftmost_oh[3][33] <= in_data_[2][2] & (! leftmost_oh_or[32]);
	leftmost_oh_or[33] <= in_data_[2][2] | leftmost_oh_or[32];
	leftmost_oh[4][30] <= leftmost_oh[3][30];
	leftmost_oh[4][31] <= leftmost_oh[3][31];
	leftmost_oh[4][32] <= leftmost_oh[3][32];
	leftmost_oh[4][33] <= leftmost_oh[3][33];
	leftmost_oh[4][34] <= in_data_[3][1] & (! leftmost_oh_or[33]);
	leftmost_oh_or[34] <= in_data_[3][1] | leftmost_oh_or[33];
	leftmost_oh[5][30] <= leftmost_oh[4][30];
	leftmost_oh[5][31] <= leftmost_oh[4][31];
	leftmost_oh[5][32] <= leftmost_oh[4][32];
	leftmost_oh[5][33] <= leftmost_oh[4][33];
	leftmost_oh[5][34] <= leftmost_oh[4][34];
	leftmost_oh[5][35] <= in_data_[4][0] & (! leftmost_oh_or[34]);

	if (leftmost_oh[5][35]) begin
		leftmost_bin[5] <= 6'd6;
	end
	else if (leftmost_oh[5][34]) begin
		leftmost_bin[5] <= 6'd5;
	end
	else if (leftmost_oh[5][33]) begin
		leftmost_bin[5] <= 6'd4;
	end
	else if (leftmost_oh[5][32]) begin
		leftmost_bin[5] <= 6'd3;
	end
	else if (leftmost_oh[5][31]) begin
		leftmost_bin[5] <= 6'd2;
	end
	else if (leftmost_oh[5][30]) begin
		leftmost_bin[5] <= 6'd1;
	end
	else begin
		leftmost_bin[5] <= 6'd0;
	end

	if (leftmost_bin[0] != 6'd0) begin
		leftmost <= leftmost_bin[0] - 5'd4;
	end
	else if (leftmost_bin[1] != 6'd0) begin
		leftmost <= leftmost_bin[1] + 5'd2;
	end
	else if (leftmost_bin[2] != 6'd0) begin
		leftmost <= leftmost_bin[2] + 5'd8;
	end
	else if (leftmost_bin[3] != 6'd0) begin
		leftmost <= leftmost_bin[3] + 5'd14;
	end
	else if (leftmost_bin[4] != 6'd0) begin
		leftmost <= leftmost_bin[4] + 5'd20;
	end
	else if (leftmost_bin[5] != 6'd0) begin
		leftmost <= leftmost_bin[5] + 5'd26;
	end
	else begin
		leftmost <= 5'd0;
	end
end

endmodule

