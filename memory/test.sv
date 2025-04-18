`include "environment.sv"
program test(inf inf1);
	environment env;
	
	initial begin 
		env = new(inf1);
		env.gen.repeat_count = 200;
		env.run();
	end
endprogram
