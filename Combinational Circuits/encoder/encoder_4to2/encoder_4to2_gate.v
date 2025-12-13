module encoder_4to2_gate (
    input [3:0] d,
    output [1:0] y,
    output valid
);

    wire notd2;
    wire andd1_notd2;
    
    not n0 (notd2, d[2]);
    and a0 (andd1_notd2, d[1], notd2);
    // y[0] = d[3] + (d[1] & ~d[2])
    or g0 (y[0], andd1_notd2, d[3]);
    // y[1] = d[2] + d[3]
    or g1 (y[1], d[2], d[3]);

    or v (valid, d[0], d[1], d[2], d[3]);
    
endmodule