`include "design.sv"
`include "interface.sv"
`include "test.sv"

module tb;

	inf inf1();
	test t1(inf1);
	
	mux DUT(.a(inf1.a),.b(inf1.b),.c(inf1.c),.d(inf1.d),.sel(inf1.sel),.out(inf1.out));
	
	initial begin
		$monitor("a = %b, b = %b, c = %b, d = %b, sel = %b, out = %b", inf1.a,inf1.b,inf1.c,inf1.d,inf1.sel,inf1.out);
	end
endmodule	
