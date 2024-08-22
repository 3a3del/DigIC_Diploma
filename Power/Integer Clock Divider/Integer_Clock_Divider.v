`timescale 1ns / 1ps

module Integer_Clock_Divider(
    input I_ref_clk,             // Reference Frequency
    input I_rst_n,               // Active Low Asynchronous Reset
    input [31:0] I_div_ratio,    // The divided ratio (integer value)
    input I_clk_en,              // Clock Divider Block Enable
    output o_div_clk             // Output Frequency
);

    reg o_div_clk_re, ClK_DIV_EN;
    integer i = 0;

    assign o_div_clk = o_div_clk_re;
    //assign I_clk_en = ClK_DIV_EN;

    always @(posedge I_ref_clk or negedge I_rst_n) begin
        if (!I_rst_n) begin
            o_div_clk_re <= 1'b0;
        end else begin
            ClK_DIV_EN <= ( I_clk_en && (I_div_ratio != 32'b0) && (I_div_ratio != 8'h00000001) );
            if (ClK_DIV_EN) begin
                if (i == I_div_ratio) begin
                    o_div_clk_re <= ~o_div_clk_re;
                    i <= 1;
                end else if (i == 0 || i == (I_div_ratio / 2)) begin
                    o_div_clk_re <= ~o_div_clk_re;
                    i <= i + 1;
                end else begin
                    i <= i + 1;
                end
            end
        end
    end

endmodule
