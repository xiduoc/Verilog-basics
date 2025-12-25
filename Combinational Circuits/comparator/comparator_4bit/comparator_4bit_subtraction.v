module comparator_4bit_subtraction (
    input [3:0] a,
    input [3:0] b,
    output a_greater,
    output a_equal,
    output a_less
);

    wire [4:0] diff;
    assign diff = {1'b0, a} - {1'b0, b};

    assign a_greater = ~diff[4] & (|diff[3:0]);
    assign a_equal   = (diff[3:0] == 4'b0000);
    assign a_less    = diff[4];

endmodule