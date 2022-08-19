`timescale 1ns / 1ps

module base2bin (
	input logic [0:0] clk,
	input logic [7:0] in_data,
	input logic [0:0] in_valid,
	output logic [0:0] nl,
	output logic [1:0] out_data,
	output logic [0:0] out_valid
);


always_ff @(posedge clk) begin

	if (in_data == 8'd10) begin
		nl <= 1'd1;
	end
	else begin
		nl <= 1'd0;
	end

	if ((in_data == 8'd65) || (in_data == 8'd97)) begin
		out_data <= 2'd0;
		out_valid <= in_valid;
	end
	else if ((in_data == 8'd67) || (in_data == 8'd99)) begin
		out_data <= 2'd1;
		out_valid <= in_valid;
	end
	else if ((in_data == 8'd71) || (in_data == 8'd103)) begin
		out_data <= 2'd2;
		out_valid <= in_valid;
	end
	else if ((in_data == 8'd84) || (in_data == 8'd116)) begin
		out_data <= 2'd3;
		out_valid <= in_valid;
	end
	else begin
		out_data <= 2'd0;
		out_valid <= 1'd0;
	end
end

endmodule

