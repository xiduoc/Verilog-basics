module encoder_8to3_dataflow (
    input [7:0] d,
    output [2:0] y,
    output valid
);

    assign valid = |d;

    assign y = (d[7]) ? 3'b111 :
               (d[6]) ? 3'b110 :
               (d[5]) ? 3'b101 :
               (d[4]) ? 3'b100 :
               (d[3]) ? 3'b011 :
               (d[2]) ? 3'b010 :
               (d[1]) ? 3'b001 :
               (d[0]) ? 3'b000 :
                         3'b000; // Default case when no input is active

endmodule