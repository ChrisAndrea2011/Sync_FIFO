class fifo_test extends uvm_test;
`uvm_component_utils(fifo_test)

fifo_env env;
fifo_seq seq;

function new(string name="fifo_test", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env = fifo_env::type_id::create("env", this);
endfunction

task run_phase(uvm_phase phase);

seq = fifo_seq::type_id::create("seq");
phase.raise_objection(this);
seq.start(env.agt1.seqr);
phase.drop_objection(this);
endtask
endclass
