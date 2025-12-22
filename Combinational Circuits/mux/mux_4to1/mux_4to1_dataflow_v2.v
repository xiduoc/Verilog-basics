module mux_4to1_dataflow_v2 (
    input a, b, c, d,
    input [1:0] sel,
    output y
);

    assign y = (a & ~sel[1] & ~sel[0]) |
               (b & ~sel[1] & sel[0])  |
               (c & sel[1] & ~sel[0])  |
               (d & sel[1] & sel[0]);

endmodule