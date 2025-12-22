module mux_4to1_dataflow_v3 (
    input a, b, c, d,
    input [1:0] sel,
    output y
);

    wire [3:0] data;
    assign data = {d, c, b, a};
    assign y = data[sel];

endmodule