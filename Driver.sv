class fifo_driver extends uvm_driver #(fifo_seq_item);
`uvm_component_utils(fifo_driver)

fifo_seq_item pkt;
virtual intf inf;

function new(string name="fifo_driver", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(virtual intf)::get(this, "", "inf", inf))
`uvm_fatal("from driver", "Failed to get virtual sequence")
endfunction

task run_phase(uvm_phase phase);
pkt = fifo_seq_item::type_id::create("pkt");
forever
begin
seq_item_port.get_next_item(pkt);
@(inf.cb);
inf.rst = pkt.rst;
inf.rd_en = pkt.rd_en;
inf.wr_en = pkt.wr_en;
if (pkt.wr_en==1) begin
inf.datain = pkt.datain;
//$display("Driver: pkt.datain = %d", pkt.datain);
 end
seq_item_port.item_done();
end
endtask
endclass