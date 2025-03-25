module fpMatrixMultiply_tb;

reg clk;
reg start;
reg[31:0] Matrix1[3:0][4:0];
reg[31:0] Matrix2[4:0][2:0];
wire[31:0] Result[3:0][2:0];

TestMatrixMultiply uut(
	.clk(clk),
    .start(start),
	.Matrix1(Matrix1),
    .Matrix2(Matrix2),
	.Result(Result)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,fpMatrixMultiply_tb);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz clock
end

initial begin
    #10
    start = 0;
    #10
    Matrix1[0][0] = 32'h40066666;  Matrix1[0][1] = 32'hbf800000;  Matrix1[0][2] = 32'h3e99999a;  Matrix1[0][3] = 32'h4059999a;  Matrix1[0][4] = 32'hc0866666;
    Matrix1[1][0] = 32'h404ccccd;  Matrix1[1][1] = 32'hc00ccccd;  Matrix1[1][2] = 32'h40066666;  Matrix1[1][3] = 32'h3f800000;  Matrix1[1][4] = 32'h3e99999a;
    Matrix1[2][0] = 32'hbfa66666;  Matrix1[2][1] = 32'h40466666;  Matrix1[2][2] = 32'hbf99999a;  Matrix1[2][3] = 32'hc019999a;  Matrix1[2][4] = 32'hc0833333;
    Matrix1[3][0] = 32'h40533333;  Matrix1[3][1] = 32'h4059999a;  Matrix1[3][2] = 32'hc0866666;  Matrix1[3][3] = 32'h400ccccd;  Matrix1[3][4] = 32'hc0133333;

    Matrix2[0][0] = 32'h400ccccd;  Matrix2[0][1] = 32'h40133333;  Matrix2[0][2] = 32'h404ccccd;
    Matrix2[1][0] = 32'hc0066666;  Matrix2[1][1] = 32'hbf99999a;  Matrix2[1][2] = 32'h400ccccd;
    Matrix2[2][0] = 32'h4059999a;  Matrix2[2][1] = 32'h40833333;  Matrix2[2][2] = 32'h3fa66666;
    Matrix2[3][0] = 32'hc059999a;  Matrix2[3][1] = 32'h40800000;  Matrix2[3][2] = 32'h3e99999a;
    Matrix2[4][0] = 32'h3fa66666;  Matrix2[4][1] = 32'hc059999a;  Matrix2[4][2] = 32'h40833333;
    start = 1;
    #5000
    $finish;
end

endmodule