module full_adder_behavioral (
    input  a,
    input  b,
    input  cin,
    output reg sum,
    output reg cout
);

    always @(*) begin
        sum = a ^ b ^ cin;
        cout = (a & b) | (b & cin) | (a & cin);
    end

endmodule