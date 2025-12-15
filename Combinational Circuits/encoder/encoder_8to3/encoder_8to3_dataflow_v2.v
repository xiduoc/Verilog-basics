module encoder_8to3_dataflow_v2 (
    input [7:0] d,
    output [2:0] y,
    output valid
);

    assign valid = |d;

    assign y[2] = d[7] | d[6] | d[5] | d[4];

    assign y[1] = d[7] | d[6] | 
                  (d[3] & ~d[4] & ~d[5]) |
                  (d[2] & ~d[4] & ~d[5]);

    assign y[0] = d[7] |
                  (d[5] & ~d[6]) |
                  (d[3] & ~d[4] & ~d[5] & ~d[6]) |
                  (d[1] & ~d[2] & ~d[3] & ~d[4] & ~d[5] & ~d[6]);

endmodule