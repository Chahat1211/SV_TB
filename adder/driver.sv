class driver;

	int no_transactions;
	virtual inf vif;
	
	mailbox gen2driv;

	function new(virtual inf vif, mailbox gen2driv);
		this.vif = vif;
		this.gen2driv = gen2driv;
	endfunction

	task main;
	  forever begin 
		transaction trans;
		gen2driv.get(trans);
		vif.a <= trans.a;
		vif.b <= trans.b;

		trans.cout = vif.cout;
		trans.sum = vif.sum;

		trans.display("[DRIVER]");
		no_transactions++;
	  end
	endtask 
endclass
