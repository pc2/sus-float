module FpAddTestBench;
    
    reg clk;
    
    
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz clock
end
    
    // Inputs to the module under test
    reg [31:0] a;
    reg [31:0] b;
    // Output from the module under test
    wire [31:0] result;

    // Instantiate the module under test
    fp_add_test uut (
        .clk(clk),
        .A1(a),
        .B1(b),
        .Result(result)
    );

    initial begin
        // Test case 1: 1.5 + 2.5 = 4.0
        a = 32'h3fc00000;
        b = 32'h40200000;
        #10;

        // Test case 2: -1.5 + 1.5 = 0.0
        a = 32'hfc00000;
        b = 32'h3fc00000;
        #1000;

        $finish;
    end

endmodule
