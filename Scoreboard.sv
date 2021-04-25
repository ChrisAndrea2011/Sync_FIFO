class fifo_sb extends uvm_scoreboard;
`uvm_component_utils(fifo_sb)

fifo_seq_item pkt;
fifo_seq_item pkt1;

uvm_tlm_analysis_fifo #(fifo_seq_item)ip_fifo;
uvm_tlm_analysis_fifo #(fifo_seq_item)op_fifo;

int datain_queue[$];

function new(string name="fifo_sb", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
ip_fifo = new("ip_fifo", this);
op_fifo = new("op_fifo", this);
endfunction

task run_phase(uvm_phase phase);
pkt = fifo_seq_item::type_id::create("pkt");
pkt1 = fifo_seq_item::type_id::create("pkt1");

forever
begin
fork
ip_fifo.get(pkt);
//$display($time, "Mon1 pkt.datain=%d", pkt.datain); 
op_fifo.get(pkt1);
//$display($time, "Mon2 pkt1.dataout=%d", pkt1.dataout);

join

 if(pkt1.wr_en==1)
  begin
  
  datain_queue.push_back(pkt.datain);
$display($time,"datain_queue=%p",datain_queue); 
end


if(pkt1.rd_en==1)
begin
  #10;
  pkt.dataout=datain_queue.pop_front();
//$display($time,"From queue : pkt.dataout=%d", pkt.dataout);

        if(pkt.dataout==pkt1.dataout)
        begin
        $display($time, "SB Data Matched!! pkt.dataout=%d, pkt1.dataout=%d", pkt.dataout, pkt1.dataout);
        end
        
        else begin
        $display($time, "SB Data not Matched!! pkt.dataout=%d, pkt1.dataout=%d", pkt.dataout, pkt1.dataout);
        end
        end
      end
        endtask
        endclass
        
