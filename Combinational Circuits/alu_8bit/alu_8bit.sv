module alu_8bit (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic [2:0] opcode,
    output logic [7:0] result,
    output logic z_flag,
    output logic c_flag,
    output logic v_flag,
    output logic n_flag
);

    localparam logic [2:0] OP_ADD = 3'b000;
    localparam logic [2:0] OP_SUB = 3'b001;
    localparam logic [2:0] OP_AND = 3'b010;
    localparam logic [2:0] OP_OR  = 3'b011;
    localparam logic [2:0] OP_XOR = 3'b100;
    localparam logic [2:0] OP_NOT = 3'b101;
    localparam logic [2:0] OP_SHL = 3'b110;
    localparam logic [2:0] OP_SHR = 3'b111;

    logic [8:0] add_ext;
    logic [8:0] sub_ext;

    always_comb begin
        add_ext = {1'b0, a} + {1'b0, b};
        sub_ext = {1'b0, a} - {1'b0, b};

        result = 8'h00;
        c_flag = 1'b0;
        v_flag = 1'b0;
        
        unique case (opcode)
            OP_ADD: begin
                result = add_ext[7:0];
                c_flag = add_ext[8];
                v_flag = (a[7] == b[7]) && (result[7] != a[7]);
            end
            OP_SUB: begin
                result = sub_ext[7:0];
                c_flag = (a < b);
                v_flag = (a[7] != b[7]) && (result[7] != a[7]);
            end
            OP_AND: begin
                result = a & b;
            end
            OP_OR: begin
                result = a | b;
            end
            OP_XOR: begin
                result = a ^ b;
            end
            OP_NOT: begin
                result = ~a;
            end
            OP_SHL: begin
                result = {a[6:0], 1'b0};
                c_flag = a[7];
            end
            OP_SHR: begin
                result = {1'b0, a[7:1]};
                c_flag = a[0];
            end
        endcase

        z_flag = (result == 8'h00);
        n_flag = result[7];
    end
        
endmodule