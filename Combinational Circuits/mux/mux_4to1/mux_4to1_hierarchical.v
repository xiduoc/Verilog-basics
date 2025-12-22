module mux_4to1_hierarchical (
    input a, b, c, d,
    input [1:0] sel,
    output y
);

    wire y_ab, y_cd;

    // Layer 1: 2 Mux 2-to-1
    assign y_ab = (sel[0]) ? b : a;
    assign y_cd = (sel[0]) ? d : c;

    // Layer 2: 1 Mux 2-to-1
    assign y = (sel[1]) ? y_cd : y_ab;

endmodule