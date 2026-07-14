module top_module (input x, input y, output z);
    wire a;
    xor(a,x,y);
    and(z,a,x);

endmodule

