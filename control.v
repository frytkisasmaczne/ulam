module control
 (	input start, done, alert, clock,
	output reg clear, run, go, enable );

reg running;

initial begin
	running = 1'b0;
end

always @(posedge start or posedge alert) begin
	if (alert) begin
		running = 0;
	end else begin
	clear = 1'b0;
	clear = 1'b1;
	clear = 1'b0;
	enable = 1'b1;
	running = 1'b1;
	end
	//clock idk
	//|-->run
	//|-->go
	//on first: enable, clear
	//also alarm stops run, meant for overflow of watchdog
end

always @(posedge clock) begin
	if (running) begin
		run <= 1'b1;
		go <= 1'b1;
	end
end

endmodule
