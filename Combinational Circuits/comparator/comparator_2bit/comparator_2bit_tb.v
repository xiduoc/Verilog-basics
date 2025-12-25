`timescale 1ns / 1ps

module comparator_2bit_tb;

    reg [1:0] a;
    reg [1:0] b;
    wire a_greater;
    wire a_equal;
    wire a_less;

    //comparator_2bit_behavioral dut (.a(a), .b(b), .a_greater(a_greater), .a_equal(a_equal), .a_less(a_less));
    //comparator_2bit_behavioral_v2 dut (.a(a), .b(b), .a_greater(a_greater), .a_equal(a_equal), .a_less(a_less));
    //comparator_2bit_dataflow dut (.a(a), .b(b), .a_greater(a_greater), .a_equal(a_equal), .a_less(a_less));
    //comparator_2bit_dataflow_v2 dut (.a(a), .b(b), .a_greater(a_greater), .a_equal(a_equal), .a_less(a_less));
    comparator_2bit_dataflow_v3 dut (.a(a), .b(b), .a_greater(a_greater), .a_equal(a_equal), .a_less(a_less));

    reg greater_exp;
    reg equal_exp;
    reg less_exp;
    integer errors;

    task calc_expected;
        input [1:0] ain;
        input [1:0] bin;
        begin
            if (ain > bin) begin
                greater_exp = 1'b1;
                equal_exp = 1'b0;
                less_exp = 1'b0;
            end
            else if (ain == bin) begin
                greater_exp = 1'b0;
                equal_exp = 1'b1;
                less_exp = 1'b0;
            end
            else begin
                greater_exp = 1'b0;
                equal_exp = 1'b0;
                less_exp = 1'b1;
            end
        end
    endtask

    task check_results;
        begin
            if (a_greater !== greater_exp || a_equal !== equal_exp || a_less !== less_exp) begin
                $display("Fail: a=%b b=%b -> a_greater=%b a_equal=%b a_less=%b -> exp a_greater=%b a_equal=%b a_less=%b", a, b, a_greater, a_equal, a_less, greater_exp, equal_exp, less_exp);
                errors = errors + 1;
            end else begin
                $display("Pass: a=%b b=%b -> a_greater=%b a_equal=%b a_less=%b", a, b, a_greater, a_equal, a_less);   
            end
        end
    endtask

    initial begin
        a = 2'b00;
        b = 2'b00;
        errors = 0;

        $monitor("Time=%0t | a=%b b=%b | a_greater=%b a_equal=%b a_less=%b", $time, a, b, a_greater, a_equal, a_less);

        for (integer i = 0; i < 4; i = i + 1) begin
            for (integer j = 0; j < 4; j = j + 1) begin
                a = i;
                b = j;
                #10;
                calc_expected(a, b);
                check_results();
            end
        end

        #10 $display("Test completed with %0d errors.", errors);
        $finish;
    end

    initial begin
        $dumpfile("comparator_2bit.vcd");
        $dumpvars(0, comparator_2bit_tb);
    end

endmodule