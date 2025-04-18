`include "environment.sv"

program test(inf inf1);
	environment env;
	
	initial begin 
		env = new(inf1);
		env.gen.repeat_count = 10;
		env.run();
	end
endprogram 
