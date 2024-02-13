module LETTER_GEN (
    input clk_in,
    input [10:0] pix_x_in,
    input [10:0] pix_y_in,
    output [2:0] red_out,
    output [2:0] green_out,
    output [2:0] blue_out
);

    reg [2:0] red; 
    reg [2:0] green;
    reg [2:0] blue;

    reg [10:0] font_addr;
    wire [7:0] font_data; 

    reg [7:0] number;
    reg pixel;

    always @(negedge clk_in)
    begin
        if (pix_y_in > 600) begin
            number = 0;
        end
        number = (pix_x_in-1)/16 + (pix_y_in/16 * 50);
        font_addr = (pix_y_in/2)%8 + (number * 8);
        
        
    end

    always @(posedge clk_in)
    begin    
        if (pix_x_in > 800 | pix_y_in > 600) begin
            red = 0;
            green = 0;
            blue = 0;
        end
        else begin
            pixel = font_data[8 - ((pix_x_in/2) % 8)];
            red = 7*pixel;
            green = 7*pixel;
            blue = 7*pixel;
        end
        
    end

     FONT_ROM font_rom1 (
        .clk(clk_in),
        .addr(font_addr),
        .data_out(font_data)
    );

    assign red_out = red;
    assign green_out = green;
    assign blue_out = blue;

endmodule