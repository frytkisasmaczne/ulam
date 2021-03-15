module buffer
#(	parameter W=8)
 (	input enable,
	input [W-1:0] data_in,
	output reg [W-1:0] data_out );

	always @(posedge enable) begin
		data_out <= data_in;
	end
endmodule
