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
			//@(posedge vif.clk);
			@(posedge vif.clk);
			trans.rd_enb = vif.rd_enb;
			trans.wr_enb = vif.wr_enb;
			trans.wr_data = vif.wr_data;
			trans.wr_addr = vif.wr_addr;
			trans.rd_addr = vif.rd_addr;
			trans.rst=vif.rst;
			//@(posedge vif.clk);
			trans.rd_data = vif.rd_data;
			mon2scb.put(trans);
			trans.display("[MONITOR]");
			//@(posedge vif.clk);
		end
	endtask
endclass
		
