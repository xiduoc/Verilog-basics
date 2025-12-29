`timescale 1ns / 1ps

module D_flipflop_tb;

    reg clk;
    reg d;
    wire q;

    D_flipflop dut (.clk(clk), .d(d), .q(q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        d = 0;

        $monitor("Time=%0d | clk=%b d=%b -> q=%b", $time, clk, d, q);

        #12 d = 1;
        #10 d = 0;
        #5  d = 1;
        #5  d = 0;
        #10 d = 1;

        #10 $display("Testbench completed.");
        $finish;
    end

    initial begin
        $dumpfile("D_flipflop.vcd");
        $dumpvars(0, D_flipflop_tb);
    end
    
endmodule