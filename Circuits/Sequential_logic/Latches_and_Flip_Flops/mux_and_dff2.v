module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire m1,m2;
    
    always@(posedge clk) begin
    
     m1=E?w:Q;
     m2=L?R:m1;
        
        Q=m2;
    end
    
    

endmodule
