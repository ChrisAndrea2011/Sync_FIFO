class fifo_test_rd extends uvm_test;
`uvm_component_utils(fifo_test_rd)

fifo_env env;
fifo_seq_rd seq_rd;
function new(string name="fifo_test_rd", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env = fifo_env::type_id::create("env", this);
endfunction

task run_phase(uvm_phase phase);
seq_rd = fifo_seq_rd::type_id::create("seq_rd");
phase.raise_objection(this);
seq_rd.start(env.agt1.seqr);
phase.drop_objection(this);
endtask
endclass