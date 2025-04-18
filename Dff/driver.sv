class driver;
	int no_transactions;
	
	virtual inf vif;

	mailbox gen2driv;
	
	function new (virtual inf vif, mailbox gen2driv);
		this.vif = vif;
		this.gen2driv = gen2driv;
	endfunction

	task main();
		forever begin 
			transaction trans; 
			gen2driv.get(trans);
			@(posedge vif.clk);
			vif.d <= trans.d;
			vif.reset <= trans.reset;
			@(posedge vif.clk);
			trans.display("[ Driver ]");
	      		no_transactions++;
		end
	endtask 
endclass


		
	
