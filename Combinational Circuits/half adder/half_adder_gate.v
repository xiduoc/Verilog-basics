module half_adder_gate (
    input  a,
    input  b,
    output sum,
    output carry
);

    xor u1 (sum, a, b);
    and u2 (carry, a, b);

endmodule