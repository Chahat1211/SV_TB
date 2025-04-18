class transaction;
	rand bit[3:0] a;
	rand bit[3:0] b;
	bit[3:0] sum;
	bit cout;

	function void display(string name);
		$display("-----------------------");
		$display("- %s ", name);
		$display("-----------------------");
		$display("- a = %0d, b = %0d", a,b);
		$display(" cout = %0d, sum = %0d", cout, sum);
		$display("-----------------------");
	endfunction
endclass
		
