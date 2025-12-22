`timescale 1ns/1ps

module mux_4to1_tb;

    reg a, b, c, d;
    reg [1:0] sel;
    wire y;

    //mux_4to1_behavioral dut (.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));
    //mux_4to1_behavioral_v2 dut (.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));
    //mux_4to1_dataflow dut (.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));
    //mux_4to1_dataflow_v2 dut (.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));
    //mux_4to1_dataflow_v3 dut (.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));
    //mux_4to1_hierarchical dut (.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));
    mux_4to1_gate dut (.a(a), .b(b), .c(c), .d(d), .sel(sel), .y(y));

    initial begin

        $monitor("Time=%0t | a=%b b=%b c=%b d=%b sel=%b | y=%b", $time, a, b, c, d, sel, y);

        for (integer i = 0; i < 64; i = i + 1) begin
            {a, b, c, d, sel} = i;
            #10;
        end

        #10 $display("Test completed.");
        $finish;
    end

    initial begin
        $dumpfile("mux_4to1.vcd");
        $dumpvars(0, mux_4to1_tb);
    end

endmodule