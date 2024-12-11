module SimpleVectorMultiply_tb;

logic clk;
logic [31:0] A1, A2, B1, B2, Result11, Result12, Result21, Result22;

SimpleVectorMultiply svm (
	.clk(clk),
	.A1(A1),
    .A2(A2),
    .B1(B1),
    .B2(B2),
    .Result11(Result11),
    .Result12(Result12),
    .Result21(Result21),
    .Result22(Result22)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,SimpleVectorMultiply_tb);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz clock
end

initial begin
    A1 = 0;
    A2 = 0;
    B1 = 0;
    B2 = 0;
    #20
    A1 = 3;
    A2 = 4;
    B1 = 5;
    B2 = 6;
    #20
    A1 = 6;
    A2 = 5;
    B1 = 4;
    B2 = 3;
    #20
    $finish;
end

endmodule