module half_adder (
    input  a,
    input  b,
    output sum,
    output carry
);

    assign sum = a ^ b;
    assign carry = a & b;

endmodule

// Full adder từ 2 half adders
module full_adder_structural (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    wire ha1_sum, ha1_carry, ha2_carry;

    // half adder 1: a + b
    half_adder ha1 (
        .a(a),
        .b(b),
        .sum(ha1_sum),
        .carry(ha1_carry)
    );

    // half adder 2: (a + b) + cin
    half_adder ha2 (
        .a(ha1_sum),
        .b(cin),
        .sum(sum),
        .carry(ha2_carry)
    ); 

    assign cout = ha1_carry | ha2_carry;

endmodule