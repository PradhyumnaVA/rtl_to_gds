// Code your testbench here
// or browse Examples
module tb_count();

reg i_clk,
     i_rst,
     i_en,
     i_up_down;

  wire [2:0]o_Q;

up_down_counter DUT (
	.i_clk(i_clk),
	.i_rst(i_rst),
	.i_en(i_en),
	.i_up_down(i_up_down),
	.o_Q(o_Q)
);

always #5 i_clk = ~i_clk;

initial begin
	i_clk = 1;
	i_en = 1;
	i_up_down = 0;
	#11 i_rst = 1;
	#10 i_rst = 0;
	i_up_down = 1;
	#50 i_up_down = 0;
//   #50 i_en = 0;
//   #20 i_en = 1;
	#150 $finish;
end

initial begin
	$dumpfile("count.vcd");
  $dumpvars(0, tb_count);
end

endmodule


