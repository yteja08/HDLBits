module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    always @(*) begin
        if (x3) begin
            f=x1;
        end
        else 
            f=x2;
    end

endmodule
