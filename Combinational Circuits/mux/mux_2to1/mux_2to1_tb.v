`timescale 1ns/1ps

module mux_2to1_tb;

    reg a, b, sel;
    wire y;

    //mux_2to1_behavioral dut (.a(a), .b(b), .sel(sel), .y(y));
    //mux_2to1_behavioral_v2 dut (.a(a), .b(b), .sel(sel), .y(y));
    //mux_2to1_dataflow dut (.a(a), .b(b), .sel(sel), .y(y));
    //mux_2to1_dataflow_v2 dut (.a(a), .b(b), .sel(sel), .y(y));
    mux_2to1_gate dut (.a(a), .b(b), .sel(sel), .y(y));
    
    initial begin
        
        $monitor("Time=%0t | a=%b b=%b sel=%b | y=%b", $time, a, b, sel, y);

        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, sel} = i;
            #10;
        end

        #10 $display("Test completed.");
        $finish;
    end

    initial begin
        $dumpfile("mux_2to1.vcd");
        $dumpvars(0, mux_2to1_tb);
    end

endmodule