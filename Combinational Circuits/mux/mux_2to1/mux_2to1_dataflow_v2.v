module mux_2to1_dataflow_v2 (
    input a,
    input b,
    input sel,
    output y
);
    assign y = (sel & b) | (~sel & a);

endmodule