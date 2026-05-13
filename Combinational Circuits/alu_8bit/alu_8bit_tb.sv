`timescale 1ns/1ps

module alu_8bit_tb;

    logic [7:0] a, b;
    logic [2:0] opcode;
    logic [7:0] result;
    logic z_flag, c_flag, v_flag, n_flag;

    localparam logic [2:0] OP_ADD = 3'b000;
    localparam logic [2:0] OP_SUB = 3'b001;
    localparam logic [2:0] OP_AND = 3'b010;
    localparam logic [2:0] OP_OR  = 3'b011;
    localparam logic [2:0] OP_XOR = 3'b100;
    localparam logic [2:0] OP_NOT = 3'b101;
    localparam logic [2:0] OP_SHL = 3'b110;
    localparam logic [2:0] OP_SHR = 3'b111;

    alu_8bit dut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result),
        .z_flag(z_flag),
        .c_flag(c_flag),
        .v_flag(v_flag),
        .n_flag(n_flag)
    );

    int pass_count, fail_count;

    task automatic check(
        input logic [7:0] test_a,
        input logic [7:0] test_b,
        input logic [2:0] test_op,
        input logic [7:0] exp_result,
        input logic       exp_z,
        input logic       exp_c,
        input logic       exp_v,
        input logic       exp_n,
        input string      test_name
    );
        a = test_a;
        b = test_b;
        opcode = test_op;

        if ($isunknown(opcode))
            $fatal(1, "[%s] opcode contains X/Z", test_name);
        #1;

        if (result !==exp_result || z_flag !== exp_z || c_flag !== exp_c || v_flag !== exp_v || n_flag !== exp_n) begin
            $display("FAIL [%s]: a=%02h b=%02h op=%03b | got result=%02h z=%b c=%b v=%b n=%b | exp result=%02h z=%b c=%b v=%b n=%b",
                    test_name, test_a, test_b, test_op, result, z_flag, c_flag, v_flag, n_flag, exp_result, exp_z, exp_c, exp_v, exp_n);
            fail_count++;
        end
        else begin
            pass_count++;
        end
    endtask

    initial begin
        pass_count = 0;
        fail_count = 0;

        // ADD
        // ADD
        check(8'h0A, 8'h05, OP_ADD, 8'h0F, 0, 0, 0, 0, "ADD normal");
        check(8'hFF, 8'h01, OP_ADD, 8'h00, 1, 1, 0, 0, "ADD carry");
        check(8'h7F, 8'h01, OP_ADD, 8'h80, 0, 0, 1, 1, "ADD overflow+");
        check(8'h80, 8'hFF, OP_ADD, 8'h7F, 0, 1, 1, 0, "ADD overflow-");

        // SUB
        check(8'h05, 8'h03, OP_SUB, 8'h02, 0, 0, 0, 0, "SUB normal");
        check(8'h00, 8'h01, OP_SUB, 8'hFF, 0, 1, 0, 1, "SUB borrow");
        check(8'h80, 8'h01, OP_SUB, 8'h7F, 0, 0, 1, 0, "SUB overflow");

        // AND
        check(8'hF0, 8'h0F, OP_AND, 8'h00, 1, 0, 0, 0, "AND zero");

        // OR
        check(8'h80, 8'h01, OP_OR,  8'h81, 0, 0, 0, 1, "OR negative");

        // XOR
        check(8'hAA, 8'hFF, OP_XOR, 8'h55, 0, 0, 0, 0, "XOR normal");

        // NOT — b unused; test with b=00 and b=FF to verify b has no effect
        check(8'hAA, 8'h00, OP_NOT, 8'h55, 0, 0, 0, 0, "NOT b=00");
        check(8'hAA, 8'hFF, OP_NOT, 8'h55, 0, 0, 0, 0, "NOT b=FF ignored");

        // SHL
        check(8'h80, 8'h00, OP_SHL, 8'h00, 1, 1, 0, 0, "SHL carry");
        check(8'h40, 8'h00, OP_SHL, 8'h80, 0, 0, 0, 1, "SHL negative");

        // SHR
        check(8'h01, 8'h00, OP_SHR, 8'h00, 1, 1, 0, 0, "SHR carry");
        check(8'h80, 8'h00, OP_SHR, 8'h40, 0, 0, 0, 0, "SHR no-carry");

        $display("Test completed: %0d passed, %0d failed", pass_count, fail_count);
        $finish;

    end

    initial begin
        $dumpfile("alu_8bit.vcd");
        $dumpvars(0, alu_8bit_tb);
    end

endmodule