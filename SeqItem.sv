class fifo_seq_item extends uvm_sequence_item;
`uvm_object_utils(fifo_seq_item)

bit clk, rst;
bit wr_en, rd_en;
rand bit [3:0] datain;
bit [3:0]dataout;

function new(string name="fifo_seq_item");
super.new(name);
endfunction
endclass
