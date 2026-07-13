module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    reg [7:0]count;
    integer i;
    always@(*) begin
        count=1'b0;
        for(i=0;i<=254;i++)
            if (in[i]==1) begin
                count+=1;
            end
        out=count;
    end
       

endmodule
