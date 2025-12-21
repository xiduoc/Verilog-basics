module decoder_3to8_generate (
    input  [2:0] a,
    input        en,
    output [7:0] y
);

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_decoder
            assign y[i] = en & (a == i);
        end
    endgenerate

endmodule