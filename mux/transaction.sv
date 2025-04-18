class transaction;
	rand bit[1:0] a;
	rand bit[1:0] b;
	rand bit[1:0] c;
	rand bit[1:0] d;
	rand bit[1:0] sel;
	bit[1:0] out;

	function void display(string name);
		$display("-----------------------");
		$display(" -%s" , name);
		$display("-----------------------");
		$display(" a = %b, b = %b, c = %b, d = %b", a,b,c,d);
		$display(" sel = %b" , sel);
		$display("out = %b" , out);
		$display("-----------------------");
	endfunction
endclass
