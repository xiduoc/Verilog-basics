module encoder_4to2_behavioral (
    input [3:0] d,
    output reg [1:0] y,
    output valid
);

    assign valid = |d;
    
    always @(*) begin
        if (d[3])      y = 2'b11;  // Priority to highest bit
        else if (d[2]) y = 2'b10;
        else if (d[1]) y = 2'b01;
        else if (d[0]) y = 2'b00;
        else           y = 2'b00; // Default case when no input is active
    end

endmodule     