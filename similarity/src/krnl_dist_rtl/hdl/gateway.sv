`timescale 1ns / 1ps

module gateway (
	input logic [0:0] aclk,
	input logic [63:0] in_0s_tdata,
	output logic [0:0] in_0s_tready,
	input logic [0:0] in_0s_tvalid,
	input logic [63:0] in_10s_tdata,
	output logic [0:0] in_10s_tready,
	input logic [0:0] in_10s_tvalid,
	input logic [63:0] in_11s_tdata,
	output logic [0:0] in_11s_tready,
	input logic [0:0] in_11s_tvalid,
	input logic [63:0] in_12s_tdata,
	output logic [0:0] in_12s_tready,
	input logic [0:0] in_12s_tvalid,
	input logic [63:0] in_13s_tdata,
	output logic [0:0] in_13s_tready,
	input logic [0:0] in_13s_tvalid,
	input logic [63:0] in_14s_tdata,
	output logic [0:0] in_14s_tready,
	input logic [0:0] in_14s_tvalid,
	input logic [63:0] in_15s_tdata,
	output logic [0:0] in_15s_tready,
	input logic [0:0] in_15s_tvalid,
	input logic [63:0] in_16s_tdata,
	output logic [0:0] in_16s_tready,
	input logic [0:0] in_16s_tvalid,
	input logic [63:0] in_17s_tdata,
	output logic [0:0] in_17s_tready,
	input logic [0:0] in_17s_tvalid,
	input logic [63:0] in_18s_tdata,
	output logic [0:0] in_18s_tready,
	input logic [0:0] in_18s_tvalid,
	input logic [63:0] in_19s_tdata,
	output logic [0:0] in_19s_tready,
	input logic [0:0] in_19s_tvalid,
	input logic [63:0] in_1s_tdata,
	output logic [0:0] in_1s_tready,
	input logic [0:0] in_1s_tvalid,
	input logic [63:0] in_20s_tdata,
	output logic [0:0] in_20s_tready,
	input logic [0:0] in_20s_tvalid,
	input logic [63:0] in_21s_tdata,
	output logic [0:0] in_21s_tready,
	input logic [0:0] in_21s_tvalid,
	input logic [63:0] in_22s_tdata,
	output logic [0:0] in_22s_tready,
	input logic [0:0] in_22s_tvalid,
	input logic [63:0] in_23s_tdata,
	output logic [0:0] in_23s_tready,
	input logic [0:0] in_23s_tvalid,
	input logic [63:0] in_24s_tdata,
	output logic [0:0] in_24s_tready,
	input logic [0:0] in_24s_tvalid,
	input logic [63:0] in_25s_tdata,
	output logic [0:0] in_25s_tready,
	input logic [0:0] in_25s_tvalid,
	input logic [63:0] in_26s_tdata,
	output logic [0:0] in_26s_tready,
	input logic [0:0] in_26s_tvalid,
	input logic [63:0] in_27s_tdata,
	output logic [0:0] in_27s_tready,
	input logic [0:0] in_27s_tvalid,
	input logic [63:0] in_28s_tdata,
	output logic [0:0] in_28s_tready,
	input logic [0:0] in_28s_tvalid,
	input logic [63:0] in_29s_tdata,
	output logic [0:0] in_29s_tready,
	input logic [0:0] in_29s_tvalid,
	input logic [63:0] in_2s_tdata,
	output logic [0:0] in_2s_tready,
	input logic [0:0] in_2s_tvalid,
	input logic [63:0] in_30s_tdata,
	output logic [0:0] in_30s_tready,
	input logic [0:0] in_30s_tvalid,
	input logic [63:0] in_31s_tdata,
	output logic [0:0] in_31s_tready,
	input logic [0:0] in_31s_tvalid,
	input logic [63:0] in_32s_tdata,
	output logic [0:0] in_32s_tready,
	input logic [0:0] in_32s_tvalid,
	input logic [63:0] in_33s_tdata,
	output logic [0:0] in_33s_tready,
	input logic [0:0] in_33s_tvalid,
	input logic [63:0] in_34s_tdata,
	output logic [0:0] in_34s_tready,
	input logic [0:0] in_34s_tvalid,
	input logic [63:0] in_35s_tdata,
	output logic [0:0] in_35s_tready,
	input logic [0:0] in_35s_tvalid,
	input logic [63:0] in_36s_tdata,
	output logic [0:0] in_36s_tready,
	input logic [0:0] in_36s_tvalid,
	input logic [63:0] in_37s_tdata,
	output logic [0:0] in_37s_tready,
	input logic [0:0] in_37s_tvalid,
	input logic [63:0] in_38s_tdata,
	output logic [0:0] in_38s_tready,
	input logic [0:0] in_38s_tvalid,
	input logic [63:0] in_39s_tdata,
	output logic [0:0] in_39s_tready,
	input logic [0:0] in_39s_tvalid,
	input logic [63:0] in_3s_tdata,
	output logic [0:0] in_3s_tready,
	input logic [0:0] in_3s_tvalid,
	input logic [63:0] in_40s_tdata,
	output logic [0:0] in_40s_tready,
	input logic [0:0] in_40s_tvalid,
	input logic [63:0] in_41s_tdata,
	output logic [0:0] in_41s_tready,
	input logic [0:0] in_41s_tvalid,
	input logic [63:0] in_42s_tdata,
	output logic [0:0] in_42s_tready,
	input logic [0:0] in_42s_tvalid,
	input logic [63:0] in_43s_tdata,
	output logic [0:0] in_43s_tready,
	input logic [0:0] in_43s_tvalid,
	input logic [63:0] in_44s_tdata,
	output logic [0:0] in_44s_tready,
	input logic [0:0] in_44s_tvalid,
	input logic [63:0] in_45s_tdata,
	output logic [0:0] in_45s_tready,
	input logic [0:0] in_45s_tvalid,
	input logic [63:0] in_46s_tdata,
	output logic [0:0] in_46s_tready,
	input logic [0:0] in_46s_tvalid,
	input logic [63:0] in_47s_tdata,
	output logic [0:0] in_47s_tready,
	input logic [0:0] in_47s_tvalid,
	input logic [63:0] in_48s_tdata,
	output logic [0:0] in_48s_tready,
	input logic [0:0] in_48s_tvalid,
	input logic [63:0] in_49s_tdata,
	output logic [0:0] in_49s_tready,
	input logic [0:0] in_49s_tvalid,
	input logic [63:0] in_4s_tdata,
	output logic [0:0] in_4s_tready,
	input logic [0:0] in_4s_tvalid,
	input logic [63:0] in_50s_tdata,
	output logic [0:0] in_50s_tready,
	input logic [0:0] in_50s_tvalid,
	input logic [63:0] in_51s_tdata,
	output logic [0:0] in_51s_tready,
	input logic [0:0] in_51s_tvalid,
	input logic [63:0] in_52s_tdata,
	output logic [0:0] in_52s_tready,
	input logic [0:0] in_52s_tvalid,
	input logic [63:0] in_53s_tdata,
	output logic [0:0] in_53s_tready,
	input logic [0:0] in_53s_tvalid,
	input logic [63:0] in_54s_tdata,
	output logic [0:0] in_54s_tready,
	input logic [0:0] in_54s_tvalid,
	input logic [63:0] in_55s_tdata,
	output logic [0:0] in_55s_tready,
	input logic [0:0] in_55s_tvalid,
	input logic [63:0] in_56s_tdata,
	output logic [0:0] in_56s_tready,
	input logic [0:0] in_56s_tvalid,
	input logic [63:0] in_57s_tdata,
	output logic [0:0] in_57s_tready,
	input logic [0:0] in_57s_tvalid,
	input logic [63:0] in_58s_tdata,
	output logic [0:0] in_58s_tready,
	input logic [0:0] in_58s_tvalid,
	input logic [63:0] in_59s_tdata,
	output logic [0:0] in_59s_tready,
	input logic [0:0] in_59s_tvalid,
	input logic [63:0] in_5s_tdata,
	output logic [0:0] in_5s_tready,
	input logic [0:0] in_5s_tvalid,
	input logic [63:0] in_60s_tdata,
	output logic [0:0] in_60s_tready,
	input logic [0:0] in_60s_tvalid,
	input logic [63:0] in_61s_tdata,
	output logic [0:0] in_61s_tready,
	input logic [0:0] in_61s_tvalid,
	input logic [63:0] in_62s_tdata,
	output logic [0:0] in_62s_tready,
	input logic [0:0] in_62s_tvalid,
	input logic [63:0] in_63s_tdata,
	output logic [0:0] in_63s_tready,
	input logic [0:0] in_63s_tvalid,
	input logic [63:0] in_6s_tdata,
	output logic [0:0] in_6s_tready,
	input logic [0:0] in_6s_tvalid,
	input logic [63:0] in_7s_tdata,
	output logic [0:0] in_7s_tready,
	input logic [0:0] in_7s_tvalid,
	input logic [63:0] in_8s_tdata,
	output logic [0:0] in_8s_tready,
	input logic [0:0] in_8s_tvalid,
	input logic [63:0] in_9s_tdata,
	output logic [0:0] in_9s_tready,
	input logic [0:0] in_9s_tvalid,
	output logic [511:0] m_tdata,
	input logic [0:0] m_tready,
	output logic [0:0] m_tvalid
);

logic [511:0] buffer[7:0];
logic [511:0] buffer_d[7:0];
logic [511:0] buffer_d0[7:0];
logic [511:0] buffer_d1[7:0];
logic [511:0] buffer_d2[7:0];
logic [0:0] buffer_valid_p1[7:0];
logic [0:0] buffer_valid_p2[7:0];
logic [0:0] buffer_valid[7:0];
logic [0:0] buffer_valid_d0[7:0];
logic [0:0] buffer_valid_d1[7:0];
logic [0:0] buffer_valid_d2[7:0];
logic [63:0] valid;
logic [63:0] valid_d;
logic [3:0] start_valid;
logic [3:0] read_cnt = 4'd0;
logic [3:0] read_cnt_d = 4'd0;
logic [3:0] read_cnt_d2 = 4'd0;
logic [3:0] read_cnt_d3 = 4'd0;
logic [0:0] read_state = 1'd0;
logic [0:0] internal_valid = 1'd0;
logic [31:0] out_cnt = 32'd0;

initial begin
	buffer_valid[0] = 1'd0;
	buffer_valid_p1[0] = 1'd0;
	buffer_valid_p2[0] = 1'd0;
	buffer_valid[1] = 1'd0;
	buffer_valid_p1[1] = 1'd0;
	buffer_valid_p2[1] = 1'd0;
	buffer_valid[2] = 1'd0;
	buffer_valid_p1[2] = 1'd0;
	buffer_valid_p2[2] = 1'd0;
	buffer_valid[3] = 1'd0;
	buffer_valid_p1[3] = 1'd0;
	buffer_valid_p2[3] = 1'd0;
	buffer_valid[4] = 1'd0;
	buffer_valid_p1[4] = 1'd0;
	buffer_valid_p2[4] = 1'd0;
	buffer_valid[5] = 1'd0;
	buffer_valid_p1[5] = 1'd0;
	buffer_valid_p2[5] = 1'd0;
	buffer_valid[6] = 1'd0;
	buffer_valid_p1[6] = 1'd0;
	buffer_valid_p2[6] = 1'd0;
	buffer_valid[7] = 1'd0;
	buffer_valid_p1[7] = 1'd0;
	buffer_valid_p2[7] = 1'd0;
end

always_comb begin
	valid[0] = in_0s_tvalid & (! valid_d[0]);
	valid[1] = in_1s_tvalid & (! valid_d[1]);
	valid[2] = in_2s_tvalid & (! valid_d[2]);
	valid[3] = in_3s_tvalid & (! valid_d[3]);
	valid[4] = in_4s_tvalid & (! valid_d[4]);
	valid[5] = in_5s_tvalid & (! valid_d[5]);
	valid[6] = in_6s_tvalid & (! valid_d[6]);
	valid[7] = in_7s_tvalid & (! valid_d[7]);
	valid[8] = in_8s_tvalid & (! valid_d[8]);
	valid[9] = in_9s_tvalid & (! valid_d[9]);
	valid[10] = in_10s_tvalid & (! valid_d[10]);
	valid[11] = in_11s_tvalid & (! valid_d[11]);
	valid[12] = in_12s_tvalid & (! valid_d[12]);
	valid[13] = in_13s_tvalid & (! valid_d[13]);
	valid[14] = in_14s_tvalid & (! valid_d[14]);
	valid[15] = in_15s_tvalid & (! valid_d[15]);
	valid[16] = in_16s_tvalid & (! valid_d[16]);
	valid[17] = in_17s_tvalid & (! valid_d[17]);
	valid[18] = in_18s_tvalid & (! valid_d[18]);
	valid[19] = in_19s_tvalid & (! valid_d[19]);
	valid[20] = in_20s_tvalid & (! valid_d[20]);
	valid[21] = in_21s_tvalid & (! valid_d[21]);
	valid[22] = in_22s_tvalid & (! valid_d[22]);
	valid[23] = in_23s_tvalid & (! valid_d[23]);
	valid[24] = in_24s_tvalid & (! valid_d[24]);
	valid[25] = in_25s_tvalid & (! valid_d[25]);
	valid[26] = in_26s_tvalid & (! valid_d[26]);
	valid[27] = in_27s_tvalid & (! valid_d[27]);
	valid[28] = in_28s_tvalid & (! valid_d[28]);
	valid[29] = in_29s_tvalid & (! valid_d[29]);
	valid[30] = in_30s_tvalid & (! valid_d[30]);
	valid[31] = in_31s_tvalid & (! valid_d[31]);
	valid[32] = in_32s_tvalid & (! valid_d[32]);
	valid[33] = in_33s_tvalid & (! valid_d[33]);
	valid[34] = in_34s_tvalid & (! valid_d[34]);
	valid[35] = in_35s_tvalid & (! valid_d[35]);
	valid[36] = in_36s_tvalid & (! valid_d[36]);
	valid[37] = in_37s_tvalid & (! valid_d[37]);
	valid[38] = in_38s_tvalid & (! valid_d[38]);
	valid[39] = in_39s_tvalid & (! valid_d[39]);
	valid[40] = in_40s_tvalid & (! valid_d[40]);
	valid[41] = in_41s_tvalid & (! valid_d[41]);
	valid[42] = in_42s_tvalid & (! valid_d[42]);
	valid[43] = in_43s_tvalid & (! valid_d[43]);
	valid[44] = in_44s_tvalid & (! valid_d[44]);
	valid[45] = in_45s_tvalid & (! valid_d[45]);
	valid[46] = in_46s_tvalid & (! valid_d[46]);
	valid[47] = in_47s_tvalid & (! valid_d[47]);
	valid[48] = in_48s_tvalid & (! valid_d[48]);
	valid[49] = in_49s_tvalid & (! valid_d[49]);
	valid[50] = in_50s_tvalid & (! valid_d[50]);
	valid[51] = in_51s_tvalid & (! valid_d[51]);
	valid[52] = in_52s_tvalid & (! valid_d[52]);
	valid[53] = in_53s_tvalid & (! valid_d[53]);
	valid[54] = in_54s_tvalid & (! valid_d[54]);
	valid[55] = in_55s_tvalid & (! valid_d[55]);
	valid[56] = in_56s_tvalid & (! valid_d[56]);
	valid[57] = in_57s_tvalid & (! valid_d[57]);
	valid[58] = in_58s_tvalid & (! valid_d[58]);
	valid[59] = in_59s_tvalid & (! valid_d[59]);
	valid[60] = in_60s_tvalid & (! valid_d[60]);
	valid[61] = in_61s_tvalid & (! valid_d[61]);
	valid[62] = in_62s_tvalid & (! valid_d[62]);
	valid[63] = in_63s_tvalid & (! valid_d[63]);
end

always_ff @(posedge aclk) begin
	valid_d[0] <= in_0s_tvalid;

	if (valid[0]) begin
		in_0s_tready <= 1'd1;
	end
	valid_d[1] <= in_1s_tvalid;

	if (valid[1]) begin
		in_1s_tready <= 1'd1;
	end
	valid_d[2] <= in_2s_tvalid;

	if (valid[2]) begin
		in_2s_tready <= 1'd1;
	end
	valid_d[3] <= in_3s_tvalid;

	if (valid[3]) begin
		in_3s_tready <= 1'd1;
	end
	valid_d[4] <= in_4s_tvalid;

	if (valid[4]) begin
		in_4s_tready <= 1'd1;
	end
	valid_d[5] <= in_5s_tvalid;

	if (valid[5]) begin
		in_5s_tready <= 1'd1;
	end
	valid_d[6] <= in_6s_tvalid;

	if (valid[6]) begin
		in_6s_tready <= 1'd1;
	end
	valid_d[7] <= in_7s_tvalid;

	if (valid[7]) begin
		in_7s_tready <= 1'd1;
	end
	valid_d[8] <= in_8s_tvalid;

	if (valid[8]) begin
		in_8s_tready <= 1'd1;
	end
	valid_d[9] <= in_9s_tvalid;

	if (valid[9]) begin
		in_9s_tready <= 1'd1;
	end
	valid_d[10] <= in_10s_tvalid;

	if (valid[10]) begin
		in_10s_tready <= 1'd1;
	end
	valid_d[11] <= in_11s_tvalid;

	if (valid[11]) begin
		in_11s_tready <= 1'd1;
	end
	valid_d[12] <= in_12s_tvalid;

	if (valid[12]) begin
		in_12s_tready <= 1'd1;
	end
	valid_d[13] <= in_13s_tvalid;

	if (valid[13]) begin
		in_13s_tready <= 1'd1;
	end
	valid_d[14] <= in_14s_tvalid;

	if (valid[14]) begin
		in_14s_tready <= 1'd1;
	end
	valid_d[15] <= in_15s_tvalid;

	if (valid[15]) begin
		in_15s_tready <= 1'd1;
	end
	valid_d[16] <= in_16s_tvalid;

	if (valid[16]) begin
		in_16s_tready <= 1'd1;
	end
	valid_d[17] <= in_17s_tvalid;

	if (valid[17]) begin
		in_17s_tready <= 1'd1;
	end
	valid_d[18] <= in_18s_tvalid;

	if (valid[18]) begin
		in_18s_tready <= 1'd1;
	end
	valid_d[19] <= in_19s_tvalid;

	if (valid[19]) begin
		in_19s_tready <= 1'd1;
	end
	valid_d[20] <= in_20s_tvalid;

	if (valid[20]) begin
		in_20s_tready <= 1'd1;
	end
	valid_d[21] <= in_21s_tvalid;

	if (valid[21]) begin
		in_21s_tready <= 1'd1;
	end
	valid_d[22] <= in_22s_tvalid;

	if (valid[22]) begin
		in_22s_tready <= 1'd1;
	end
	valid_d[23] <= in_23s_tvalid;

	if (valid[23]) begin
		in_23s_tready <= 1'd1;
	end
	valid_d[24] <= in_24s_tvalid;

	if (valid[24]) begin
		in_24s_tready <= 1'd1;
	end
	valid_d[25] <= in_25s_tvalid;

	if (valid[25]) begin
		in_25s_tready <= 1'd1;
	end
	valid_d[26] <= in_26s_tvalid;

	if (valid[26]) begin
		in_26s_tready <= 1'd1;
	end
	valid_d[27] <= in_27s_tvalid;

	if (valid[27]) begin
		in_27s_tready <= 1'd1;
	end
	valid_d[28] <= in_28s_tvalid;

	if (valid[28]) begin
		in_28s_tready <= 1'd1;
	end
	valid_d[29] <= in_29s_tvalid;

	if (valid[29]) begin
		in_29s_tready <= 1'd1;
	end
	valid_d[30] <= in_30s_tvalid;

	if (valid[30]) begin
		in_30s_tready <= 1'd1;
	end
	valid_d[31] <= in_31s_tvalid;

	if (valid[31]) begin
		in_31s_tready <= 1'd1;
	end
	valid_d[32] <= in_32s_tvalid;

	if (valid[32]) begin
		in_32s_tready <= 1'd1;
	end
	valid_d[33] <= in_33s_tvalid;

	if (valid[33]) begin
		in_33s_tready <= 1'd1;
	end
	valid_d[34] <= in_34s_tvalid;

	if (valid[34]) begin
		in_34s_tready <= 1'd1;
	end
	valid_d[35] <= in_35s_tvalid;

	if (valid[35]) begin
		in_35s_tready <= 1'd1;
	end
	valid_d[36] <= in_36s_tvalid;

	if (valid[36]) begin
		in_36s_tready <= 1'd1;
	end
	valid_d[37] <= in_37s_tvalid;

	if (valid[37]) begin
		in_37s_tready <= 1'd1;
	end
	valid_d[38] <= in_38s_tvalid;

	if (valid[38]) begin
		in_38s_tready <= 1'd1;
	end
	valid_d[39] <= in_39s_tvalid;

	if (valid[39]) begin
		in_39s_tready <= 1'd1;
	end
	valid_d[40] <= in_40s_tvalid;

	if (valid[40]) begin
		in_40s_tready <= 1'd1;
	end
	valid_d[41] <= in_41s_tvalid;

	if (valid[41]) begin
		in_41s_tready <= 1'd1;
	end
	valid_d[42] <= in_42s_tvalid;

	if (valid[42]) begin
		in_42s_tready <= 1'd1;
	end
	valid_d[43] <= in_43s_tvalid;

	if (valid[43]) begin
		in_43s_tready <= 1'd1;
	end
	valid_d[44] <= in_44s_tvalid;

	if (valid[44]) begin
		in_44s_tready <= 1'd1;
	end
	valid_d[45] <= in_45s_tvalid;

	if (valid[45]) begin
		in_45s_tready <= 1'd1;
	end
	valid_d[46] <= in_46s_tvalid;

	if (valid[46]) begin
		in_46s_tready <= 1'd1;
	end
	valid_d[47] <= in_47s_tvalid;

	if (valid[47]) begin
		in_47s_tready <= 1'd1;
	end
	valid_d[48] <= in_48s_tvalid;

	if (valid[48]) begin
		in_48s_tready <= 1'd1;
	end
	valid_d[49] <= in_49s_tvalid;

	if (valid[49]) begin
		in_49s_tready <= 1'd1;
	end
	valid_d[50] <= in_50s_tvalid;

	if (valid[50]) begin
		in_50s_tready <= 1'd1;
	end
	valid_d[51] <= in_51s_tvalid;

	if (valid[51]) begin
		in_51s_tready <= 1'd1;
	end
	valid_d[52] <= in_52s_tvalid;

	if (valid[52]) begin
		in_52s_tready <= 1'd1;
	end
	valid_d[53] <= in_53s_tvalid;

	if (valid[53]) begin
		in_53s_tready <= 1'd1;
	end
	valid_d[54] <= in_54s_tvalid;

	if (valid[54]) begin
		in_54s_tready <= 1'd1;
	end
	valid_d[55] <= in_55s_tvalid;

	if (valid[55]) begin
		in_55s_tready <= 1'd1;
	end
	valid_d[56] <= in_56s_tvalid;

	if (valid[56]) begin
		in_56s_tready <= 1'd1;
	end
	valid_d[57] <= in_57s_tvalid;

	if (valid[57]) begin
		in_57s_tready <= 1'd1;
	end
	valid_d[58] <= in_58s_tvalid;

	if (valid[58]) begin
		in_58s_tready <= 1'd1;
	end
	valid_d[59] <= in_59s_tvalid;

	if (valid[59]) begin
		in_59s_tready <= 1'd1;
	end
	valid_d[60] <= in_60s_tvalid;

	if (valid[60]) begin
		in_60s_tready <= 1'd1;
	end
	valid_d[61] <= in_61s_tvalid;

	if (valid[61]) begin
		in_61s_tready <= 1'd1;
	end
	valid_d[62] <= in_62s_tvalid;

	if (valid[62]) begin
		in_62s_tready <= 1'd1;
	end
	valid_d[63] <= in_63s_tvalid;

	if (valid[63]) begin
		in_63s_tready <= 1'd1;
	end
end

always_ff @(posedge aclk) begin
	start_valid <= {start_valid[2:0], valid[0]};
	read_cnt_d <= read_cnt;
	read_cnt_d2 <= read_cnt_d;
	read_cnt_d3 <= read_cnt_d2;
	buffer_d[0] <= buffer[0];
	buffer_d0[0] <= buffer_d[0];
	buffer_d1[0] <= buffer_d0[0];
	buffer_d2[0] <= buffer_d1[0];
	buffer_d[1] <= buffer[1];
	buffer_d0[1] <= buffer_d[1];
	buffer_d1[1] <= buffer_d0[1];
	buffer_d2[1] <= buffer_d1[1];
	buffer_d[2] <= buffer[2];
	buffer_d0[2] <= buffer_d[2];
	buffer_d1[2] <= buffer_d0[2];
	buffer_d2[2] <= buffer_d1[2];
	buffer_d[3] <= buffer[3];
	buffer_d0[3] <= buffer_d[3];
	buffer_d1[3] <= buffer_d0[3];
	buffer_d2[3] <= buffer_d1[3];
	buffer_d[4] <= buffer[4];
	buffer_d0[4] <= buffer_d[4];
	buffer_d1[4] <= buffer_d0[4];
	buffer_d2[4] <= buffer_d1[4];
	buffer_d[5] <= buffer[5];
	buffer_d0[5] <= buffer_d[5];
	buffer_d1[5] <= buffer_d0[5];
	buffer_d2[5] <= buffer_d1[5];
	buffer_d[6] <= buffer[6];
	buffer_d0[6] <= buffer_d[6];
	buffer_d1[6] <= buffer_d0[6];
	buffer_d2[6] <= buffer_d1[6];
	buffer_d[7] <= buffer[7];
	buffer_d0[7] <= buffer_d[7];
	buffer_d1[7] <= buffer_d0[7];
	buffer_d2[7] <= buffer_d1[7];
	buffer_valid[0] <= buffer_valid_p1[0] | buffer_valid_p2[0];
	buffer_valid_d0[0] <= buffer_valid[0];
	buffer_valid_d1[0] <= buffer_valid_d0[0];
	buffer_valid_d2[0] <= buffer_valid_d1[0];
	buffer_valid[1] <= buffer_valid_p1[1] | buffer_valid_p2[1];
	buffer_valid_d0[1] <= buffer_valid[1];
	buffer_valid_d1[1] <= buffer_valid_d0[1];
	buffer_valid_d2[1] <= buffer_valid_d1[1];
	buffer_valid[2] <= buffer_valid_p1[2] | buffer_valid_p2[2];
	buffer_valid_d0[2] <= buffer_valid[2];
	buffer_valid_d1[2] <= buffer_valid_d0[2];
	buffer_valid_d2[2] <= buffer_valid_d1[2];
	buffer_valid[3] <= buffer_valid_p1[3] | buffer_valid_p2[3];
	buffer_valid_d0[3] <= buffer_valid[3];
	buffer_valid_d1[3] <= buffer_valid_d0[3];
	buffer_valid_d2[3] <= buffer_valid_d1[3];
	buffer_valid[4] <= buffer_valid_p1[4] | buffer_valid_p2[4];
	buffer_valid_d0[4] <= buffer_valid[4];
	buffer_valid_d1[4] <= buffer_valid_d0[4];
	buffer_valid_d2[4] <= buffer_valid_d1[4];
	buffer_valid[5] <= buffer_valid_p1[5] | buffer_valid_p2[5];
	buffer_valid_d0[5] <= buffer_valid[5];
	buffer_valid_d1[5] <= buffer_valid_d0[5];
	buffer_valid_d2[5] <= buffer_valid_d1[5];
	buffer_valid[6] <= buffer_valid_p1[6] | buffer_valid_p2[6];
	buffer_valid_d0[6] <= buffer_valid[6];
	buffer_valid_d1[6] <= buffer_valid_d0[6];
	buffer_valid_d2[6] <= buffer_valid_d1[6];
	buffer_valid[7] <= buffer_valid_p1[7] | buffer_valid_p2[7];
	buffer_valid_d0[7] <= buffer_valid[7];
	buffer_valid_d1[7] <= buffer_valid_d0[7];
	buffer_valid_d2[7] <= buffer_valid_d1[7];

	if (valid[0]) begin
		buffer[0][63:0] <= in_0s_tdata;
	end

	if (valid[1]) begin
		buffer[0][127:64] <= in_1s_tdata;
	end

	if (valid[2]) begin
		buffer[0][191:128] <= in_2s_tdata;
	end

	if (valid[3]) begin
		buffer[0][255:192] <= in_3s_tdata;
	end

	if (valid[4]) begin
		buffer[0][319:256] <= in_4s_tdata;
	end

	if (valid[5]) begin
		buffer[0][383:320] <= in_5s_tdata;
	end

	if (valid[6]) begin
		buffer[0][447:384] <= in_6s_tdata;
	end

	if (valid[7]) begin
		buffer[0][511:448] <= in_7s_tdata;
	end

	if (valid[8]) begin
		buffer[1][63:0] <= in_8s_tdata;
	end

	if (valid[9]) begin
		buffer[1][127:64] <= in_9s_tdata;
	end

	if (valid[10]) begin
		buffer[1][191:128] <= in_10s_tdata;
	end

	if (valid[11]) begin
		buffer[1][255:192] <= in_11s_tdata;
	end

	if (valid[12]) begin
		buffer[1][319:256] <= in_12s_tdata;
	end

	if (valid[13]) begin
		buffer[1][383:320] <= in_13s_tdata;
	end

	if (valid[14]) begin
		buffer[1][447:384] <= in_14s_tdata;
	end

	if (valid[15]) begin
		buffer[1][511:448] <= in_15s_tdata;
	end

	if (valid[16]) begin
		buffer[2][63:0] <= in_16s_tdata;
	end

	if (valid[17]) begin
		buffer[2][127:64] <= in_17s_tdata;
	end

	if (valid[18]) begin
		buffer[2][191:128] <= in_18s_tdata;
	end

	if (valid[19]) begin
		buffer[2][255:192] <= in_19s_tdata;
	end

	if (valid[20]) begin
		buffer[2][319:256] <= in_20s_tdata;
	end

	if (valid[21]) begin
		buffer[2][383:320] <= in_21s_tdata;
	end

	if (valid[22]) begin
		buffer[2][447:384] <= in_22s_tdata;
	end

	if (valid[23]) begin
		buffer[2][511:448] <= in_23s_tdata;
	end

	if (valid[24]) begin
		buffer[3][63:0] <= in_24s_tdata;
	end

	if (valid[25]) begin
		buffer[3][127:64] <= in_25s_tdata;
	end

	if (valid[26]) begin
		buffer[3][191:128] <= in_26s_tdata;
	end

	if (valid[27]) begin
		buffer[3][255:192] <= in_27s_tdata;
	end

	if (valid[28]) begin
		buffer[3][319:256] <= in_28s_tdata;
	end

	if (valid[29]) begin
		buffer[3][383:320] <= in_29s_tdata;
	end

	if (valid[30]) begin
		buffer[3][447:384] <= in_30s_tdata;
	end

	if (valid[31]) begin
		buffer[3][511:448] <= in_31s_tdata;
	end

	if (valid[32]) begin
		buffer[4][63:0] <= in_32s_tdata;
	end

	if (valid[33]) begin
		buffer[4][127:64] <= in_33s_tdata;
	end

	if (valid[34]) begin
		buffer[4][191:128] <= in_34s_tdata;
	end

	if (valid[35]) begin
		buffer[4][255:192] <= in_35s_tdata;
	end

	if (valid[36]) begin
		buffer[4][319:256] <= in_36s_tdata;
	end

	if (valid[37]) begin
		buffer[4][383:320] <= in_37s_tdata;
	end

	if (valid[38]) begin
		buffer[4][447:384] <= in_38s_tdata;
	end

	if (valid[39]) begin
		buffer[4][511:448] <= in_39s_tdata;
	end

	if (valid[40]) begin
		buffer[5][63:0] <= in_40s_tdata;
	end

	if (valid[41]) begin
		buffer[5][127:64] <= in_41s_tdata;
	end

	if (valid[42]) begin
		buffer[5][191:128] <= in_42s_tdata;
	end

	if (valid[43]) begin
		buffer[5][255:192] <= in_43s_tdata;
	end

	if (valid[44]) begin
		buffer[5][319:256] <= in_44s_tdata;
	end

	if (valid[45]) begin
		buffer[5][383:320] <= in_45s_tdata;
	end

	if (valid[46]) begin
		buffer[5][447:384] <= in_46s_tdata;
	end

	if (valid[47]) begin
		buffer[5][511:448] <= in_47s_tdata;
	end

	if (valid[48]) begin
		buffer[6][63:0] <= in_48s_tdata;
	end

	if (valid[49]) begin
		buffer[6][127:64] <= in_49s_tdata;
	end

	if (valid[50]) begin
		buffer[6][191:128] <= in_50s_tdata;
	end

	if (valid[51]) begin
		buffer[6][255:192] <= in_51s_tdata;
	end

	if (valid[52]) begin
		buffer[6][319:256] <= in_52s_tdata;
	end

	if (valid[53]) begin
		buffer[6][383:320] <= in_53s_tdata;
	end

	if (valid[54]) begin
		buffer[6][447:384] <= in_54s_tdata;
	end

	if (valid[55]) begin
		buffer[6][511:448] <= in_55s_tdata;
	end

	if (valid[56]) begin
		buffer[7][63:0] <= in_56s_tdata;
	end

	if (valid[57]) begin
		buffer[7][127:64] <= in_57s_tdata;
	end

	if (valid[58]) begin
		buffer[7][191:128] <= in_58s_tdata;
	end

	if (valid[59]) begin
		buffer[7][255:192] <= in_59s_tdata;
	end

	if (valid[60]) begin
		buffer[7][319:256] <= in_60s_tdata;
	end

	if (valid[61]) begin
		buffer[7][383:320] <= in_61s_tdata;
	end

	if (valid[62]) begin
		buffer[7][447:384] <= in_62s_tdata;
	end

	if (valid[63]) begin
		buffer[7][511:448] <= in_63s_tdata;
	end

	if (((valid[0] | valid[1]) | valid[2]) | valid[3]) begin
		buffer_valid_p1[0] <= 1'd1;
	end
	else if (read_cnt == 4'd0) begin
		buffer_valid_p1[0] <= 1'd0;
	end

	if (((valid[4] | valid[5]) | valid[6]) | valid[7]) begin
		buffer_valid_p2[0] <= 1'd1;
	end
	else if (read_cnt_d3 == 4'd0) begin
		buffer_valid_p2[0] <= 1'd0;
	end

	if (((valid[8] | valid[9]) | valid[10]) | valid[11]) begin
		buffer_valid_p1[1] <= 1'd1;
	end
	else if (read_cnt == 4'd1) begin
		buffer_valid_p1[1] <= 1'd0;
	end

	if (((valid[12] | valid[13]) | valid[14]) | valid[15]) begin
		buffer_valid_p2[1] <= 1'd1;
	end
	else if (read_cnt_d3 == 4'd1) begin
		buffer_valid_p2[1] <= 1'd0;
	end

	if (((valid[16] | valid[17]) | valid[18]) | valid[19]) begin
		buffer_valid_p1[2] <= 1'd1;
	end
	else if (read_cnt == 4'd2) begin
		buffer_valid_p1[2] <= 1'd0;
	end

	if (((valid[20] | valid[21]) | valid[22]) | valid[23]) begin
		buffer_valid_p2[2] <= 1'd1;
	end
	else if (read_cnt_d3 == 4'd2) begin
		buffer_valid_p2[2] <= 1'd0;
	end

	if (((valid[24] | valid[25]) | valid[26]) | valid[27]) begin
		buffer_valid_p1[3] <= 1'd1;
	end
	else if (read_cnt == 4'd3) begin
		buffer_valid_p1[3] <= 1'd0;
	end

	if (((valid[28] | valid[29]) | valid[30]) | valid[31]) begin
		buffer_valid_p2[3] <= 1'd1;
	end
	else if (read_cnt_d3 == 4'd3) begin
		buffer_valid_p2[3] <= 1'd0;
	end

	if (((valid[32] | valid[33]) | valid[34]) | valid[35]) begin
		buffer_valid_p1[4] <= 1'd1;
	end
	else if (read_cnt == 4'd4) begin
		buffer_valid_p1[4] <= 1'd0;
	end

	if (((valid[36] | valid[37]) | valid[38]) | valid[39]) begin
		buffer_valid_p2[4] <= 1'd1;
	end
	else if (read_cnt_d3 == 4'd4) begin
		buffer_valid_p2[4] <= 1'd0;
	end

	if (((valid[40] | valid[41]) | valid[42]) | valid[43]) begin
		buffer_valid_p1[5] <= 1'd1;
	end
	else if (read_cnt == 4'd5) begin
		buffer_valid_p1[5] <= 1'd0;
	end

	if (((valid[44] | valid[45]) | valid[46]) | valid[47]) begin
		buffer_valid_p2[5] <= 1'd1;
	end
	else if (read_cnt_d3 == 4'd5) begin
		buffer_valid_p2[5] <= 1'd0;
	end

	if (((valid[48] | valid[49]) | valid[50]) | valid[51]) begin
		buffer_valid_p1[6] <= 1'd1;
	end
	else if (read_cnt == 4'd6) begin
		buffer_valid_p1[6] <= 1'd0;
	end

	if (((valid[52] | valid[53]) | valid[54]) | valid[55]) begin
		buffer_valid_p2[6] <= 1'd1;
	end
	else if (read_cnt_d3 == 4'd6) begin
		buffer_valid_p2[6] <= 1'd0;
	end

	if (((valid[56] | valid[57]) | valid[58]) | valid[59]) begin
		buffer_valid_p1[7] <= 1'd1;
	end
	else if (read_cnt == 4'd7) begin
		buffer_valid_p1[7] <= 1'd0;
	end

	if (((valid[60] | valid[61]) | valid[62]) | valid[63]) begin
		buffer_valid_p2[7] <= 1'd1;
	end
	else if (read_cnt_d3 == 4'd7) begin
		buffer_valid_p2[7] <= 1'd0;
	end
end

always_ff @(posedge aclk) begin
	m_tdata <= buffer_d2[read_cnt];

	if (((read_cnt == 4'd7) && m_tready) && internal_valid) begin
		read_state <= 1'd0;
	end
	else if (start_valid[3]) begin
		read_state <= 1'd1;
	end

	if (read_state) begin

		if (m_tready && internal_valid) begin
			m_tvalid <= 1'd0;
			internal_valid <= 1'd0;

			if (read_cnt == 4'd7) begin
				read_cnt <= 4'd0;
			end
			else begin
				read_cnt <= read_cnt + 4'd1;
			end
		end
		else begin
			m_tvalid <= buffer_valid_d2[read_cnt];
			internal_valid <= 1'd1;
		end
	end
	else begin
		read_cnt <= 4'd0;
		m_tvalid <= 1'd0;
	end
end

always_ff @(posedge aclk) begin

	if (m_tvalid) begin
		out_cnt <= out_cnt + 32'd1;
	end
end

endmodule

