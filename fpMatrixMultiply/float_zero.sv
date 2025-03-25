module float_zero (
    input logic clk,
    output logic [31:0] float_zero
);
    // IEEE 754 Single Precision Floating-Point Zero (0.0)
    assign float_zero = 32'b00000000000000000000000000000000;
endmodule
