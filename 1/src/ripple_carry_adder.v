module ripple_carry_adder #(
    parameter WIDTH = 4 // Parameterized width, defaulted to 4
)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input cin,
    output [WIDTH-1:0] sum,
    output cout
);

    // Create wire with enough bits for each carry in the design
    // 1 bit for input, WIDTH bits for carry output of each full adder
    wire [WIDTH:0] carry;

    // Assign the input carry bit and extract output carry bit
    assign carry[0] = cin;
    assign cout = carry[WIDTH];

    // Generate a full adder for each bit
    // Carry bit is passed from stage output to input of next stage
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : full_adder_loop
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

endmodule

// Full adder module
module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    // Sum of 2 1-bit numbers is 2 bits wide. sum is LSB and cout is MSB.
    // Sum is expressed with XORs (Extension of adder without input carry bit).
    // Carry bit is high if both a and b or 1 or if carry is 1 and either a or b is 1.
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule