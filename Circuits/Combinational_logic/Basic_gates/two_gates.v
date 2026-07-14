module top_module (
    input in1,
    input in2,
    input in3,
    output reg out);
    
    wire xnor1;
    
    xnor (xnor1,in1,in2);
    xor (out,xnor1,in3);
    
    

endmodule



