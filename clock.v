module clock
 ( output reg clock );

initial begin
	clock = 1'b0;
end

always begin
	#10	//idk how long that is,
		//but timescale probably sets time for entire project
		//so i'm gonna clarify this one later
	clock = !clock;
end

endmodule
