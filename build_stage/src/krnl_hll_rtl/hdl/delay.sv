`timescale 1ns / 1ps

module delay (
	input logic [0:0] clk,
	input logic [13:0] in_data,
	input logic [0:0] in_valid,
	output logic [13:0] out_data,
	output logic [0:0] out_valid
);

logic [13:0] buffer[7:0];
logic [7:0] valid = 8'd0;

always_ff @(posedge clk) begin
	buffer[0] <= in_data;
	out_data <= buffer[7];
	valid[0] <= in_valid;
	out_valid <= valid[7];
	buffer[1] <= buffer[0];
	valid[1] <= valid[0];
	buffer[2] <= buffer[1];
	valid[2] <= valid[1];
	buffer[3] <= buffer[2];
	valid[3] <= valid[2];
	buffer[4] <= buffer[3];
	valid[4] <= valid[3];
	buffer[5] <= buffer[4];
	valid[5] <= valid[4];
	buffer[6] <= buffer[5];
	valid[6] <= valid[5];
	buffer[7] <= buffer[6];
	valid[7] <= valid[6];
end

endmodule

