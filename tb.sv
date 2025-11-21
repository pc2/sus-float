`timescale 1ns / 1ps

module ComputeRoots_tb;
    logic clk = 0;
    always #5 clk = !clk;
    
    logic compute_roots = 0;
    shortreal a;
    shortreal b;
    shortreal c;
    logic roots_valid;
    shortreal root_1;
    shortreal root_2;

    logic[31:0] root_1_bits;
    logic[31:0] root_2_bits;
    assign root_1 = $bitstoshortreal(root_1_bits);
    assign root_2 = $bitstoshortreal(root_2_bits);
    ComputeRoots computer(
        .clk,
        .compute_roots,
        .a($shortrealtobits(a)),
        .b($shortrealtobits(b)),
        .c($shortrealtobits(c)),
        .roots_valid,
        .root_1(root_1_bits),
        .root_2(root_2_bits)
    );
    
    shortreal result_at_root_1;
    shortreal result_at_root_2;
    assign result_at_root_1 = a * root_1 * root_1 + b * root_1 + c;
    assign result_at_root_2 = a * root_2 * root_2 + b * root_2 + c;

    initial begin
        $monitor("%1t]] a: %2.8f, b: %2.8f, c: %2.8f, roots_valid: %d, root_1: %2.8f, root_2: %2.8f, result_at_root_1: %2.8f, result_at_root_2: %2.8f",
            $time, a, b, c, roots_valid, root_1, root_2, result_at_root_1, result_at_root_2
        );
        repeat(20) @(posedge clk);
        a <= 3.0;
        b <= -2.0;
        c <= -5.0;
        compute_roots <= 1'b1;
        @(posedge clk);
        compute_roots <= 1'b0;
        repeat(100) @(posedge clk);

        compute_roots <= 1'b1;
        a <= 3.0;
        b <= -2.0;
        c <= 5.0;
        @(posedge clk);
        compute_roots <= 1'b0;
        repeat(100) @(posedge clk);

        compute_roots <= 1'b1;
        a <= -3.0;
        b <= 2.0;
        c <= 5.0;
        @(posedge clk);
        compute_roots <= 1'b0;
        repeat(100) @(posedge clk);

        $finish();
    end

endmodule
