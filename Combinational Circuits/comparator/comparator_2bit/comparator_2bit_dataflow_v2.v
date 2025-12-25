module comparator_2bit_dataflow_v2 (
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