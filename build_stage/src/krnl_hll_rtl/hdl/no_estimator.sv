`timescale 1ns / 1ps

module no_estimator (
	input logic [0:0] clk,
	input logic [511:0] data,
	output logic [47:0] out_data,
	input logic [0:0] out_ready,
	output logic [0:0] out_valid,
	input logic [0:0] valid
);

logic [6:0] cnt_r[6:0];
logic [17:0] sum_tree_0[63:0];
logic [18:0] sum_tree_1[31:0];
logic [19:0] sum_tree_2[15:0];
logic [20:0] sum_tree_3[7:0];
logic [21:0] sum_tree_4[3:0];
logic [22:0] sum_tree_5[1:0];
logic [23:0] sum_tree_6[0:0];
logic [1:0] zero_tree_0[63:0];
logic [2:0] zero_tree_1[31:0];
logic [3:0] zero_tree_2[15:0];
logic [4:0] zero_tree_3[7:0];
logic [5:0] zero_tree_4[3:0];
logic [6:0] zero_tree_5[1:0];
logic [7:0] zero_tree_6[0:0];
logic [0:0] int_out_valid = 1'd0;
logic [6:0] cnt = 7'd0;
logic [0:0] last = 1'd0;
logic [31:0] sum = 32'd0;
logic [15:0] zero_count = 16'd0;
logic [6:0] r_valid = 7'd0;

always_ff @(posedge clk) begin
	r_valid <= {r_valid[5:0], valid};
	cnt_r[0] <= cnt;
	cnt_r[1] <= cnt_r[0];
	cnt_r[2] <= cnt_r[1];
	cnt_r[3] <= cnt_r[2];
	cnt_r[4] <= cnt_r[3];
	cnt_r[5] <= cnt_r[4];
	cnt_r[6] <= cnt_r[5];
	last <= r_valid[6] & (cnt_r[6] == 7'd127);

	if (valid) begin
		cnt <= cnt + 7'd1;
	end

	if (r_valid[6]) begin
		sum <= sum + sum_tree_6[0];
		zero_count <= zero_count + zero_tree_6[0];
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
	sum_tree_0[16] <= (17'd65536 >> data[131:128]) + (17'd65536 >> data[135:132]);
	sum_tree_0[17] <= (17'd65536 >> data[139:136]) + (17'd65536 >> data[143:140]);
	sum_tree_0[18] <= (17'd65536 >> data[147:144]) + (17'd65536 >> data[151:148]);
	sum_tree_0[19] <= (17'd65536 >> data[155:152]) + (17'd65536 >> data[159:156]);
	sum_tree_0[20] <= (17'd65536 >> data[163:160]) + (17'd65536 >> data[167:164]);
	sum_tree_0[21] <= (17'd65536 >> data[171:168]) + (17'd65536 >> data[175:172]);
	sum_tree_0[22] <= (17'd65536 >> data[179:176]) + (17'd65536 >> data[183:180]);
	sum_tree_0[23] <= (17'd65536 >> data[187:184]) + (17'd65536 >> data[191:188]);
	sum_tree_0[24] <= (17'd65536 >> data[195:192]) + (17'd65536 >> data[199:196]);
	sum_tree_0[25] <= (17'd65536 >> data[203:200]) + (17'd65536 >> data[207:204]);
	sum_tree_0[26] <= (17'd65536 >> data[211:208]) + (17'd65536 >> data[215:212]);
	sum_tree_0[27] <= (17'd65536 >> data[219:216]) + (17'd65536 >> data[223:220]);
	sum_tree_0[28] <= (17'd65536 >> data[227:224]) + (17'd65536 >> data[231:228]);
	sum_tree_0[29] <= (17'd65536 >> data[235:232]) + (17'd65536 >> data[239:236]);
	sum_tree_0[30] <= (17'd65536 >> data[243:240]) + (17'd65536 >> data[247:244]);
	sum_tree_0[31] <= (17'd65536 >> data[251:248]) + (17'd65536 >> data[255:252]);
	sum_tree_0[32] <= (17'd65536 >> data[259:256]) + (17'd65536 >> data[263:260]);
	sum_tree_0[33] <= (17'd65536 >> data[267:264]) + (17'd65536 >> data[271:268]);
	sum_tree_0[34] <= (17'd65536 >> data[275:272]) + (17'd65536 >> data[279:276]);
	sum_tree_0[35] <= (17'd65536 >> data[283:280]) + (17'd65536 >> data[287:284]);
	sum_tree_0[36] <= (17'd65536 >> data[291:288]) + (17'd65536 >> data[295:292]);
	sum_tree_0[37] <= (17'd65536 >> data[299:296]) + (17'd65536 >> data[303:300]);
	sum_tree_0[38] <= (17'd65536 >> data[307:304]) + (17'd65536 >> data[311:308]);
	sum_tree_0[39] <= (17'd65536 >> data[315:312]) + (17'd65536 >> data[319:316]);
	sum_tree_0[40] <= (17'd65536 >> data[323:320]) + (17'd65536 >> data[327:324]);
	sum_tree_0[41] <= (17'd65536 >> data[331:328]) + (17'd65536 >> data[335:332]);
	sum_tree_0[42] <= (17'd65536 >> data[339:336]) + (17'd65536 >> data[343:340]);
	sum_tree_0[43] <= (17'd65536 >> data[347:344]) + (17'd65536 >> data[351:348]);
	sum_tree_0[44] <= (17'd65536 >> data[355:352]) + (17'd65536 >> data[359:356]);
	sum_tree_0[45] <= (17'd65536 >> data[363:360]) + (17'd65536 >> data[367:364]);
	sum_tree_0[46] <= (17'd65536 >> data[371:368]) + (17'd65536 >> data[375:372]);
	sum_tree_0[47] <= (17'd65536 >> data[379:376]) + (17'd65536 >> data[383:380]);
	sum_tree_0[48] <= (17'd65536 >> data[387:384]) + (17'd65536 >> data[391:388]);
	sum_tree_0[49] <= (17'd65536 >> data[395:392]) + (17'd65536 >> data[399:396]);
	sum_tree_0[50] <= (17'd65536 >> data[403:400]) + (17'd65536 >> data[407:404]);
	sum_tree_0[51] <= (17'd65536 >> data[411:408]) + (17'd65536 >> data[415:412]);
	sum_tree_0[52] <= (17'd65536 >> data[419:416]) + (17'd65536 >> data[423:420]);
	sum_tree_0[53] <= (17'd65536 >> data[427:424]) + (17'd65536 >> data[431:428]);
	sum_tree_0[54] <= (17'd65536 >> data[435:432]) + (17'd65536 >> data[439:436]);
	sum_tree_0[55] <= (17'd65536 >> data[443:440]) + (17'd65536 >> data[447:444]);
	sum_tree_0[56] <= (17'd65536 >> data[451:448]) + (17'd65536 >> data[455:452]);
	sum_tree_0[57] <= (17'd65536 >> data[459:456]) + (17'd65536 >> data[463:460]);
	sum_tree_0[58] <= (17'd65536 >> data[467:464]) + (17'd65536 >> data[471:468]);
	sum_tree_0[59] <= (17'd65536 >> data[475:472]) + (17'd65536 >> data[479:476]);
	sum_tree_0[60] <= (17'd65536 >> data[483:480]) + (17'd65536 >> data[487:484]);
	sum_tree_0[61] <= (17'd65536 >> data[491:488]) + (17'd65536 >> data[495:492]);
	sum_tree_0[62] <= (17'd65536 >> data[499:496]) + (17'd65536 >> data[503:500]);
	sum_tree_0[63] <= (17'd65536 >> data[507:504]) + (17'd65536 >> data[511:508]);
	sum_tree_1[0] <= sum_tree_0[0] + sum_tree_0[1];
	sum_tree_1[1] <= sum_tree_0[2] + sum_tree_0[3];
	sum_tree_1[2] <= sum_tree_0[4] + sum_tree_0[5];
	sum_tree_1[3] <= sum_tree_0[6] + sum_tree_0[7];
	sum_tree_1[4] <= sum_tree_0[8] + sum_tree_0[9];
	sum_tree_1[5] <= sum_tree_0[10] + sum_tree_0[11];
	sum_tree_1[6] <= sum_tree_0[12] + sum_tree_0[13];
	sum_tree_1[7] <= sum_tree_0[14] + sum_tree_0[15];
	sum_tree_1[8] <= sum_tree_0[16] + sum_tree_0[17];
	sum_tree_1[9] <= sum_tree_0[18] + sum_tree_0[19];
	sum_tree_1[10] <= sum_tree_0[20] + sum_tree_0[21];
	sum_tree_1[11] <= sum_tree_0[22] + sum_tree_0[23];
	sum_tree_1[12] <= sum_tree_0[24] + sum_tree_0[25];
	sum_tree_1[13] <= sum_tree_0[26] + sum_tree_0[27];
	sum_tree_1[14] <= sum_tree_0[28] + sum_tree_0[29];
	sum_tree_1[15] <= sum_tree_0[30] + sum_tree_0[31];
	sum_tree_1[16] <= sum_tree_0[32] + sum_tree_0[33];
	sum_tree_1[17] <= sum_tree_0[34] + sum_tree_0[35];
	sum_tree_1[18] <= sum_tree_0[36] + sum_tree_0[37];
	sum_tree_1[19] <= sum_tree_0[38] + sum_tree_0[39];
	sum_tree_1[20] <= sum_tree_0[40] + sum_tree_0[41];
	sum_tree_1[21] <= sum_tree_0[42] + sum_tree_0[43];
	sum_tree_1[22] <= sum_tree_0[44] + sum_tree_0[45];
	sum_tree_1[23] <= sum_tree_0[46] + sum_tree_0[47];
	sum_tree_1[24] <= sum_tree_0[48] + sum_tree_0[49];
	sum_tree_1[25] <= sum_tree_0[50] + sum_tree_0[51];
	sum_tree_1[26] <= sum_tree_0[52] + sum_tree_0[53];
	sum_tree_1[27] <= sum_tree_0[54] + sum_tree_0[55];
	sum_tree_1[28] <= sum_tree_0[56] + sum_tree_0[57];
	sum_tree_1[29] <= sum_tree_0[58] + sum_tree_0[59];
	sum_tree_1[30] <= sum_tree_0[60] + sum_tree_0[61];
	sum_tree_1[31] <= sum_tree_0[62] + sum_tree_0[63];
	sum_tree_2[0] <= sum_tree_1[0] + sum_tree_1[1];
	sum_tree_2[1] <= sum_tree_1[2] + sum_tree_1[3];
	sum_tree_2[2] <= sum_tree_1[4] + sum_tree_1[5];
	sum_tree_2[3] <= sum_tree_1[6] + sum_tree_1[7];
	sum_tree_2[4] <= sum_tree_1[8] + sum_tree_1[9];
	sum_tree_2[5] <= sum_tree_1[10] + sum_tree_1[11];
	sum_tree_2[6] <= sum_tree_1[12] + sum_tree_1[13];
	sum_tree_2[7] <= sum_tree_1[14] + sum_tree_1[15];
	sum_tree_2[8] <= sum_tree_1[16] + sum_tree_1[17];
	sum_tree_2[9] <= sum_tree_1[18] + sum_tree_1[19];
	sum_tree_2[10] <= sum_tree_1[20] + sum_tree_1[21];
	sum_tree_2[11] <= sum_tree_1[22] + sum_tree_1[23];
	sum_tree_2[12] <= sum_tree_1[24] + sum_tree_1[25];
	sum_tree_2[13] <= sum_tree_1[26] + sum_tree_1[27];
	sum_tree_2[14] <= sum_tree_1[28] + sum_tree_1[29];
	sum_tree_2[15] <= sum_tree_1[30] + sum_tree_1[31];
	sum_tree_3[0] <= sum_tree_2[0] + sum_tree_2[1];
	sum_tree_3[1] <= sum_tree_2[2] + sum_tree_2[3];
	sum_tree_3[2] <= sum_tree_2[4] + sum_tree_2[5];
	sum_tree_3[3] <= sum_tree_2[6] + sum_tree_2[7];
	sum_tree_3[4] <= sum_tree_2[8] + sum_tree_2[9];
	sum_tree_3[5] <= sum_tree_2[10] + sum_tree_2[11];
	sum_tree_3[6] <= sum_tree_2[12] + sum_tree_2[13];
	sum_tree_3[7] <= sum_tree_2[14] + sum_tree_2[15];
	sum_tree_4[0] <= sum_tree_3[0] + sum_tree_3[1];
	sum_tree_4[1] <= sum_tree_3[2] + sum_tree_3[3];
	sum_tree_4[2] <= sum_tree_3[4] + sum_tree_3[5];
	sum_tree_4[3] <= sum_tree_3[6] + sum_tree_3[7];
	sum_tree_5[0] <= sum_tree_4[0] + sum_tree_4[1];
	sum_tree_5[1] <= sum_tree_4[2] + sum_tree_4[3];
	sum_tree_6[0] <= sum_tree_5[0] + sum_tree_5[1];
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
	zero_tree_0[16] <= (data[131:128] == 4'd0) + (data[135:132] == 4'd0);
	zero_tree_0[17] <= (data[139:136] == 4'd0) + (data[143:140] == 4'd0);
	zero_tree_0[18] <= (data[147:144] == 4'd0) + (data[151:148] == 4'd0);
	zero_tree_0[19] <= (data[155:152] == 4'd0) + (data[159:156] == 4'd0);
	zero_tree_0[20] <= (data[163:160] == 4'd0) + (data[167:164] == 4'd0);
	zero_tree_0[21] <= (data[171:168] == 4'd0) + (data[175:172] == 4'd0);
	zero_tree_0[22] <= (data[179:176] == 4'd0) + (data[183:180] == 4'd0);
	zero_tree_0[23] <= (data[187:184] == 4'd0) + (data[191:188] == 4'd0);
	zero_tree_0[24] <= (data[195:192] == 4'd0) + (data[199:196] == 4'd0);
	zero_tree_0[25] <= (data[203:200] == 4'd0) + (data[207:204] == 4'd0);
	zero_tree_0[26] <= (data[211:208] == 4'd0) + (data[215:212] == 4'd0);
	zero_tree_0[27] <= (data[219:216] == 4'd0) + (data[223:220] == 4'd0);
	zero_tree_0[28] <= (data[227:224] == 4'd0) + (data[231:228] == 4'd0);
	zero_tree_0[29] <= (data[235:232] == 4'd0) + (data[239:236] == 4'd0);
	zero_tree_0[30] <= (data[243:240] == 4'd0) + (data[247:244] == 4'd0);
	zero_tree_0[31] <= (data[251:248] == 4'd0) + (data[255:252] == 4'd0);
	zero_tree_0[32] <= (data[259:256] == 4'd0) + (data[263:260] == 4'd0);
	zero_tree_0[33] <= (data[267:264] == 4'd0) + (data[271:268] == 4'd0);
	zero_tree_0[34] <= (data[275:272] == 4'd0) + (data[279:276] == 4'd0);
	zero_tree_0[35] <= (data[283:280] == 4'd0) + (data[287:284] == 4'd0);
	zero_tree_0[36] <= (data[291:288] == 4'd0) + (data[295:292] == 4'd0);
	zero_tree_0[37] <= (data[299:296] == 4'd0) + (data[303:300] == 4'd0);
	zero_tree_0[38] <= (data[307:304] == 4'd0) + (data[311:308] == 4'd0);
	zero_tree_0[39] <= (data[315:312] == 4'd0) + (data[319:316] == 4'd0);
	zero_tree_0[40] <= (data[323:320] == 4'd0) + (data[327:324] == 4'd0);
	zero_tree_0[41] <= (data[331:328] == 4'd0) + (data[335:332] == 4'd0);
	zero_tree_0[42] <= (data[339:336] == 4'd0) + (data[343:340] == 4'd0);
	zero_tree_0[43] <= (data[347:344] == 4'd0) + (data[351:348] == 4'd0);
	zero_tree_0[44] <= (data[355:352] == 4'd0) + (data[359:356] == 4'd0);
	zero_tree_0[45] <= (data[363:360] == 4'd0) + (data[367:364] == 4'd0);
	zero_tree_0[46] <= (data[371:368] == 4'd0) + (data[375:372] == 4'd0);
	zero_tree_0[47] <= (data[379:376] == 4'd0) + (data[383:380] == 4'd0);
	zero_tree_0[48] <= (data[387:384] == 4'd0) + (data[391:388] == 4'd0);
	zero_tree_0[49] <= (data[395:392] == 4'd0) + (data[399:396] == 4'd0);
	zero_tree_0[50] <= (data[403:400] == 4'd0) + (data[407:404] == 4'd0);
	zero_tree_0[51] <= (data[411:408] == 4'd0) + (data[415:412] == 4'd0);
	zero_tree_0[52] <= (data[419:416] == 4'd0) + (data[423:420] == 4'd0);
	zero_tree_0[53] <= (data[427:424] == 4'd0) + (data[431:428] == 4'd0);
	zero_tree_0[54] <= (data[435:432] == 4'd0) + (data[439:436] == 4'd0);
	zero_tree_0[55] <= (data[443:440] == 4'd0) + (data[447:444] == 4'd0);
	zero_tree_0[56] <= (data[451:448] == 4'd0) + (data[455:452] == 4'd0);
	zero_tree_0[57] <= (data[459:456] == 4'd0) + (data[463:460] == 4'd0);
	zero_tree_0[58] <= (data[467:464] == 4'd0) + (data[471:468] == 4'd0);
	zero_tree_0[59] <= (data[475:472] == 4'd0) + (data[479:476] == 4'd0);
	zero_tree_0[60] <= (data[483:480] == 4'd0) + (data[487:484] == 4'd0);
	zero_tree_0[61] <= (data[491:488] == 4'd0) + (data[495:492] == 4'd0);
	zero_tree_0[62] <= (data[499:496] == 4'd0) + (data[503:500] == 4'd0);
	zero_tree_0[63] <= (data[507:504] == 4'd0) + (data[511:508] == 4'd0);
	zero_tree_1[0] <= zero_tree_0[0] + zero_tree_0[1];
	zero_tree_1[1] <= zero_tree_0[2] + zero_tree_0[3];
	zero_tree_1[2] <= zero_tree_0[4] + zero_tree_0[5];
	zero_tree_1[3] <= zero_tree_0[6] + zero_tree_0[7];
	zero_tree_1[4] <= zero_tree_0[8] + zero_tree_0[9];
	zero_tree_1[5] <= zero_tree_0[10] + zero_tree_0[11];
	zero_tree_1[6] <= zero_tree_0[12] + zero_tree_0[13];
	zero_tree_1[7] <= zero_tree_0[14] + zero_tree_0[15];
	zero_tree_1[8] <= zero_tree_0[16] + zero_tree_0[17];
	zero_tree_1[9] <= zero_tree_0[18] + zero_tree_0[19];
	zero_tree_1[10] <= zero_tree_0[20] + zero_tree_0[21];
	zero_tree_1[11] <= zero_tree_0[22] + zero_tree_0[23];
	zero_tree_1[12] <= zero_tree_0[24] + zero_tree_0[25];
	zero_tree_1[13] <= zero_tree_0[26] + zero_tree_0[27];
	zero_tree_1[14] <= zero_tree_0[28] + zero_tree_0[29];
	zero_tree_1[15] <= zero_tree_0[30] + zero_tree_0[31];
	zero_tree_1[16] <= zero_tree_0[32] + zero_tree_0[33];
	zero_tree_1[17] <= zero_tree_0[34] + zero_tree_0[35];
	zero_tree_1[18] <= zero_tree_0[36] + zero_tree_0[37];
	zero_tree_1[19] <= zero_tree_0[38] + zero_tree_0[39];
	zero_tree_1[20] <= zero_tree_0[40] + zero_tree_0[41];
	zero_tree_1[21] <= zero_tree_0[42] + zero_tree_0[43];
	zero_tree_1[22] <= zero_tree_0[44] + zero_tree_0[45];
	zero_tree_1[23] <= zero_tree_0[46] + zero_tree_0[47];
	zero_tree_1[24] <= zero_tree_0[48] + zero_tree_0[49];
	zero_tree_1[25] <= zero_tree_0[50] + zero_tree_0[51];
	zero_tree_1[26] <= zero_tree_0[52] + zero_tree_0[53];
	zero_tree_1[27] <= zero_tree_0[54] + zero_tree_0[55];
	zero_tree_1[28] <= zero_tree_0[56] + zero_tree_0[57];
	zero_tree_1[29] <= zero_tree_0[58] + zero_tree_0[59];
	zero_tree_1[30] <= zero_tree_0[60] + zero_tree_0[61];
	zero_tree_1[31] <= zero_tree_0[62] + zero_tree_0[63];
	zero_tree_2[0] <= zero_tree_1[0] + zero_tree_1[1];
	zero_tree_2[1] <= zero_tree_1[2] + zero_tree_1[3];
	zero_tree_2[2] <= zero_tree_1[4] + zero_tree_1[5];
	zero_tree_2[3] <= zero_tree_1[6] + zero_tree_1[7];
	zero_tree_2[4] <= zero_tree_1[8] + zero_tree_1[9];
	zero_tree_2[5] <= zero_tree_1[10] + zero_tree_1[11];
	zero_tree_2[6] <= zero_tree_1[12] + zero_tree_1[13];
	zero_tree_2[7] <= zero_tree_1[14] + zero_tree_1[15];
	zero_tree_2[8] <= zero_tree_1[16] + zero_tree_1[17];
	zero_tree_2[9] <= zero_tree_1[18] + zero_tree_1[19];
	zero_tree_2[10] <= zero_tree_1[20] + zero_tree_1[21];
	zero_tree_2[11] <= zero_tree_1[22] + zero_tree_1[23];
	zero_tree_2[12] <= zero_tree_1[24] + zero_tree_1[25];
	zero_tree_2[13] <= zero_tree_1[26] + zero_tree_1[27];
	zero_tree_2[14] <= zero_tree_1[28] + zero_tree_1[29];
	zero_tree_2[15] <= zero_tree_1[30] + zero_tree_1[31];
	zero_tree_3[0] <= zero_tree_2[0] + zero_tree_2[1];
	zero_tree_3[1] <= zero_tree_2[2] + zero_tree_2[3];
	zero_tree_3[2] <= zero_tree_2[4] + zero_tree_2[5];
	zero_tree_3[3] <= zero_tree_2[6] + zero_tree_2[7];
	zero_tree_3[4] <= zero_tree_2[8] + zero_tree_2[9];
	zero_tree_3[5] <= zero_tree_2[10] + zero_tree_2[11];
	zero_tree_3[6] <= zero_tree_2[12] + zero_tree_2[13];
	zero_tree_3[7] <= zero_tree_2[14] + zero_tree_2[15];
	zero_tree_4[0] <= zero_tree_3[0] + zero_tree_3[1];
	zero_tree_4[1] <= zero_tree_3[2] + zero_tree_3[3];
	zero_tree_4[2] <= zero_tree_3[4] + zero_tree_3[5];
	zero_tree_4[3] <= zero_tree_3[6] + zero_tree_3[7];
	zero_tree_5[0] <= zero_tree_4[0] + zero_tree_4[1];
	zero_tree_5[1] <= zero_tree_4[2] + zero_tree_4[3];
	zero_tree_6[0] <= zero_tree_5[0] + zero_tree_5[1];
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

