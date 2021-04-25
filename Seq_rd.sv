class fifo_seq_rd extends uvm_sequence #(fifo_seq_item);
`uvm_object_utils(fifo_seq_rd)

fifo_seq_item pkt;

function new(string name="fifo_seq_rd");
super.new(name);
endfunction

task body();
  pkt = fifo_seq_item::type_id::create("pkt");
for(int i=0; i<32;i++) begin 
if(i<8)begin
  start_item(pkt);
  pkt.wr_en =1'b1;
pkt.randomize();
$display("Seq: pkt.datain = %d", pkt.datain);
finish_item(pkt);
//#10;
end
else begin
start_item(pkt);
pkt.rd_en = 1'b1;
pkt.wr_en = 1'b1;
pkt.randomize();
$display("Seq: pkt.datain = %d", pkt.datain);
finish_item(pkt);
//pkt.rd_en=1'b1;
//finish_item(pkt);
end
end
endtask;
endclass