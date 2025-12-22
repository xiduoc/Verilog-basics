module mux_4to1_gate (
    input a, b, c, d,
    input [1:0] sel,
    output y
);
    wire not_sel0, not_sel1;
    wire and_a, and_b, and_c, and_d;

    not (not_sel0, sel[0]);
    not (not_sel1, sel[1]);

    and (and_a, a, not_sel1, not_sel0);
    and (and_b, b, not_sel1, sel[0]);
    and (and_c, c, sel[1], not_sel0);
    and (and_d, d, sel[1], sel[0]);

    or (y, and_a, and_b, and_c, and_d);

endmodule