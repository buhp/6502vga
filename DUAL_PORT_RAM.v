module DUAL_PORT_RAM (
    input clk_a, clk_b, enable_a, write_a, enable_b,
    input [15:0] address_a, address_b,
    input [7:0] data_in_a,
    output [7:0] data_out_b
);

    reg [15:0] ram [1023:0];
    reg [7:0] data_b;

    always @(posedge clk_a)
    begin
        if (enable_a)
        begin   
            if (write_a)
            begin
                ram[address_a] <= data_in_a;
            end
        end
    end

    always @(posedge clk_b)
    begin
        if (enable_b)
        begin
            data_b <= ram[address_b];
        end
    end

endmodule