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
				if ( trans.sel == 2'b00 & trans.out == trans.a)
					$display("Result as Expected");
				else if ( trans.sel == 2'b01 & trans.out == trans.b)
					$display("Result as Expected");
				else if ( trans.sel == 2'b10 & trans.out == trans.c)
					$display("Result as Expected");
				else if ( trans.sel == 2'b11 & trans.out == trans.d)
					$display("Result as Expected");
				else 
					$error("Wrong Result");
				no_transactions++;
				trans.display("[SCOREBOARD]");	
			end
		endtask
endclass
