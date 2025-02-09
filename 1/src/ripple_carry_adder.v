module ripple_carry_adder #(
    parameter WIDTH = 4 // Parameterized width, defaulted to 4
)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input cin,
    output [WIDTH-1:0] sum,
    output cout
);

    // Carry wire contains WIDTH bits for the carry input of each full adder.
    // It also contains an additional bit for the output carry.
    wire [WIDTH:0] carry;

    // Assign the input carry bit and extract output carry bit
    assign carry[0] = cin;
    assign cout = carry[WIDTH];

    // Generate a full adder for each bit. Carry bit is passed
    // from output of i-th full adder into input of the (i+1) full adder.
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
    // xor is the same as a modulo 2 add (1 if only if only one input is 1).
    // sum can be completed described using XORs (modulo 2 addition of all inputs).
    // cout is 1 if both a+b=2 or if carry is 1 and a+b=1.
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule