module main(
output [6:0]seg_10,
output [6:0]seg_09,
output [6:0]seg_08,
output [6:0]seg_07,
output [6:0]seg_06,
output [6:0]seg_05,
output [6:0]seg_04,
output [6:0]seg_03,
output [6:0]seg_02,
output [6:0]seg_01 );

reg start;
reg data_in;
reg mux_select;

wire clk;

control b_control (
	.start(start),
	.done(ready_done),
	.alert(alert),
	.clock(clk),
	.clear(clear),
	.run(run),
	.go(go),
	.enable(enable) );

wire ready_done;
wire alert;
wire clear;
wire run;
wire go;
wire enable;

defparam b_watchdog.W = 32;
watchdog b_watchdog (
	.clear(clear),
	.run(run),
	.cout(alert),
	.value(watchdog_value) );

wire [32:0] watchdog_value;

defparam b_buffer.W = 32;
buffer b_buffer (
	.enable(enable),
	.data_in(data_in),
	.data_out(buffer_data_out) );

wire [32:0] buffer_data_out;

defparam b_collatzTest.W = 32;
collatzTest b_collatzTest (
	.testValue(buffer_data_out),
	.go(go),
	.ready(ready_done),
	.result(collatz_result) );

wire [32:0] collatz_result;

defparam b_mux.W = 32;
selector b_mux (
	.data_a(watchdog_value),
	.data_b(collatz_result),
	.data_c(buffer_data_out),
	.select(mux_select),
	.data_o(mux_data_out) );

wire [32:0] mux_data_out;

defparam b_bin2bcd.W = 32;
bin2bcd b_bin2bcd (
	.bin(mux_data_out),
	.bcd(bcd_register) );

wire [39:0] bcd_register;

bcd7seg b_7seg_10 ( .bcd(bcd_register[39:36]), .seg(seg_10) );
bcd7seg b_7seg_09 ( .bcd(bcd_register[35:32]), .seg(seg_09) );
bcd7seg b_7seg_08 ( .bcd(bcd_register[31:28]), .seg(seg_08) );
bcd7seg b_7seg_07 ( .bcd(bcd_register[27:24]), .seg(seg_07) );
bcd7seg b_7seg_06 ( .bcd(bcd_register[23:20]), .seg(seg_06) );
bcd7seg b_7seg_05 ( .bcd(bcd_register[19:16]), .seg(seg_05) );
bcd7seg b_7seg_04 ( .bcd(bcd_register[15:12]), .seg(seg_04) );
bcd7seg b_7seg_03 ( .bcd(bcd_register[11: 8]), .seg(seg_03) );
bcd7seg b_7seg_02 ( .bcd(bcd_register[7 : 4]), .seg(seg_02) );
bcd7seg b_7seg_01 ( .bcd(bcd_register[3 : 0]), .seg(seg_01) );

//wire [7:0] seg_10;
//wire [7:0] seg_09;
//wire [7:0] seg_08;
//wire [7:0] seg_07;
//wire [7:0] seg_06;
//wire [7:0] seg_05;
//wire [7:0] seg_04;
//wire [7:0] seg_03;
//wire [7:0] seg_02;
//wire [7:0] seg_01;

//TODO: podlaczyc do wyswietlaczy
//haa, jajco nie todo, usuwa mi caly projekt
//bo nie wplywa na outputy jak nie mam nic podpietego

//crude clock module based on delays
clock b_clock(.clock(clk));

endmodule
