module IMAGE_GEN (
 input clk_in,
 input [10:0] pix_x,
 input [10:0] pix_y,
 output [2:0] red_out,
 output [2:0] green_out,
 output [2:0] blue_out
);
 reg [2:0] red;
 reg [2:0] green;
 reg [2:0] blue;
 
 reg [8:0] counter;
 
 always @(posedge clk_in)
 begin
     if (pix_x > 800 | pix_y > 600) begin
         red = 0;
         green = 0;
         blue = 0;
     end
     else begin
         counter = counter + 1;
         red = pix_x / 20;
         green = pix_x / 40;
         blue = pix_x / 80;
     end
 end
 
 assign red_out = red;
 assign green_out = green;
 assign blue_out = blue;
endmodule