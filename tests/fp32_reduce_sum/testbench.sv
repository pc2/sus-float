module fp32_reduce_sum_tb;
    // Clocks
    logic clk = 0;
    initial #0 forever #5 clk = !clk;

    // Ports
    // {clk} input bool #() acc'0
    logic acc;
    // {clk} input float #() v'0
    logic[31:0] v;
    // {clk} input bool #() last'0
    logic last;
    // {clk} output float #() total'66
    wire[31:0] total;
    // {clk} input bool #() rst'0
    logic rst = 1;

    localparam LATENCY = 66;

    // DUT
    fp32_reduce_sum dut(
        .clk(clk),
        .acc(acc),
        .v(v),
        .last(last),
        .total(total),
        .rst(rst)
    );

    shortreal v_float = 1.0;
    assign v = $shortrealtobits(v_float);
    shortreal expected_sum = 0.0;
    
    typedef struct {
        shortreal expected;
        bit last;
    } DelayExpected;
    DelayExpected expected_delayed_shiftreg[LATENCY-1:0];
    
    shortreal saved_expected_sum;
    shortreal saved_expected_sum_last;
    assign saved_expected_sum = expected_delayed_shiftreg[LATENCY - 1].expected;
    assign saved_expected_sum_last = expected_delayed_shiftreg[LATENCY - 1].last;
    shortreal difference;
    assign difference = saved_expected_sum - $bitstoshortreal(total);
    always @(posedge clk) begin
        for(integer i = 0; i < LATENCY; i++) begin
            expected_delayed_shiftreg[i+1] <= expected_delayed_shiftreg[i];
        end
        
        if(acc) begin
            if(last) begin
                expected_delayed_shiftreg[0].expected <= expected_sum + v_float;
                expected_delayed_shiftreg[0].last <= 1;
        
                expected_sum <= 0.0;
            end else begin
                expected_delayed_shiftreg[0].expected <= 'x;
                expected_delayed_shiftreg[0].last <= 0;
                
                expected_sum <= expected_sum + v_float;
            end
        end else begin
            expected_delayed_shiftreg[0].expected <= 'x;
            expected_delayed_shiftreg[0].last <= 0;
        end
        
        if(saved_expected_sum_last) begin
            if(difference >= -0.001 && difference <= 0.001) begin
                $info("Total Sum %f matches the expected sum %f", $bitstoshortreal(total), saved_expected_sum);
            end else begin
                $fatal("Total Sum %f doesn't match the expected sum %f", $bitstoshortreal(total), saved_expected_sum);
            end
        end
    end
    
    task run_series(input int length);
        acc <= 1;
        v_float <= $itor($random % 2000);
        last <= 0;
        repeat(length-1) begin
            @(posedge clk);
            v_float <= $itor($random % 2000);
        end
        last <= 1;
        @(posedge clk);
        acc <= 0;
        last <= 0;
        v_float <= -2000.0;
    endtask
    
    initial begin
        acc <= 0;
        last <= 0;
        repeat(100) @(posedge clk);
        rst <= 0;
        
        v_float <= -2000.0;
        repeat(5) @(posedge clk);
        
        acc <= 1;
        v_float <= 1.0;
        repeat(19) @(posedge clk);
        last <= 1;
        @(posedge clk);
        acc <= 0;
        last <= 0;
        v_float <= -2000.0;

        
        repeat(80) @(posedge clk);
        
        for(int length = 1; length < 40; length++) begin
            run_series(length);
        end
        
        for(int length = 1; length < 40; length++) begin
            run_series(length);
            run_series(1);
            run_series(1);
            run_series(1);
            run_series(1);
            run_series(1);
            run_series(1);
        end
        
        repeat(100) @(posedge clk);
        $finish();
    end
endmodule // fp32_reduce_sum_tb
