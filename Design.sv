module FIFO ( input clk, rst, rd_en, wr_en,
input [3:0]datain,
output full_flag, empty_flag,
output reg [3:0]dataout);
reg [3:0] mem[0:15];
reg [3:0]rd_ptr, wr_ptr;

always @(posedge clk)
begin
if(rst==1) begin
dataout <= 0;
wr_ptr <=0; end
else if(wr_en==1 && full_flag==0) begin
mem[wr_ptr] <= datain;
wr_ptr = wr_ptr + 1;
end
end

always @(posedge clk)
begin
if(rst==1)begin
dataout <= 0;
rd_ptr <=0; end
else if(rd_en==1 && empty_flag==0)begin
dataout <= mem[rd_ptr];
rd_ptr <= rd_ptr+1; end
end

assign full_flag = (wr_ptr==15 && rd_ptr ==0)?1'b1:1'b0;
assign empty_flag = (wr_ptr==rd_ptr)?1'b1:1'b0;
endmodule
