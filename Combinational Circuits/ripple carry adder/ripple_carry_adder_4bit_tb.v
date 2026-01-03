`timescale 1ns / 1ps

module ripple_carry_adder_4bit_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    ripple_carry_adder_4bit dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin

        $monitor("Time=%0d | a=%b b=%b cin=%b -> sum=%b cout=%b", $time, a, b, cin, sum, cout);

        a = 4'b0000; b = 4'b0000; cin = 0;
        #10 a = 4'b0011; b = 4'b0101; cin = 0;
        #10 a = 4'b1111; b = 4'b0001; cin = 0;
        #10 a = 4'b1010; b = 4'b0101; cin = 1;
        #10 a = 4'b1111; b = 4'b1111; cin = 1;
        #10 a = 4'b0001; b = 4'b0010; cin = 0;
        #10 a = 4'b0110; b = 4'b1001; cin = 1;
        #10 a = 4'b1111; b = 4'b0000; cin = 1;

        #10 $display("Testbench completed.");
        $finish;
    end

    initial begin
        $dumpfile("ripple_carry_adder_4bit.vcd");
        $dumpvars(0, ripple_carry_adder_4bit_tb);
    end

endmodule