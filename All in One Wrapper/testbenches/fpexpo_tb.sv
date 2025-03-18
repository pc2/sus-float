module fpexpo_tb; 

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
    fpexpo uut (
        .aclk(aclk),
        .value(value),
        .result(result)
    );

    initial begin
        #1000
        // Test case 1: 1,5
        value = 32'h3fc00000;
        #1000;

       
        $finish;
    end

endmodule