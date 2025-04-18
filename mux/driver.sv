class driver;
	int no_transactions; // to count no. of trans
	
	virtual inf vif;// as interface is static and class is dynamic
	transaction trans;
	mailbox gen2driv;

	function new (virtual inf vif, mailbox gen2driv);
		this.vif = vif;
		this.gen2driv  = gen2driv;
	endfunction

	task main;
		forever begin
			#1;	
			gen2driv.get(trans);// get values from generator
			vif.a <= trans.a;// pass value to interface
			vif.b <= trans.b;
			vif.c <= trans.c;
			vif.d <= trans.d;
			vif.sel <= trans.sel;
			//vif.out <= trans.out;
			trans.display("[DRIVER]");
			no_transactions++;//count no. of trans
		end
	endtask
endclass
