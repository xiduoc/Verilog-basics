`timescale 1ns/1ps

module encoder_8to3_tb;

    reg [7:0] d;
    wire [2:0] y;
    wire valid;

    //encoder_8to3_behavioral    dut1 (.d(d), .y(y), .valid(valid));
    //encoder_8to3_behavioral_v2 dut2 (.d(d), .y(y), .valid(valid));
    //encoder_8to3_dataflow_v2   dut3 (.d(d), .y(y), .valid(valid));
    encoder_8to3_dataflow      dut4 (.d(d), .y(y), .valid(valid));

    reg [2:0] y_exp;
    reg valid_exp;

    task calc_expected;
        input [7:0] din;
        begin
            valid_exp = |din;
            casez (din)
                8'b1???????: y_exp = 3'b111;
                8'b01??????: y_exp = 3'b110;
                8'b001?????: y_exp = 3'b101;
                8'b0001????: y_exp = 3'b100;
                8'b00001???: y_exp = 3'b011;
                8'b000001??: y_exp = 3'b010;
                8'b0000001?: y_exp = 3'b001;
                8'b00000001: y_exp = 3'b000;
                default:     y_exp = 3'b000;
            endcase
        end
    endtask

    initial begin 
        d = 8'b00000000;

        $monitor("Time=%0t | d=%b | y=%b valid=%b", $time, d, y, valid);
        
        for (integer i = 0; i < 256; i = i + 1) begin
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
        $dumpfile("encoder_8to3.vcd");
        $dumpvars(0, encoder_8to3_tb);
    end

endmodule