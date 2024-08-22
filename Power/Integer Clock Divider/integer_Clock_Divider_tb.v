`timescale 1ns / 1ps
module integer_Clock_Divider_tb;

    // Testbench signals
    reg I_ref_clk;
    reg I_rst_n;
    reg [31:0] I_div_ratio;
    reg I_clk_en;
    wire o_div_clk;
    
    // Instantiate the DUT (Device Under Test)
    Integer_Clock_Divider uut (
        .I_ref_clk(I_ref_clk),
        .I_rst_n(I_rst_n),
        .I_div_ratio(I_div_ratio),
        .I_clk_en(I_clk_en),
        .o_div_clk(o_div_clk)
    );

    // Generate reference clock (I_ref_clk)
    initial begin
        // Initialize inputs
        I_ref_clk <= 0;
        I_rst_n <= 0;
        I_div_ratio <= 0;
        I_clk_en <= 0;
        forever #5 I_ref_clk = ~I_ref_clk; // 100 MHz clock
    end

    // Test sequence
    initial begin
        // Apply reset
        #10 I_rst_n = 1; // Release reset

        // Test case 1: Divide by 2
        I_div_ratio = 2;
        I_clk_en = 1;
        #200;

        // Test case 2: Divide by 4
        I_div_ratio = 4;
        #200;
        
        // Test case 2: Divide by 5
        I_div_ratio = 5;
        #200;
        
        // Test case 3: Divide by 8
        I_div_ratio = 8;
        #200;

        // Disable clock divider
        I_clk_en = 0;
        #50;

        // Re-enable and divide by 16
        I_clk_en = 1;
        I_div_ratio = 16;
        #200;

        // Finish simulation
        $stop;
    end

endmodule
