class fifo_seqr extends uvm_sequencer #(fifo_seq_item);
`uvm_component_utils(fifo_seqr)

function new(string name="fifo_seqr", uvm_component parent);
super.new(name, parent);
endfunction
endclass