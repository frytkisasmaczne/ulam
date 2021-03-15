module collatzTest
#(	parameter W=8 )
 (	input [W-1:0] testValue,
 	input go,
 	output reg ready,
	output reg [W-1:0] result	);

	reg [W-1:0] currentValue;

	initial begin
		currentValue = 0;
	end

	always @(posedge go) begin
		if(currentValue==0) begin
			currentValue = testValue;
		end
		if(currentValue==1) begin
			result = currentValue;
			ready = 1'b1;
		end
		else begin
			if(currentValue[0]) begin	//testValue[0]==1 so tV=tV*3+1
				//instead of multiplying by 3 i tried to optimize with a bitshift and triple addition
				//not sure if it's faster tho
				currentValue =( currentValue + (currentValue << 1) + 1);
			end
			else begin	//it's divisible by 2, so divide by 2 with a bitshift
				currentValue =( currentValue >> 1);
			end
		end
	end
endmodule
