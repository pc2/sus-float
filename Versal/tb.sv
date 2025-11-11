`timescale 1ns / 1ps




module ComputeRoots_tb;
    logic clk = 0;
    always #5 clk = !clk;
    
    logic compute_roots = 0;
    logic[31:0] a;
    logic[31:0] b;
    logic[31:0] c;
    logic roots_valid;
    logic[31:0] root_1;
    logic[31:0] root_2;
    ComputeRoots computer(
        .clk,
        .compute_roots,
        .a,
        .b,
        .c,
        .roots_valid,
        .root_1,
        .root_2
    );
    
    initial begin
        repeat(20) @(posedge clk);
        a <= $shortrealtobits(3.0);
        b <= $shortrealtobits(-2.0);
        c <= $shortrealtobits(-5.0);
        compute_roots <= 1'b1;
        @(posedge clk);
        compute_roots <= 1'b0;
        repeat(40) @(posedge clk);

        compute_roots <= 1'b1;
        c <= $shortrealtobits(5.0);
        @(posedge clk);
        compute_roots <= 1'b0;
        repeat(40) @(posedge clk);
    end

endmodule

