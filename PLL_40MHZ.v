module PLL_40MHZ #(
 parameter DIV_R = 0,
 parameter DIV_Q = 0,
 parameter DIV_F = 0
) (
 input clock_in,
 output clock_out,
 output locked
);
 SB_PLL40_CORE #(
 	.FEEDBACK_PATH("SIMPLE"),
 	.DIVR(DIV_R),
 	.DIVF(DIV_F),
 	.DIVQ(DIV_Q),
 	.FILTER_RANGE(3'b001)
 ) uut (
 	.LOCK(locked),
 	.RESETB(1'b1),
 	.BYPASS(1'b0),
 	.REFERENCECLK(clock_in),
 	.PLLOUTCORE(clock_out)
 );
endmodule