module FONT_ROM 
#(
    parameter FONT_FILE = "BRAM_8.list"
)
(
    input clk,
    input [10:0] addr,
    output [7:0] data_out
);

reg [7:0] mem [(1 << 11)-1:0];
reg [0:10] data;
assign data_out = data;

initial begin
    $readmemb(FONT_FILE, mem);
end

always @(posedge clk)
begin
    data = mem[addr];
end

endmodule