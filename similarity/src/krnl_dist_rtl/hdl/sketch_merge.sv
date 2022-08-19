`timescale 1ns / 1ps

module sketch_merge (
	input logic [127:0] a1,
	input logic [127:0] a2,
	input logic [0:0] aclk,
	input logic [0:0] areset,
	output logic [47:0] m_tdata,
	input logic [0:0] m_tready,
	output logic [0:0] m_tvalid,
	input logic [0:0] valid
);

logic [127:0] data_a1_d[10:0];
logic [127:0] data_a2_d[10:0];
logic [127:0] data_a1_d2[7:0];
logic [127:0] data_a2_d2[7:0];
logic [0:0] data_valid_d[10:0];
logic [0:0] data_valid_d2[7:0];
logic [31:0] data_cmp[7:0];
logic [127:0] merge_data;
logic [0:0] merge_valid = 1'd0;
logic [127:0] merge_data_d;
logic [0:0] merge_valid_d = 1'd0;
logic [127:0] merge_data_d2;
logic [0:0] merge_valid_d2 = 1'd0;
logic [127:0] data_a1;
logic [127:0] data_a2;
logic [0:0] data_valid = 1'd0;

no_estimator_0 no_estimator_0_inst0 (
	.clk (aclk),
	.data (merge_data_d2),
	.out_data (m_tdata),
	.out_ready (m_tready),
	.out_valid (m_tvalid),
	.valid (merge_valid_d2)
);

always_ff @(posedge aclk) begin
	data_a1 <= a1;
	data_a2 <= a2;
	data_valid <= valid;
	data_a1_d[0] <= data_a1;
	data_a2_d[0] <= data_a2;
	data_valid_d[0] <= data_valid;
	data_a1_d2[0] <= data_a1_d[10];
	data_a2_d2[0] <= data_a2_d[10];
	data_valid_d2[0] <= data_valid_d[10];
	merge_valid <= data_valid_d2[7];
	merge_valid_d <= merge_valid;
	merge_data_d <= merge_data;
	merge_valid_d2 <= merge_valid_d;
	merge_data_d2 <= merge_data_d;
	data_a1_d[1] <= data_a1_d[0];
	data_a2_d[1] <= data_a2_d[0];
	data_valid_d[1] <= data_valid_d[0];
	data_a1_d[2] <= data_a1_d[1];
	data_a2_d[2] <= data_a2_d[1];
	data_valid_d[2] <= data_valid_d[1];
	data_a1_d[3] <= data_a1_d[2];
	data_a2_d[3] <= data_a2_d[2];
	data_valid_d[3] <= data_valid_d[2];
	data_a1_d[4] <= data_a1_d[3];
	data_a2_d[4] <= data_a2_d[3];
	data_valid_d[4] <= data_valid_d[3];
	data_a1_d[5] <= data_a1_d[4];
	data_a2_d[5] <= data_a2_d[4];
	data_valid_d[5] <= data_valid_d[4];
	data_a1_d[6] <= data_a1_d[5];
	data_a2_d[6] <= data_a2_d[5];
	data_valid_d[6] <= data_valid_d[5];
	data_a1_d[7] <= data_a1_d[6];
	data_a2_d[7] <= data_a2_d[6];
	data_valid_d[7] <= data_valid_d[6];
	data_a1_d[8] <= data_a1_d[7];
	data_a2_d[8] <= data_a2_d[7];
	data_valid_d[8] <= data_valid_d[7];
	data_a1_d[9] <= data_a1_d[8];
	data_a2_d[9] <= data_a2_d[8];
	data_valid_d[9] <= data_valid_d[8];
	data_a1_d[10] <= data_a1_d[9];
	data_a2_d[10] <= data_a2_d[9];
	data_valid_d[10] <= data_valid_d[9];
	data_a1_d2[1] <= data_a1_d2[0];
	data_a2_d2[1] <= data_a2_d2[0];
	data_valid_d2[1] <= data_valid_d2[0];
	data_a1_d2[2] <= data_a1_d2[1];
	data_a2_d2[2] <= data_a2_d2[1];
	data_valid_d2[2] <= data_valid_d2[1];
	data_a1_d2[3] <= data_a1_d2[2];
	data_a2_d2[3] <= data_a2_d2[2];
	data_valid_d2[3] <= data_valid_d2[2];
	data_a1_d2[4] <= data_a1_d2[3];
	data_a2_d2[4] <= data_a2_d2[3];
	data_valid_d2[4] <= data_valid_d2[3];
	data_a1_d2[5] <= data_a1_d2[4];
	data_a2_d2[5] <= data_a2_d2[4];
	data_valid_d2[5] <= data_valid_d2[4];
	data_a1_d2[6] <= data_a1_d2[5];
	data_a2_d2[6] <= data_a2_d2[5];
	data_valid_d2[6] <= data_valid_d2[5];
	data_a1_d2[7] <= data_a1_d2[6];
	data_a2_d2[7] <= data_a2_d2[6];
	data_valid_d2[7] <= data_valid_d2[6];
	data_cmp[1] <= data_cmp[0];
	data_cmp[2] <= data_cmp[1];
	data_cmp[3] <= data_cmp[2];
	data_cmp[4] <= data_cmp[3];
	data_cmp[5] <= data_cmp[4];
	data_cmp[6] <= data_cmp[5];
	data_cmp[7] <= data_cmp[6];
	data_cmp[0][0] <= data_a1_d[10][3:0] > data_a2_d[10][3:0];

	if (data_cmp[7][0]) begin
		merge_data[3:0] <= data_a1_d2[7][3:0];
	end
	else begin
		merge_data[3:0] <= data_a2_d2[7][3:0];
	end
	data_cmp[0][1] <= data_a1_d[10][7:4] > data_a2_d[10][7:4];

	if (data_cmp[7][1]) begin
		merge_data[7:4] <= data_a1_d2[7][7:4];
	end
	else begin
		merge_data[7:4] <= data_a2_d2[7][7:4];
	end
	data_cmp[0][2] <= data_a1_d[10][11:8] > data_a2_d[10][11:8];

	if (data_cmp[7][2]) begin
		merge_data[11:8] <= data_a1_d2[7][11:8];
	end
	else begin
		merge_data[11:8] <= data_a2_d2[7][11:8];
	end
	data_cmp[0][3] <= data_a1_d[10][15:12] > data_a2_d[10][15:12];

	if (data_cmp[7][3]) begin
		merge_data[15:12] <= data_a1_d2[7][15:12];
	end
	else begin
		merge_data[15:12] <= data_a2_d2[7][15:12];
	end
	data_cmp[0][4] <= data_a1_d[10][19:16] > data_a2_d[10][19:16];

	if (data_cmp[7][4]) begin
		merge_data[19:16] <= data_a1_d2[7][19:16];
	end
	else begin
		merge_data[19:16] <= data_a2_d2[7][19:16];
	end
	data_cmp[0][5] <= data_a1_d[10][23:20] > data_a2_d[10][23:20];

	if (data_cmp[7][5]) begin
		merge_data[23:20] <= data_a1_d2[7][23:20];
	end
	else begin
		merge_data[23:20] <= data_a2_d2[7][23:20];
	end
	data_cmp[0][6] <= data_a1_d[10][27:24] > data_a2_d[10][27:24];

	if (data_cmp[7][6]) begin
		merge_data[27:24] <= data_a1_d2[7][27:24];
	end
	else begin
		merge_data[27:24] <= data_a2_d2[7][27:24];
	end
	data_cmp[0][7] <= data_a1_d[10][31:28] > data_a2_d[10][31:28];

	if (data_cmp[7][7]) begin
		merge_data[31:28] <= data_a1_d2[7][31:28];
	end
	else begin
		merge_data[31:28] <= data_a2_d2[7][31:28];
	end
	data_cmp[0][8] <= data_a1_d[10][35:32] > data_a2_d[10][35:32];

	if (data_cmp[7][8]) begin
		merge_data[35:32] <= data_a1_d2[7][35:32];
	end
	else begin
		merge_data[35:32] <= data_a2_d2[7][35:32];
	end
	data_cmp[0][9] <= data_a1_d[10][39:36] > data_a2_d[10][39:36];

	if (data_cmp[7][9]) begin
		merge_data[39:36] <= data_a1_d2[7][39:36];
	end
	else begin
		merge_data[39:36] <= data_a2_d2[7][39:36];
	end
	data_cmp[0][10] <= data_a1_d[10][43:40] > data_a2_d[10][43:40];

	if (data_cmp[7][10]) begin
		merge_data[43:40] <= data_a1_d2[7][43:40];
	end
	else begin
		merge_data[43:40] <= data_a2_d2[7][43:40];
	end
	data_cmp[0][11] <= data_a1_d[10][47:44] > data_a2_d[10][47:44];

	if (data_cmp[7][11]) begin
		merge_data[47:44] <= data_a1_d2[7][47:44];
	end
	else begin
		merge_data[47:44] <= data_a2_d2[7][47:44];
	end
	data_cmp[0][12] <= data_a1_d[10][51:48] > data_a2_d[10][51:48];

	if (data_cmp[7][12]) begin
		merge_data[51:48] <= data_a1_d2[7][51:48];
	end
	else begin
		merge_data[51:48] <= data_a2_d2[7][51:48];
	end
	data_cmp[0][13] <= data_a1_d[10][55:52] > data_a2_d[10][55:52];

	if (data_cmp[7][13]) begin
		merge_data[55:52] <= data_a1_d2[7][55:52];
	end
	else begin
		merge_data[55:52] <= data_a2_d2[7][55:52];
	end
	data_cmp[0][14] <= data_a1_d[10][59:56] > data_a2_d[10][59:56];

	if (data_cmp[7][14]) begin
		merge_data[59:56] <= data_a1_d2[7][59:56];
	end
	else begin
		merge_data[59:56] <= data_a2_d2[7][59:56];
	end
	data_cmp[0][15] <= data_a1_d[10][63:60] > data_a2_d[10][63:60];

	if (data_cmp[7][15]) begin
		merge_data[63:60] <= data_a1_d2[7][63:60];
	end
	else begin
		merge_data[63:60] <= data_a2_d2[7][63:60];
	end
	data_cmp[0][16] <= data_a1_d[10][67:64] > data_a2_d[10][67:64];

	if (data_cmp[7][16]) begin
		merge_data[67:64] <= data_a1_d2[7][67:64];
	end
	else begin
		merge_data[67:64] <= data_a2_d2[7][67:64];
	end
	data_cmp[0][17] <= data_a1_d[10][71:68] > data_a2_d[10][71:68];

	if (data_cmp[7][17]) begin
		merge_data[71:68] <= data_a1_d2[7][71:68];
	end
	else begin
		merge_data[71:68] <= data_a2_d2[7][71:68];
	end
	data_cmp[0][18] <= data_a1_d[10][75:72] > data_a2_d[10][75:72];

	if (data_cmp[7][18]) begin
		merge_data[75:72] <= data_a1_d2[7][75:72];
	end
	else begin
		merge_data[75:72] <= data_a2_d2[7][75:72];
	end
	data_cmp[0][19] <= data_a1_d[10][79:76] > data_a2_d[10][79:76];

	if (data_cmp[7][19]) begin
		merge_data[79:76] <= data_a1_d2[7][79:76];
	end
	else begin
		merge_data[79:76] <= data_a2_d2[7][79:76];
	end
	data_cmp[0][20] <= data_a1_d[10][83:80] > data_a2_d[10][83:80];

	if (data_cmp[7][20]) begin
		merge_data[83:80] <= data_a1_d2[7][83:80];
	end
	else begin
		merge_data[83:80] <= data_a2_d2[7][83:80];
	end
	data_cmp[0][21] <= data_a1_d[10][87:84] > data_a2_d[10][87:84];

	if (data_cmp[7][21]) begin
		merge_data[87:84] <= data_a1_d2[7][87:84];
	end
	else begin
		merge_data[87:84] <= data_a2_d2[7][87:84];
	end
	data_cmp[0][22] <= data_a1_d[10][91:88] > data_a2_d[10][91:88];

	if (data_cmp[7][22]) begin
		merge_data[91:88] <= data_a1_d2[7][91:88];
	end
	else begin
		merge_data[91:88] <= data_a2_d2[7][91:88];
	end
	data_cmp[0][23] <= data_a1_d[10][95:92] > data_a2_d[10][95:92];

	if (data_cmp[7][23]) begin
		merge_data[95:92] <= data_a1_d2[7][95:92];
	end
	else begin
		merge_data[95:92] <= data_a2_d2[7][95:92];
	end
	data_cmp[0][24] <= data_a1_d[10][99:96] > data_a2_d[10][99:96];

	if (data_cmp[7][24]) begin
		merge_data[99:96] <= data_a1_d2[7][99:96];
	end
	else begin
		merge_data[99:96] <= data_a2_d2[7][99:96];
	end
	data_cmp[0][25] <= data_a1_d[10][103:100] > data_a2_d[10][103:100];

	if (data_cmp[7][25]) begin
		merge_data[103:100] <= data_a1_d2[7][103:100];
	end
	else begin
		merge_data[103:100] <= data_a2_d2[7][103:100];
	end
	data_cmp[0][26] <= data_a1_d[10][107:104] > data_a2_d[10][107:104];

	if (data_cmp[7][26]) begin
		merge_data[107:104] <= data_a1_d2[7][107:104];
	end
	else begin
		merge_data[107:104] <= data_a2_d2[7][107:104];
	end
	data_cmp[0][27] <= data_a1_d[10][111:108] > data_a2_d[10][111:108];

	if (data_cmp[7][27]) begin
		merge_data[111:108] <= data_a1_d2[7][111:108];
	end
	else begin
		merge_data[111:108] <= data_a2_d2[7][111:108];
	end
	data_cmp[0][28] <= data_a1_d[10][115:112] > data_a2_d[10][115:112];

	if (data_cmp[7][28]) begin
		merge_data[115:112] <= data_a1_d2[7][115:112];
	end
	else begin
		merge_data[115:112] <= data_a2_d2[7][115:112];
	end
	data_cmp[0][29] <= data_a1_d[10][119:116] > data_a2_d[10][119:116];

	if (data_cmp[7][29]) begin
		merge_data[119:116] <= data_a1_d2[7][119:116];
	end
	else begin
		merge_data[119:116] <= data_a2_d2[7][119:116];
	end
	data_cmp[0][30] <= data_a1_d[10][123:120] > data_a2_d[10][123:120];

	if (data_cmp[7][30]) begin
		merge_data[123:120] <= data_a1_d2[7][123:120];
	end
	else begin
		merge_data[123:120] <= data_a2_d2[7][123:120];
	end
	data_cmp[0][31] <= data_a1_d[10][127:124] > data_a2_d[10][127:124];

	if (data_cmp[7][31]) begin
		merge_data[127:124] <= data_a1_d2[7][127:124];
	end
	else begin
		merge_data[127:124] <= data_a2_d2[7][127:124];
	end
end

endmodule

