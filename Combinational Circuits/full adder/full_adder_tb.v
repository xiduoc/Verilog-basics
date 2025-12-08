`timescale 1ns/1ps

module full_adder_tb;

    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    //full_adder_arthmetic      dut1 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    //full_adder_behavioral     dut2 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    //full_adder_behavioral_v2  dut3 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    //full_adder_dataflow       dut4 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    //full_adder_case           dut5 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    full_adder_structural     dut6 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        a = 0; b = 0; cin = 0;

        $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b", $time, a, b, cin, sum, cout);
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            #10;
        end

        #10 $display("Test completed.");
        $finish;
    end

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);
    end

endmodule