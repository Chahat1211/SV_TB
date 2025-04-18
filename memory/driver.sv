class driver;
	int no_transactions;
	
	virtual inf vif;

	mailbox gen2driv;

	function new(virtual inf vif, mailbox gen2driv);
		this.vif = vif;
		this.gen2driv = gen2driv;
	endfunction
	
	task main();
		forever begin
			transaction trans;	
			gen2driv.get(trans);
			trans.display("[DRIVER}");
			//@(posedge vif.clk);
			vif.rd_enb <= trans.rd_enb;
			vif.wr_enb <= trans.wr_enb;
			vif.wr_data <= trans.wr_data;
			vif.wr_addr <= trans.wr_addr;
			vif.rd_addr <= trans.rd_addr;
			@(posedge vif.clk);

			no_transactions++;
		end
	endtask
endclass
