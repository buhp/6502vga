`default_nettype none

module main (
 input clk_16_in,
 output h_sync_out,
 output v_sync_out,
 output [2:0] red_out,
 output locked_out,
 output [2:0] green_out,
 output [2:0] blue_out,
 input [1:0] address,
 input [7:0] data_in,
 input chip_enable,
 input read_write,
 input ext_clock
);
 localparam p1 = 0;
 localparam p2 = 1;
 localparam p3 = 4;
 wire clk_16;
 wire locked;
 wire clk;
 wire h_sync;
 wire v_sync;
 wire [0:10] pix_x;
 wire [0:10] pix_y;
 wire [0:2] red;
 wire [0:2] green;
 wire [0:2] blue;

 assign clk_16 = clk_16_in;
 assign locked_out = locked;
 assign h_sync_out = h_sync;
 assign v_sync_out = v_sync;
 assign red_out = red;
 assign green_out = green;
 assign blue_out = blue;
 
 PLL_40MHZ #(
  .DIV_R(0),
  .DIV_Q(1),
  .DIV_F(4)
 ) pll_40mhz1 (
  .clock_in(clk_16),
  .clock_out(clk),
  .locked(locked)
 );

 VGA_SYNC_GEN vga_sync_gen1 (
  .clk_in(clk),
  .h_sync_out(h_sync),
  .v_sync_out(v_sync),
  .pix_x(pix_x),
  .pix_y(pix_y)
 );

// IMAGE_GEN image_gen1 (
//   .pix_x(pix_x),
//   .pix_y(pix_y),
//   .red_out(red),
//   .green_out(green),
//   .blue_out(blue),
//   .clk_in(clk)
//  );

LETTER_GEN letter_gen1 (
  .clk_in(clk),
  .pix_x_in(pix_x),
  .pix_y_in(pix_y),
  .red_out(red),
  .green_out(green),
  .blue_out(blue)
);


endmodule

