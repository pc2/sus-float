module fpGreater_equal_tb;
    
    reg aclk;
    
    
initial begin
    aclk = 0;
    forever #10 aclk = ~aclk;  // 100 MHz clock
end
    
    // Inputs to the module under test
    reg [31:0] value1;
    reg [31:0] value2;
    // Output from the module under test
    wire [31:0] result;

    // Instantiate the module under test
    fpGreater_equal uut (
        .aclk(aclk),
        .value1(value1),
        .value2(value2),
        .result(result)
    );

    initial begin
        #100
        // Test case 1: 1.5 >= 2.5 
        value1 = 32'h3fc00000;
        value2 = 32'h40200000;
        #100;

        // Test case 2: 1.5 >= 1.5 
        value1 = 32'h3fc00000;
        value2 = 32'h3fc00000;
        #100;

        // Test case 3: 2.5 >= 1.5
        value1 = 32'h40200000;
        value2 = 32'h3fc00000;
        #100;

        $finish;
    end

endmodule
