`include "design.sv"
`include "interface.sv"
`include "test.sv"

module tb;
	bit clk;
	always #5 clk = ~clk;
	
	
	inf inf1(clk);
	test t1(inf1);

	dff DUT(.d(inf1.d),.reset(inf1.reset),.clk(inf1.clk),.q(inf1.q));
endmodule

