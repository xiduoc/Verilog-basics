module comparator_4bit_dataflow_v2 (
    input [3:0] a,
    input [3:0] b,
    output a_greater,
    output a_equal,
    output a_less
);

    assign a_greater = (a > b);
    assign a_equal   = (a == b);
    assign a_less    = (a < b);

endmodule