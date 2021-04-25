class fifo_env extends uvm_env;
`uvm_component_utils(fifo_env)

fifo_agt1 agt1;
fifo_agt2 agt2;
fifo_sb sb;

function new(string name="fifo_env", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
agt1 = fifo_agt1::type_id::create("agt1", this);
agt2 = fifo_agt2::type_id::create("agt2", this);
sb = fifo_sb::type_id::create("sb", this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
agt1.mon1.item_collected_port.connect(sb.ip_fifo.analysis_export);
agt2.mon2.item_collected_port1.connect(sb.op_fifo.analysis_export);
endfunction
endclass