module FpAddTestBench;
    
    reg aclk;
    
    
initial begin
    aclk = 0;
    forever #10 aclk = ~aclk;  // 100 MHz clock
end
    
    // Inputs to the module under test
    reg [31:0] a;
    reg [31:0] b;
    // Output from the module under test
    wire [31:0] result;

    // Instantiate the module under test
    fp_add_test uut (
        .aclk(aclk),
        .A1(a),
        .B1(b),
        .Result(result)
    );

    initial begin
        #220
        // Test case 1: 1.5 + 2.5 = 4.0
        a = 32'h3fc00000;
        b = 32'h40200000;
        #220;

        // Test case 2: -1.5 + 1.5 = 0.0
        a = 32'hbfc00000;
        b = 32'h3fc00000;
        #220;

        a = 32'h3fc00000;
        b = 32'h3fc00000;
        #220;

        $finish;
    end

endmodule
