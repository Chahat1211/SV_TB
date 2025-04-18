class monitor;
	virtual inf vif;
	
	mailbox mon2sub;

	function new ( virtual inf vif, mailbox mon2sub);
		this.vif = vif;
		this.mon2sub = mon2sub;
	endfunction
	
	task main;
		forever begin
			transaction trans;	
			trans = new();
			trans.a = vif.a;
			trans.b = vif.b;
			trans.sum = vif.sum;
			trans.cout = vif.cout;
			mon2sub.put(trans);
			trans.display("[Monitor]");
			#10;
		end
	endtask
endclass

