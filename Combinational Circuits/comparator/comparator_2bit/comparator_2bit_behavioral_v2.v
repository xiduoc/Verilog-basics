module comparator_2bit_behavioral_v2 (
    input [1:0] a,
    input [1:0] b,
    output reg a_greater,
    output reg a_equal,
    output reg a_less
);

    always @(*) begin
        a_greater = 1'b0;
        a_equal   = 1'b0;
        a_less    = 1'b0;

        case ({a, b}) 
            // a = 00
            4'b0000: a_equal = 1'b1; // 0 == 0
            4'b0001: a_less  = 1'b1; // 0 < 1
            4'b0010: a_less  = 1'b1; // 0 < 2
            4'b0011: a_less  = 1'b1; // 0 < 3
            // a = 01
            4'b0100: a_greater = 1'b1; // 1 > 0
            4'b0101: a_equal = 1'b1; // 1 == 1
            4'b0110: a_less  = 1'b1; // 1 < 2
            4'b0111: a_less  = 1'b1; // 1 < 3
            // a = 10
            4'b1000: a_greater = 1'b1; // 2 > 0
            4'b1001: a_greater = 1'b1; // 2 > 1
            4'b1010: a_equal = 1'b1; // 2 == 2
            4'b1011: a_less  = 1'b1; // 2 < 3
            // a = 11
            4'b1100: a_greater = 1'b1; // 3 > 0
            4'b1101: a_greater = 1'b1; // 3 > 1
            4'b1110: a_greater = 1'b1; // 3 > 2
            4'b1111: a_equal = 1'b1; // 3 == 3
        endcase
    end

endmodule