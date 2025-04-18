class monitor;
	virtual inf vif;
	mailbox mon2scb;
	
	function new(virtual inf vif, mailbox mon2scb);
		this.vif = vif;
		this.mon2scb = mon2scb;
	endfunction

	task main;
		forever begin
			transaction trans;
			trans = new();
			@(posedge vif.clk);
			@(posedge vif.clk);
			trans.d = vif.d;
			trans.reset = vif.reset;
			@(posedge vif.clk);
			trans.q = vif.q;
			@(posedge vif.clk);
			

			mon2scb.put(trans);
			trans.display("[MONITOR]");
		end
	endtask
endclass
