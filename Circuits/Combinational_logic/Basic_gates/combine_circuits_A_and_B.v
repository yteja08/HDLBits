module top_module (input x, input y, output z);
    
    wire z1,z2,z3,z4,and1,or1;
  
    assign z1=(x^y)&x;
    assign z3=(x^y)&x;
    assign z2=x~^y;
    assign z4=x~^y;
    
    or(or1,z1,z2);
    and(and1,z3,z4);
    xor(z,or1,and1);

endmodule
