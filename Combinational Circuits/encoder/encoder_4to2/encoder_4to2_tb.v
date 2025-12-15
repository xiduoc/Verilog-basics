`timescale 1ns/1ps

module encoder_4to2_tb;

    reg [3:0] d;
    wire [1:0] y;
    wire valid;
    
    //encoder_4to2_behavioral    dut1 (.d(d), .y(y), .valid(valid));
    //encoder_4to2_behavioral_v2 dut2 (.d(d), .y(y), .valid(valid));
    //encoder_4to2_dataflow      dut3 (.d(d), .y(y), .valid(valid));
    encoder_4to2_gate          dut4 (.d(d), .y(y), .valid(valid)); 

    // Expected outputs
    reg [1:0] y_exp;
    reg       valid_exp;

    task calc_expected;
        input [3:0] din;
        begin
            valid_exp = |din;
            casez (din)
                4'b1???: y_exp = 2'b11;
                4'b01??: y_exp = 2'b10;
                4'b001?: y_exp = 2'b01;
                4'b0001: y_exp = 2'b00;
                default: y_exp = 2'b00;
            endcase
        end
    endtask

    initial begin
        d = 4'b0000;

        $monitor("Timme=%0t | d=%b | y=%b valid=%b", $time, d, y, valid);

        for (integer i = 0; i < 16; i = i + 1) begin
            d = i;
            #5;
            calc_expected(d);

            if (y !== y_exp || valid !== valid_exp) begin
                $display("Fail: d=%b -> y=%b (valid=%b), exp y=%b (valid=%b)", d, y, valid, y_exp, valid_exp);
            end else begin
                $display("Pass: d=%b -> y=%b (valid=%b)", d, y, valid);   
            end
            #5;
        end

        #10 $display("Test completed.");
        $finish;
    end

    initial begin
        $dumpfile("encoder_4to2.vcd");
        $dumpvars(0, encoder_4to2_tb);
    end

endmodule 