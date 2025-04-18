`include "interface.sv"
`include "test.sv"
`include "design.sv"


module tb;
	inf i_inf();

	test t1(i_inf);
	adder inst1(.a(i_inf.a),.b(i_inf.b),.sum(i_inf.sum),.cout(i_inf.cout));
	initial begin 
		$monitor("a = %0b, b = %0b, cout = %0b, sum = %0b", i_inf.a,i_inf.b,i_inf.cout,i_inf.sum);
	end
endmodule
