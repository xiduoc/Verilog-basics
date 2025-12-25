module comparator_2bit_dataflow_v3 (
    input [1:0] a,
    input [1:0] b,
    output a_greater,
    output a_equal,
    output a_less
);

    assign a_greater = (a[1] & ~b[1]) | 
                       (~(a[1] ^ b[1]) & a[0] & ~b[0]);
                       
    assign a_equal   = ~( (a[1] ^ b[1]) | (a[0] ^ b[0]) );
    
    assign a_less    = (~a[1] & b[1]) | 
                       (~(a[1] ^ b[1]) & ~a[0] & b[0]);

endmodule