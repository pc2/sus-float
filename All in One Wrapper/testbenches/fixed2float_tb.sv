module fixed2float_tb; 

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
    fixed2float uut (
        .aclk(aclk),
        .value(value),
        .result(result)
    );

    initial begin
        #200
        // Test case 1: +7.77
        value = 32'h40f8a3d7;
        #200;

        // Test case 2: -7.77
        value = 32'hc0f8a3d7;
        #200;

        $finish;
    end

endmodule