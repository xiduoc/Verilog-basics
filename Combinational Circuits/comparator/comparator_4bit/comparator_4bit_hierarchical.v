module comparator_2bit (
    input [1:0] a,
    input [1:0] b,
    output a_greater,
    output a_equal,
    output a_less
);

    assign a_greater = (a > b);
    assign a_equal   = (a == b);
    assign a_less    = (a < b);

endmodule

module comparator_4bit_hierarchical (
    input [3:0] a,
    input [3:0] b,
    output a_greater,
    output a_equal,
    output a_less
);

    wire gt_high, eq_high, lt_high;
    wire gt_low, eq_low, lt_low;

    comparator_2bit comp_high (
        .a(a[3:2]),
        .b(b[3:2]),
        .a_greater(gt_high),
        .a_equal(eq_high),
        .a_less(lt_high)
    );

    comparator_2bit comp_low (
        .a(a[1:0]),
        .b(b[1:0]),
        .a_greater(gt_low),
        .a_equal(eq_low),
        .a_less(lt_low)
    );

    assign a_greater = gt_high | (eq_high & gt_low);
    assign a_equal   = eq_high & eq_low;
    assign a_less    = lt_high | (eq_high & lt_low);

endmodule