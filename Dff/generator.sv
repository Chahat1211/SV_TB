class generator;
	rand transaction trans;
	
	mailbox gen2driv;
	
	int repeat_count;

	event ended;

	function new(mailbox gen2driv);
		this.gen2driv = gen2driv;
	endfunction

	task main();
		repeat(repeat_count) begin
			trans = new();
			if (!trans.randomize())$fatal("rand. failed");
			gen2driv.put(trans);
		end
		-> ended;
	endtask
endclass 
