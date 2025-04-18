class monitor;
	virtual inf vif;
	transaction trans;
	
	mailbox mon2scb;

	function new(virtual inf vif, mailbox mon2scb);
		this.vif = vif;
		this.mon2scb = mon2scb;
	endfunction

	task main;
		forever begin
			#2;
			trans = new();
			trans.a = vif.a;
			trans.b = vif.b;
			trans.c = vif.c;
			trans.d = vif.d;
			trans.sel = vif.sel;
			trans.out = vif.out;
			mon2scb.put(trans);
			trans.display("[MONITOR]");
			
		end
	endtask
endclass
