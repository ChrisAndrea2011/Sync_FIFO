class fifo_mon1 extends uvm_monitor;
`uvm_component_utils(fifo_mon1)

fifo_seq_item pkt;
virtual intf inf;
uvm_analysis_port #(fifo_seq_item)item_collected_port;

function new(string name="fifo_mon1", uvm_component parent);
super.new(name, parent);
item_collected_port=new("item_collected_port", this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual intf)::get(this, "", "inf", inf);
endfunction

task run_phase(uvm_phase phase);
pkt=fifo_seq_item::type_id::create("pkt");
forever
begin
@(inf.cb)
pkt.wr_en = inf.wr_en;
pkt.rd_en = inf.rd_en;
pkt.rst = inf.rst;
pkt.datain = inf.datain;
item_collected_port.write(pkt);
end
endtask
endclass
