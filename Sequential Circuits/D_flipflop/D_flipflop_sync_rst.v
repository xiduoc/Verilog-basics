module D_flipflop_sync_rst (
    input clk, rst, d,
    output reg q
);

    always @(posedge clk) begin
        if (rst) begin
            q <= 1'b0;
        end
        else begin
            q <= d;
        end
    end

endmodule