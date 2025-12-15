module encoder_8to3_behavioral_v2 (
    input [7:0] d,
    output reg [2:0] y,
    output valid
);

    assign valid = |d;

    always @(*) begin
        casez (d)
            8'b1???????: y = 3'b111; // Priority to highest bit
            8'b01??????: y = 3'b110;
            8'b001?????: y = 3'b101;
            8'b0001????: y = 3'b100;
            8'b00001???: y = 3'b011;
            8'b000001??: y = 3'b010;
            8'b0000001?: y = 3'b001;
            8'b00000001: y = 3'b000;
            default:     y = 3'b000; // Default case when no input is active
        endcase
    end

endmodule