class scoreboard;
	mailbox mon2sub;
	
	int no_transactions;
	
	function new(mailbox mon2sub);
		this.mon2sub = mon2sub;
	endfunction
	
	task main;
		transaction trans  = new();
		forever begin
			mon2sub.get(trans);
			if (trans.a + trans.b =={trans.cout , trans.sum})
				$display("Display as expected");
			else
				$error("Wrong Result");
			no_transactions++;
			trans.display("[Scoreboard]");
		end
	endtask
endclass
