module decoder_2to4_generate (
    input  [1:0] a,
    input        en,
    output [3:0] y
);

    genvar i;
    generate 
        for (i = 0; i < 4; i = i + 1) begin : gen_decoder
            assign y[i] = en & (a == i);
        end
    endgenerate

endmodule