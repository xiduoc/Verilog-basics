module decoder_2to4_behavioral (
    input      [1:0] a,
    input            en,
    output reg [3:0] y
);

    always @(*) begin
        if (en) begin
            if (a == 2'b00)      y = 4'b0001;
            else if (a == 2'b01) y = 4'b0010;
            else if (a == 2'b10) y = 4'b0100;
            else if (a == 2'b11) y = 4'b1000;
        end
        else begin 
            y = 4'b0000;
        end
    end

endmodule   