`timescale 1ns / 1ps

module ripple_carry_adder_tb;

    // Parameters
    parameter WIDTH = 4;

    // Inputs
    reg [WIDTH-1:0] a;
    reg [WIDTH-1:0] b;
    reg cin;

    // Outputs
    wire [WIDTH-1:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    ripple_carry_adder #(
        .WIDTH(WIDTH)
    ) uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;  // 100MHz clock

    // Test vector generation and checking
    integer i, j, k;
    reg [WIDTH:0] expected_sum;

    initial begin
        // Initialize inputs
        a = 0;
        b = 0;
        cin = 0;

        // Wait for global reset
        #100;

        // Test all possible input combinations
        for (i = 0; i < (1 << WIDTH); i = i + 1) begin
            for (j = 0; j < (1 << WIDTH); j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    a = i;
                    b = j;
                    cin = k;
                    #10; // Wait for outputs to settle

                    // Calculate expected sum
                    expected_sum = a + b + cin;

                    // Check output
                    if ({cout, sum} !== expected_sum) begin
                        $display("Error at time %0t: a=%b, b=%b, cin=%b, sum=%b, cout=%b (expected %b)", 
                                 $time, a, b, cin, sum, cout, expected_sum);
                    end else begin
                        $display("Correct at time %0t: a=%b, b=%b, cin=%b, sum=%b, cout=%b", 
                                 $time, a, b, cin, sum, cout);
                    end
                end
            end
        end

        // Test complete
        $display("Test complete");
        $finish;
    end

    // Optional: Waveform generation
    initial begin
        $dumpfile("ripple_carry_adder_tb.vcd");
        $dumpvars(0, ripple_carry_adder_tb);
    end

endmodule