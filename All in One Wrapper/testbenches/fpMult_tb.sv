module fpMult_tb;

    reg aclk;

initial begin 
    aclk = 0;
    forever #10 aclk = ~aclk;
end

    //Inputs to the module under test
    reg[31:0] value1;
    reg[31:0] value2;
    //Output from the module under test
    wire [31:0] result;

    // Initiate the module under test
    fpMult uut (
        .aclk(aclk),
        .value1(value1),
        .value2(value2),
        .result(result)       
    );

    initial begin 
        #220;
        // Test case 1: 1,5 x 1,5
        value1 = 32'h3fc00000;
        value2 = 32'h3fc00000;
        #220;

        // Test case 2: -3,5 x 2,5
        value1 = 32'hc0600000;
        value2 = 32'h40200000;
        #220;
        
        $finish;
    end

endmodule