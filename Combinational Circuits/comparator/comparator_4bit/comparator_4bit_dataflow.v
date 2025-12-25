module comparator_4bit_dataflow (
    input [3:0] a,
    input [3:0] b,
    output a_greater,
    output a_equal,
    output a_less
);

    assign a_greater = (a > b) ? 1'b1 : 1'b0;
    assign a_equal   = (a == b) ? 1'b1 : 1'b0;
    assign a_less    = (a < b) ? 1'b1 : 1'b0;

endmodule