module clk_gating(
input CLK,
input CLK_EN,
output GATED_CLK
);
reg output_gated;
assign GATED_CLK=(CLK & output_gated);
always@(CLK) begin
if(!CLK) begin
output_gated <= CLK_EN;
end
end

endmodule