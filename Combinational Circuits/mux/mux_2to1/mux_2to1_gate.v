module mux_2to1_gate (
    input a,
    input b,
    input sel,
    output y
);
    wire not_sel;
    wire and_a;
    wire and_b;

    not (not_sel, sel);
    and (and_a, a, not_sel);
    and (and_b, b, sel);
    or (y, and_a, and_b);

endmodule