module decoder_3to8_behavioral_v2 (
    input      [2:0] a,
    input            en,
    output reg [7:0] y
);

    always @(*) begin
        if (en) begin
            if (a == 3'b000)      y = 8'b00000001;
            else if (a == 3'b001) y = 8'b00000010;
            else if (a == 3'b010) y = 8'b00000100;
            else if (a == 3'b011) y = 8'b00001000;
            else if (a == 3'b100) y = 8'b00010000;
            else if (a == 3'b101) y = 8'b00100000;
            else if (a == 3'b110) y = 8'b01000000;
            else                  y = 8'b10000000;
        end else begin
            y = 8'b00000000;
        end
    end

endmodule