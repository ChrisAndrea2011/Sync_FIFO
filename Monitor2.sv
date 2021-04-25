class fifo_mon2 extends uvm_monitor;
`uvm_component_utils(fifo_mon2)

fifo_seq_item pkt1;
virtual intf inf;

uvm_analysis_port #(fifo_seq_item)item_collected_port1;

function new(string name= "fifo_mon2", uvm_component parent);
super.new(name, parent);
item_collected_port1=new("item_collected_port1", this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual intf)::get(this, "", "inf", inf);
endfunction

task run_phase(uvm_phase phase);
pkt1=fifo_seq_item::type_id::create("pkt1", this);
forever
begin
@(inf.cb)
pkt1.rd_en = inf.rd_en;
pkt1.wr_en = inf.wr_en;
pkt1.dataout = inf.dataout;
//$display("Mon2 : pkt1.dataout = %d, inf.dataout=%d", pkt1.dataout, inf.dataout);
item_collected_port1.write(pkt1);
end
endtask
endclass
