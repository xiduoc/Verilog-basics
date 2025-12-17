`timescale 1ns / 1ps

module decoder_2to4_tb;

    reg [1:0] a;
    reg en;
    wire [3:0] y;

    //decoder_2to4_behavioral dut1 (.a(a), .en(en), .y(y));
    //decoder_2to4_behavioral_v2 dut2 (.a(a), .en(en), .y(y));
    //decoder_2to4_dataflow dut3 (.a(a), .en(en), .y(y));
    //decoder_2to4_dataflow_v2 dut4 (.a(a), .en(en), .y(y));
    //decoder_2to4_gate dut5 (.a(a), .en(en), .y(y));
    decoder_2to4_generate dut6 (.a(a), .en(en), .y(y));

    initial begin

        $monitor("Time=%0t | en=%b | a=%b | y=%b", $time, en, a, y);

        $display("Test case 1: Enable = 0");
        en = 0;
        for (integer i = 0; i < 4; i = i + 1) begin
            a = i;
            #10;
        end

        $display("Test case 2: Enable = 1");
        en = 1;
        for (integer i = 0; i < 4; i = i + 1) begin
            a = i;
            #10;
        end

        #10 $display("Test completed.");
        $finish;
    end

    initial begin
        $dumpfile("decoder_2to4.vcd");
        $dumpvars(0, decoder_2to4_tb);
    end

endmodule