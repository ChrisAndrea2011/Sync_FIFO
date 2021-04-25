import uvm_pkg::*;
`include "uvm_macros.svh"
`include "Interface.sv"
`include "Dut.sv"
`include "Design.sv"
`include "SeqItem.sv"
`include "Seq.sv"
`include "Seq_rd.sv"
`include "Seqr.sv"
`include "Driver.sv"
`include "Monitor1.sv"
`include "Agent1.sv"
`include "Monitor2.sv"
`include "Agent2.sv"
`include "Scoreboard.sv"
`include "Env.sv"
`include "Test.sv"
`include "Test2.sv"

module top();
bit clk;
bit rst;
initial begin
clk=0;
forever #5 clk = ~clk;
end

initial begin
rst=0;
#10;
rst=1;
end

intf inf(clk, rst);
dut dut(inf);

initial begin
uvm_config_db #(virtual intf)::set(uvm_root::get(),"*", "inf", inf);
run_test("");
end
endmodule