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
			if (!trans.randomize()) $fatal("Fatal error");
			trans.cg.sample();
			gen2driv.put(trans);
		end
		-> ended;
		$display("coverage: %0.2f %%", trans.cg.c1Xc2.get_inst_coverage());
		$display("coverage2: %0.2f %%", trans.cg.c3Xc4.get_inst_coverage());
	endtask

endclass
