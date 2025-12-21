module decoder_2to4 (
    input  [1:0] a,
    input        en,
    output [3:0] y
);

    assign y = en ? (4'b0001 << a) : 4'b0000; 

endmodule

module decoder_3to8_hierarchical (
    input  [2:0] a,
    input        en,
    output [7:0] y
);

    wire en_low, en_high;
    assign en_low = en & ~a[2];
    assign en_high = en & a[2];

    decoder_2to4 dec_low (
        .a(a[1:0]),
        .en(en_low),
        .y(y[3:0])
    );

    decoder_2to4 dec_high (
        .a(a[1:0]),
        .en(en_high),
        .y(y[7:4])
    );

endmodule