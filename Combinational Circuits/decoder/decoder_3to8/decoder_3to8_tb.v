`timescale 1ns/1ps

module decoder_3to8_tb;

    reg [2:0] a;
    reg       en;
    wire [7:0] y;

    //decoder_3to8_behavioral dut (.a(a), .en(en), .y(y));
    //decoder_3to8_behavioral_v2 dut (.a(a), .en(en), .y(y));
    //decoder_3to8_behavioral_v3 dut (.a(a), .en(en), .y(y));
    //decoder_3to8_dataflow dut (.a(a), .en(en), .y(y));
    //decoder_3to8_dataflow_v2 dut (.a(a), .en(en), .y(y));
    //decoder_3to8_dataflow_v3 dut (.a(a), .en(en), .y(y));
    //decoder_3to8_hierarchical dut (.a(a), .en(en), .y(y));
    decoder_3to8_generate dut (.a(a), .en(en), .y(y));

    initial begin

        $monitor("Time=%0t | en=%b | a=%b | y=%b", $time, en, a, y);

        $display("Test case 1: Enable = 0");
        en = 0;
        for (integer i = 0; i < 8; i = i + 1) begin
            a = i;
            #10;
        end

        $display("Test case 2: Enable = 1");
        en = 1;
        for (integer i = 0; i < 8; i = i + 1) begin
            a = i;
            #10;
        end

        #10 $display("Test completed.");
        $finish;
    end

    initial begin
        $dumpfile("decoder_3to8.vcd");
        $dumpvars(0, decoder_3to8_tb);
    end

endmodule