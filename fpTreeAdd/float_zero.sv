module float_zero(output logic [31:0] zero);

    parameter logic [31:0] FP_ZERO = 32'h00000000;

    assign zero = FP_ZERO;

endmodule
