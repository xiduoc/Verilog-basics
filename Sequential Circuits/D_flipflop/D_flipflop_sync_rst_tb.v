`timescale 1ns / 1ps

module D_flipflop_sync_rst_tb;

    reg clk;
    reg rst;
    reg d;
    wire q;

    D_flipflop_sync_rst dut (.clk(clk), .rst(rst), .d(d), .q(q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        d = 0;

        $monitor("Time=%0d | clk=%b rst=%b d=%b -> q=%b", $time, clk, rst, d, q);

        #12 d = 1;
        #10 d = 0;
        #5  d = 1;

        #5  rst = 0;
        #12  d = 0;
        #10  d = 1;
        #5   d = 0;

        #5  rst = 1;
        #12   d = 1;
        #10   d = 0;
        #5    d = 1;

        #5  rst = 0;
        #12   d = 1;
        #10   d = 0;
        #5    d = 1;

        #10 $display("Testbench completed.");
        $finish;
    end

    initial begin
        $dumpfile("D_flipflop_sync_rst.vcd");
        $dumpvars(0, D_flipflop_sync_rst_tb);
    end

endmodule