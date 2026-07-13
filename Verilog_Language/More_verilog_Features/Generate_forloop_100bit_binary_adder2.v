module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    wire [100:0] c; 

    assign c[0] = cin; 
    genvar i;
    generate
        for (i=0;i<=99;i++) begin : GEN_FA
            fulladder dut(
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .cout(c[i+1]),
                .sum(sum[i])
            );
        end
    endgenerate

    assign cout = c[100:1];

endmodule

module fulladder(
    input a, b, cin,
    output cout, sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
