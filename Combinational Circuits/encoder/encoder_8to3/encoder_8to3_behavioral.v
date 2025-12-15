module encoder_8to3_behavioral (
    input [7:0] d,
    output reg [2:0] y,
    output valid
);

    assign valid = |d;

    always @(*) begin
        if(d[7])       y = 3'b111;  // Priority to highest bit
        else if(d[6])  y = 3'b110;
        else if(d[5])  y = 3'b101;
        else if(d[4])  y = 3'b100;
        else if(d[3])  y = 3'b011;
        else if(d[2])  y = 3'b010;
        else if(d[1])  y = 3'b001;
        else if(d[0])  y = 3'b000;
        else           y = 3'b000; // Default case when no input is active
    end

endmodule