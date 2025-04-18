class transaction;
	rand bit d;
	rand bit reset;
	bit q;

	function void display(string name);
		$display("------------------------");
		$display("- %s", name);
		$display("------------------------");
		$display(" d = %b, reset = %b", d, reset);
		$display("  q = %b ", q);
		$display("------------------------");
	endfunction
endclass


