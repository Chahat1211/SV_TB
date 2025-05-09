class generator;

	rand transaction trans; 

	mailbox gen2driv; //as we need to send value to driver

	int repeat_count ;
	
	event ended; 

	function new ( mailbox gen2driv);
		this.gen2driv = gen2driv;
	endfunction

	task main();
		repeat(repeat_count) begin
			trans = new();
			if ( !trans.randomize()) $fatal( "Gen :: trans randomization failed");
			gen2driv.put(trans); //after rand. put values 
		end
		-> ended;
	endtask		
endclass
