`include "design.sv"
`include "interface.sv"
`include "test.sv"

module tb;
	bit clk, rst;
	always #5 clk = ~clk;

	inf inf1(clk,rst);
	test t1(inf1);

	ram inst1(clk,rst,inf1.wr_enb,inf1.wr_addr,inf1.wr_data, inf1.rd_enb, inf1.rd_addr,inf1.rd_data);
	
	initial begin
		clk = 0; rst = 1;
		#10 rst = 0;
		#100 rst=1;
		#40 rst=0;
	end

endmodule

