class scoreboard;
	mailbox mon2scb;
	
	int no_transactions;	
		
	function new(mailbox mon2scb);
		this.mon2scb = mon2scb;
	endfunction

	task main;
		transaction trans;
		forever begin
			mon2scb.get(trans);
			if (trans.q == trans.d & trans.reset == 0)
			$display("[Result as expected]");
			else if ( trans.reset == 1 & trans.q == 0)
			$display("[Result as expected]");
			else
			 $error("Wrong Result");
			no_transactions++;
			trans.display("[SCOREBOARD]");
		end
	endtask
endclass
