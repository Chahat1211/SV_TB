`define ADDR_WIDTH 4
`define DEPTH 16
`define DATA_WIDTH 8 

class scoreboard;
	mailbox mon2scb;
	
	int no_transactions;
	reg [`DATA_WIDTH-1:0] ram [0:`DEPTH-1];
	int i;

	function new(mailbox mon2scb);
		this.mon2scb = mon2scb;
	endfunction

	task main;
		transaction trans;
		forever begin 
			mon2scb.get(trans);
			trans.display("[SCOREBOARD]");
			if (trans.rst) begin
				 for (i=0;i<`DEPTH;i=i+1) 
         				ram[i] <= `DATA_WIDTH'd0;
			end
			else begin
				if(trans.rd_enb) begin
					if(ram[trans.rd_addr] != trans.rd_data)
						$error("Error");
					else
						$display("#Match");
				end
				else if (trans.wr_enb) begin
					ram[trans.wr_addr] = trans.wr_data;
					$display("Data Written");
				end
			end
			no_transactions++;
				
		end
	endtask
endclass

