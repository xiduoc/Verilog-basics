module full_adder_behavioral_v2 (
    input  a,
    input  b,
    input  cin,
    output reg sum,
    output reg cout
);

    always @(*) begin
        {cout, sum} = a + b + cin;
    end

endmodule