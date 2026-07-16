module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [3:0] fa1,fa2,fa3;
    
    fadd f1(y[0],x[0],0,fa1,sum[0]);
    fadd f2(y[1],x[1],fa1,fa2,sum[1]);
    fadd f3(y[2],x[2],fa2,fa3,sum[2]);
    fadd f4(y[3],x[3],fa3,sum[4],sum[3]);

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    
    assign sum=a^b^cin;
    assign cout=(a&b)+(b&cin)+(cin&a);

endmodule

