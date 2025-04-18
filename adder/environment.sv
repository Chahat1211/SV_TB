`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
	generator gen;
 	driver driv;
	monitor mon;
	scoreboard scb;
	
	mailbox gen2driv;
	mailbox mon2sub;
	
	virtual inf vif;

	function new(virtual inf vif);
		this.vif = vif;
		gen2driv = new();
		mon2sub = new();
		gen = new(gen2driv);
		driv = new(vif,gen2driv);
		mon = new(vif, mon2sub);
		scb = new(mon2sub);
	endfunction

	task test();
		fork 
			gen.main();
			driv.main();
			mon.main();
			scb.main();
		join_any
	endtask 

	task post_test();
		wait( gen.ended.triggered);
		wait( gen.repeat_count ==driv.no_transactions);
		wait( gen.repeat_count ==scb.no_transactions);
	endtask 
	
	task run();
		test();
		post_test();
		$finish;
	endtask 
endclass
