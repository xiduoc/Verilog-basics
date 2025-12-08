module full_adder_arthmetic (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    wire [1:0]  result;

    assign result = a + b + cin;
    assign sum = result[0];
    assign cout = result[1];

endmodule