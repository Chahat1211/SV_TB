`define ADDR_WIDTH 4
`define DEPTH 16
`define DATA_WIDTH 8 


class transaction;
	bit clk;
	bit rst;
	rand bit wr_enb;
	rand bit[3:0] wr_addr;
	rand bit[7:0] wr_data;
	rand bit rd_enb;
	rand bit[3:0] rd_addr;
	     bit[7:0] rd_data;
	
	
	constraint c1 { wr_enb != rd_enb; }

	covergroup cg;
		c1Xc2: cross wr_addr, wr_enb iff(wr_enb==1);
		c3Xc4: cross rd_addr, rd_enb iff(rd_enb == 1);
	endgroup: cg
	
	function new();
		cg =new();
	endfunction
	
	function void display(string name);
		$display("--------------------------------");
		$display("[%0t]-%s", $time,name);
		$display("--------------------------------");
		$display("clk = %0b, rst = %0b", clk,rst);
		$display("wr_enb = %0b, rd_enb = %0b", wr_enb, rd_enb);
		$display("wr_addr = %0b, wr_data = %0b", wr_addr, wr_data);	
		$display("rd_addr = %0b, rd_data = %0b", rd_addr, rd_data);
		$display("--------------------------------");
	endfunction
endclass
