module mux_2to1_behavioral (
    input a,
    input b,
    input sel,
    output reg y
);

    always @(*) begin
        if (sel) begin
            y = b;
        end else begin
            y = a;
        end
    end

endmodule