`timescale 1ns / 1ps

module no_estimator_0 (
	input logic [0:0] clk,
	input logic [127:0] data,
	output logic [47:0] out_data,
	input logic [0:0] out_ready,
	output logic [0:0] out_valid,
	input logic [0:0] valid
);

logic [8:0] cnt_r[4:0];
logic [17:0] sum_tree_0[15:0];
logic [18:0] sum_tree_1[7:0];
logic [19:0] sum_tree_2[3:0];
logic [20:0] sum_tree_3[1:0];
logic [21:0] sum_tree_4[0:0];
logic [1:0] zero_tree_0[15:0];
logic [2:0] zero_tree_1[7:0];
logic [3:0] zero_tree_2[3:0];
logic [4:0] zero_tree_3[1:0];
logic [5:0] zero_tree_4[0:0];
logic [0:0] int_out_valid = 1'd0;
logic [8:0] cnt = 9'd0;
logic [0:0] last = 1'd0;
logic [31:0] sum = 32'd0;
logic [15:0] zero_count = 16'd0;
logic [4:0] r_valid = 5'd0;

always_ff @(posedge clk) begin
	r_valid <= {r_valid[3:0], valid};
	cnt_r[0] <= cnt;
	cnt_r[1] <= cnt_r[0];
	cnt_r[2] <= cnt_r[1];
	cnt_r[3] <= cnt_r[2];
	cnt_r[4] <= cnt_r[3];
	last <= r_valid[4] & (cnt_r[4] == 9'd511);

	if (valid) begin
		cnt <= cnt + 9'd1;
	end

	if (r_valid[4]) begin
		sum <= sum + sum_tree_4[0];
		zero_count <= zero_count + zero_tree_4[0];
	end
	else if (last) begin
		sum <= 32'd0;
		zero_count <= 16'd0;
	end
	sum_tree_0[0] <= (17'd65536 >> data[3:0]) + (17'd65536 >> data[7:4]);
	sum_tree_0[1] <= (17'd65536 >> data[11:8]) + (17'd65536 >> data[15:12]);
	sum_tree_0[2] <= (17'd65536 >> data[19:16]) + (17'd65536 >> data[23:20]);
	sum_tree_0[3] <= (17'd65536 >> data[27:24]) + (17'd65536 >> data[31:28]);
	sum_tree_0[4] <= (17'd65536 >> data[35:32]) + (17'd65536 >> data[39:36]);
	sum_tree_0[5] <= (17'd65536 >> data[43:40]) + (17'd65536 >> data[47:44]);
	sum_tree_0[6] <= (17'd65536 >> data[51:48]) + (17'd65536 >> data[55:52]);
	sum_tree_0[7] <= (17'd65536 >> data[59:56]) + (17'd65536 >> data[63:60]);
	sum_tree_0[8] <= (17'd65536 >> data[67:64]) + (17'd65536 >> data[71:68]);
	sum_tree_0[9] <= (17'd65536 >> data[75:72]) + (17'd65536 >> data[79:76]);
	sum_tree_0[10] <= (17'd65536 >> data[83:80]) + (17'd65536 >> data[87:84]);
	sum_tree_0[11] <= (17'd65536 >> data[91:88]) + (17'd65536 >> data[95:92]);
	sum_tree_0[12] <= (17'd65536 >> data[99:96]) + (17'd65536 >> data[103:100]);
	sum_tree_0[13] <= (17'd65536 >> data[107:104]) + (17'd65536 >> data[111:108]);
	sum_tree_0[14] <= (17'd65536 >> data[115:112]) + (17'd65536 >> data[119:116]);
	sum_tree_0[15] <= (17'd65536 >> data[123:120]) + (17'd65536 >> data[127:124]);
	sum_tree_1[0] <= sum_tree_0[0] + sum_tree_0[1];
	sum_tree_1[1] <= sum_tree_0[2] + sum_tree_0[3];
	sum_tree_1[2] <= sum_tree_0[4] + sum_tree_0[5];
	sum_tree_1[3] <= sum_tree_0[6] + sum_tree_0[7];
	sum_tree_1[4] <= sum_tree_0[8] + sum_tree_0[9];
	sum_tree_1[5] <= sum_tree_0[10] + sum_tree_0[11];
	sum_tree_1[6] <= sum_tree_0[12] + sum_tree_0[13];
	sum_tree_1[7] <= sum_tree_0[14] + sum_tree_0[15];
	sum_tree_2[0] <= sum_tree_1[0] + sum_tree_1[1];
	sum_tree_2[1] <= sum_tree_1[2] + sum_tree_1[3];
	sum_tree_2[2] <= sum_tree_1[4] + sum_tree_1[5];
	sum_tree_2[3] <= sum_tree_1[6] + sum_tree_1[7];
	sum_tree_3[0] <= sum_tree_2[0] + sum_tree_2[1];
	sum_tree_3[1] <= sum_tree_2[2] + sum_tree_2[3];
	sum_tree_4[0] <= sum_tree_3[0] + sum_tree_3[1];
	zero_tree_0[0] <= (data[3:0] == 4'd0) + (data[7:4] == 4'd0);
	zero_tree_0[1] <= (data[11:8] == 4'd0) + (data[15:12] == 4'd0);
	zero_tree_0[2] <= (data[19:16] == 4'd0) + (data[23:20] == 4'd0);
	zero_tree_0[3] <= (data[27:24] == 4'd0) + (data[31:28] == 4'd0);
	zero_tree_0[4] <= (data[35:32] == 4'd0) + (data[39:36] == 4'd0);
	zero_tree_0[5] <= (data[43:40] == 4'd0) + (data[47:44] == 4'd0);
	zero_tree_0[6] <= (data[51:48] == 4'd0) + (data[55:52] == 4'd0);
	zero_tree_0[7] <= (data[59:56] == 4'd0) + (data[63:60] == 4'd0);
	zero_tree_0[8] <= (data[67:64] == 4'd0) + (data[71:68] == 4'd0);
	zero_tree_0[9] <= (data[75:72] == 4'd0) + (data[79:76] == 4'd0);
	zero_tree_0[10] <= (data[83:80] == 4'd0) + (data[87:84] == 4'd0);
	zero_tree_0[11] <= (data[91:88] == 4'd0) + (data[95:92] == 4'd0);
	zero_tree_0[12] <= (data[99:96] == 4'd0) + (data[103:100] == 4'd0);
	zero_tree_0[13] <= (data[107:104] == 4'd0) + (data[111:108] == 4'd0);
	zero_tree_0[14] <= (data[115:112] == 4'd0) + (data[119:116] == 4'd0);
	zero_tree_0[15] <= (data[123:120] == 4'd0) + (data[127:124] == 4'd0);
	zero_tree_1[0] <= zero_tree_0[0] + zero_tree_0[1];
	zero_tree_1[1] <= zero_tree_0[2] + zero_tree_0[3];
	zero_tree_1[2] <= zero_tree_0[4] + zero_tree_0[5];
	zero_tree_1[3] <= zero_tree_0[6] + zero_tree_0[7];
	zero_tree_1[4] <= zero_tree_0[8] + zero_tree_0[9];
	zero_tree_1[5] <= zero_tree_0[10] + zero_tree_0[11];
	zero_tree_1[6] <= zero_tree_0[12] + zero_tree_0[13];
	zero_tree_1[7] <= zero_tree_0[14] + zero_tree_0[15];
	zero_tree_2[0] <= zero_tree_1[0] + zero_tree_1[1];
	zero_tree_2[1] <= zero_tree_1[2] + zero_tree_1[3];
	zero_tree_2[2] <= zero_tree_1[4] + zero_tree_1[5];
	zero_tree_2[3] <= zero_tree_1[6] + zero_tree_1[7];
	zero_tree_3[0] <= zero_tree_2[0] + zero_tree_2[1];
	zero_tree_3[1] <= zero_tree_2[2] + zero_tree_2[3];
	zero_tree_4[0] <= zero_tree_3[0] + zero_tree_3[1];
end

always_comb begin
	out_valid = int_out_valid;
end

always_ff @(posedge clk) begin

	if (last) begin
		int_out_valid <= 1'd1;
		out_data <= {sum, zero_count};
	end
	else if (out_ready) begin
		int_out_valid <= 1'd0;
		out_data <= out_data;
	end
	else begin
		int_out_valid <= int_out_valid;
		out_data <= out_data;
	end
end

endmodule

