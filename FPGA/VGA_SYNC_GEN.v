module VGA_SYNC_GEN (
 input clk_in,
 output h_sync_out,
 output v_sync_out,
 output [10:0] pix_x,
 output [10:0] pix_y
);
 reg [10:0] h_count;
 reg [10:0] v_count;
 
 reg h_sync;
 reg v_sync;
 reg active;
 
 initial
 begin
     h_count <= 0;
     v_count <= 0;
 end
 
     always @(posedge clk_in)
     begin
         if (h_count >= 1056) begin
             h_count = 0;
             if (v_count >= 628) begin
                 v_count = 0;
             end
             else begin
                 v_count = v_count + 1;
             end
         end
         else begin
             h_count = h_count + 1;
         end
     end
 
 
 always @(posedge clk_in)
     begin
         if (h_count >= 840 & h_count < 968) begin
             h_sync = 0;
         end
         else begin
             h_sync = 1;
         end
         if (v_count >= 601 & v_count < 605) begin
             v_sync = 0;
         end
         else begin
             v_sync = 1;
         end
         if (h_count <= 800 & v_count <= 600) begin
             active = 1;
         end
         else begin
             active = 0;
         end
      end
      
      assign h_sync_out = h_sync;
      assign v_sync_out = v_sync;
      assign pix_x = h_count;
      assign pix_y = v_count;
endmodule