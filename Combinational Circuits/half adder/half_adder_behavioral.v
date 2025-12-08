module half_adder_behavioral (
    input a,
    input b,
    output reg sum,
    output reg carry
);

    always @(*) begin
        sum = a ^ b;
        carry = a & b;
    end

endmodule