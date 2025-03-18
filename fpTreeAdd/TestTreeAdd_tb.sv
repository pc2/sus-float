module TestTreeAdd_tb;

reg clk;
reg start;
reg[31:0]  Array[9:0];
wire[31:0] Result;

TestTreeAdd uut(
	.clk(clk),
    .start(start),
	.Array(Array),
	.Result(Result)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,TestTreeAdd_tb);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz clock
end

initial begin
    #10
    start = 0;
    #10
    /*    
    // 1.2 -> 00111111100110011001100110011010
    Array[0][0] = 1; Array[0][1] = 0; Array[0][2] = 0; Array[0][3] = 1;
    Array[0][4] = 1; Array[0][5] = 1; Array[0][6] = 1; Array[0][7] = 1;
    Array[0][8] = 0; Array[0][9] = 0; Array[0][10] = 1; Array[0][11] = 1;
    Array[0][12] = 0; Array[0][13] = 0; Array[0][14] = 1; Array[0][15] = 1;
    Array[0][16] = 0; Array[0][17] = 1; Array[0][18] = 1; Array[0][19] = 0;
    Array[0][20] = 0; Array[0][21] = 1; Array[0][22] = 1; Array[0][23] = 0;
    Array[0][24] = 1; Array[0][25] = 1; Array[0][26] = 0; Array[0][27] = 1;
    Array[0][28] = 1; Array[0][29] = 0; Array[0][30] = 1; Array[0][31] = 0;

    // 1.4 -> 00111111101100110011001100110011
    Array[1][0] = 0; Array[1][1] = 0; Array[1][2] = 1; Array[1][3] = 1;
    Array[1][4] = 1; Array[1][5] = 1; Array[1][6] = 1; Array[1][7] = 1;
    Array[1][8] = 0; Array[1][9] = 0; Array[1][10] = 1; Array[1][11] = 1;
    Array[1][12] = 0; Array[1][13] = 0; Array[1][14] = 1; Array[1][15] = 1;
    Array[1][16] = 0; Array[1][17] = 1; Array[1][18] = 1; Array[1][19] = 0;
    Array[1][20] = 0; Array[1][21] = 1; Array[1][22] = 1; Array[1][23] = 0;
    Array[1][24] = 1; Array[1][25] = 1; Array[1][26] = 0; Array[1][27] = 1;
    Array[1][28] = 1; Array[1][29] = 0; Array[1][30] = 1; Array[1][31] = 1;

    // 1.8 -> 00111111110011001100110011001100
    Array[2][0] = 0; Array[2][1] = 0; Array[2][2] = 1; Array[2][3] = 1;
    Array[2][4] = 1; Array[2][5] = 1; Array[2][6] = 1; Array[2][7] = 1;
    Array[2][8] = 0; Array[2][9] = 0; Array[2][10] = 1; Array[2][11] = 1;
    Array[2][12] = 0; Array[2][13] = 0; Array[2][14] = 1; Array[2][15] = 1;
    Array[2][16] = 0; Array[2][17] = 1; Array[2][18] = 1; Array[2][19] = 0;
    Array[2][20] = 0; Array[2][21] = 1; Array[2][22] = 1; Array[2][23] = 0;
    Array[2][24] = 1; Array[2][25] = 1; Array[2][26] = 0; Array[2][27] = 1;
    Array[2][28] = 1; Array[2][29] = 0; Array[2][30] = 1; Array[2][31] = 0;

    // 1.9 -> 00111111111001100110011001100110
    Array[3][0] = 0; Array[3][1] = 0; Array[3][2] = 1; Array[3][3] = 1;
    Array[3][4] = 1; Array[3][5] = 1; Array[3][6] = 1; Array[3][7] = 1;
    Array[3][8] = 0; Array[3][9] = 0; Array[3][10] = 1; Array[3][11] = 1;
    Array[3][12] = 0; Array[3][13] = 0; Array[3][14] = 1; Array[3][15] = 1;
    Array[3][16] = 0; Array[3][17] = 1; Array[3][18] = 1; Array[3][19] = 0;
    Array[3][20] = 0; Array[3][21] = 1; Array[3][22] = 1; Array[3][23] = 0;
    Array[3][24] = 1; Array[3][25] = 1; Array[3][26] = 0; Array[3][27] = 1;
    Array[3][28] = 1; Array[3][29] = 0; Array[3][30] = 1; Array[3][31] = 1;
    */
    Array[0] = 32'h3f8ccccd; // 1.1
    Array[1] = 32'h40066666; // 2.1
    Array[2] = 32'h3fc00000; // 1.5
    Array[3] = 32'h40400000; // 3.0
    Array[4] = 32'h3f99999a; // 1.2
    Array[5] = 32'h40a00000; // 5.0
    Array[6] = 32'h3f800000; // 1.0
    Array[7] = 32'h40200000; // 2.5
    Array[8] = 32'h3fcccccd; // 1.6
    Array[9] = 32'h4083f35c; // 4.123456789 -> result should be 23.123456789
    start = 1;
    #480
    $finish;
end

endmodule