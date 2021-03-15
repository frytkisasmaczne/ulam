module watchdog
#(	parameter W=8)
 (	input clear,
 	input run,		//trigger to lepsza nazwa
 	output reg cout,	//carry out jak bedzie overflow
 	output reg [W-1:0] value );

	always @(posedge run or posedge clear) begin
		if (clear) begin
			cout <= 1'b0;
			value <= 0;
		end else begin
		{cout,value} <= {cout,value} + 1'b1;
		end
	end

endmodule
//counter has garbage values on start, it should be explicitly cleared before first use
