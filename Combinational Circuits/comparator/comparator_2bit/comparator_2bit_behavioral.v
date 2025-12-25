module comparator_2bit_behavioral (
    input [1:0] a,
    input [1:0] b,
    output reg a_greater,
    output reg a_equal,
    output reg a_less
);

    always @(*) begin
        if (a > b) begin
            a_greater = 1'b1;
            a_equal = 1'b0;
            a_less = 1'b0;
        end
        else if (a == b) begin
            a_greater = 1'b0;
            a_equal = 1'b1;
            a_less = 1'b0;
        end
        else begin
            a_greater = 1'b0;
            a_equal = 1'b0;
            a_less = 1'b1;
        end
    end

endmodule