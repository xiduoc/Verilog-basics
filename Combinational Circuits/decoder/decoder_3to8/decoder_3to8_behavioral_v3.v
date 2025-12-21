module decoder_3to8_behavioral_v3 (
    input      [2:0] a,
    input            en,
    output reg [7:0] y
);

    always @(*) begin
        y = 8'b00000000;
        if (en) begin
            for (integer i = 0; i < 8; i = i + 1) begin
                if (a == i)
                    y[i] = 1'b1;
            end
        end
    end

endmodule