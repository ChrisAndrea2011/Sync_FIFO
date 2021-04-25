interface intf(input bit clk, rst);
logic rd_en;
logic wr_en;
logic [3:0]datain;
logic [3:0]dataout;
logic full_flag;
logic empty_flag;

clocking cb@(posedge clk);
  default input #1ns output #1ns;
endclocking



modport dut(input clk, rst, rd_en, wr_en, datain, output dataout, full_flag, empty_flag);
endinterface
