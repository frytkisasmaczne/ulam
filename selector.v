module selector
#(	parameter W=8)
 (	input [W-1:0]data_a,
 	input [W-1:0]data_b,
 	input [W-1:0]data_c,
 	input [1:0]select,
 	output wire [W-1:0]data_o );

assign data_o = select==2'b00 ? data_a : (select==2'b01 ? data_b : data_c);

endmodule
