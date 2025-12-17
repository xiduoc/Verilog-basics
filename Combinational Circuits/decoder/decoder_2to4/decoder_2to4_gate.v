module decoder_2to4_gate (
    input      [1:0] a,
    input            en,
    output     [3:0] y
);

    wire a0_n, a1_n;
    not (a0_n, a[0]);
    not (a1_n, a[1]);

    and (y[0], en, a1_n, a0_n); // 00
    and (y[1], en, a1_n, a[0]); // 01
    and (y[2], en, a[1], a0_n); // 10
    and (y[3], en, a[1], a[0]); // 11

endmodule