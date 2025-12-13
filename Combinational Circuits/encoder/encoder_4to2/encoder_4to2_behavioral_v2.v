module encoder_4to2_behavioral_v2 (
    input [3:0] d,
    output reg [1:0] y,
    output valid
);

    assign valid = |d;

    always @(*) begin
        casez (d)
            4'b1???: y = 2'b11;
            4'b01??: y = 2'b10;
            4'b001?: y = 2'b01;
            4'b0001: y = 2'b00;
            default: y = 2'b00; // Default case when no input is active
        endcase
    end

endmodule