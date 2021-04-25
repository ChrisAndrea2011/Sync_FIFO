module dut(intf inf);
FIFO FIFO_inst(.clk(inf.clk), .rst(inf.rst), .rd_en(inf.rd_en), .wr_en(inf.wr_en), .datain(inf.datain), .full_flag(inf.full_flag), .empty_flag(inf.empty_flag), .dataout(inf.dataout));
endmodule
