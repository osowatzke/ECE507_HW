`timescale 1ns / 1ps

module ripple_carry_adder_tb();

  // Parameters
  parameter WIDTH = 4;

  // Inputs
  reg [WIDTH-1:0] a;
  reg [WIDTH-1:0] b;
  reg cin;

  // Outputs
  wire [WIDTH-1:0] sum;
  wire cout;

  // Test control
  integer num_tests;
  integer num_errors;

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
  always #5 clk = ~clk;

  // Test vectors
  integer i, j, k;

  initial begin

    // Enable waveform dumping for EPWave
    $dumpfile("dump.vcd");
    $dumpvars(0, ripple_carry_adder_tb);

    // Initialize inputs and test counters
    a = 0;
    b = 0;
    cin = 0;
    num_tests = 0;
    num_errors = 0;

    // Wait for global reset
    #100;

    // Test all combinations of inputs
    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        for (k = 0; k < 2; k = k + 1) begin
          a = i[WIDTH-1:0];
          b = j[WIDTH-1:0];
          cin = k;
          #10; // Wait for combinational logic to settle

          // Check UUT results
          // Increment error counter if any tests fail
          if ({cout, sum} != a + b + cin) begin
            $display("Error: a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout);
            num_errors = num_errors + 1;
          end

          // Increment number of tests run
          num_tests = num_tests + 1;
        end
      end
    end

    // Display overall results
    $display("Simulation completed");
    $display("Total tests run: %0d", num_tests);
    $display("Total errors: %0d", num_errors);
    if (num_errors == 0) begin
      $display("OVERALL RESULT: PASS");
    end else begin
      $display("OVERALL RESULT: FAIL");
    end

    // End simulation
    #100;
    $finish;
  end

  // Monitor changes
  initial begin
    $monitor("Time=%0t a=%b b=%b cin=%b sum=%b cout=%b",
             $time, a, b, cin, sum, cout);
  end

endmodule