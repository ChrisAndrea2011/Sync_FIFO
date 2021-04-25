class fifo_agt1 extends uvm_agent;
`uvm_component_utils(fifo_agt1)

fifo_seqr seqr;
fifo_driver drv;
fifo_mon1 mon1;

function new(string name="fifo_agt1", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
seqr = fifo_seqr::type_id::create("seqr", this);
drv = fifo_driver::type_id::create("drv", this);
mon1 = fifo_mon1::type_id::create("mon1", this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
drv.seq_item_port.connect(seqr.seq_item_export);
uvm_top.print_topology();
endfunction
endclass

