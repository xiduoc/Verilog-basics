`timescale 1ns/1ps

module half_adder_behavioral_tb;

    reg a;
    reg b;
    wire sum;
    wire carry;

    half_adder_behavioral uut (
        .a(a),
        .b(b),
        .sum(sum), 
        .carry(carry)   
    );

    initial begin
        a = 0; b = 0;

        $monitor("Time=%0t | a=%b b=%b | sum=%b carry=%b", $time, a, b, sum, carry);

        #10 a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;

        #10 $display("Test completed.");
        $finish;
    end

    initial begin
        $dumpfile("half_adder_behavioral.vcd");
        $dumpvars(0, half_adder_behavioral_tb);
    end

endmodule