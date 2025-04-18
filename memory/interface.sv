interface inf(input logic clk, rst);	
	logic wr_enb;
	logic[3:0] wr_addr;
	logic[7:0] wr_data;
	logic rd_enb;
	logic[3:0] rd_addr;
	logic[7:0] rd_data;
endinterface
