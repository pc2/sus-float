
module fplog_tb; 

    reg aclk;
    
    
    initial begin
        aclk = 0;
        forever #10 aclk = ~aclk;  // 100 MHz clock
    end

    // Inputs to the module under test
    reg [31:0] value;
    // Output from the module under test
    wire [31:0] result;

    // Instantiate the module under test
    fplog uut (
        .aclk(aclk),
        .value(value),
        .result(result)
    );

    initial begin
        #1000;
      // Test case 1: ln(0)
        value = 32'h00000000;
        #1000;
      // Test case 2. ln(1.5)
        value = 32'h3fc00000;
        
        $finish;
    end

endmodule
