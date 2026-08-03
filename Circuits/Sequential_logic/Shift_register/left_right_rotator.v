module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    always @(posedge clk)begin
            casex({load,ena})
                3'b001:q<={q[0],q[99:1]};
                3'b010:q<={q[98:0],q[99]};
                3'b1xx:q<=data;
                default:q<=q;
            endcase
     end
endmodule
