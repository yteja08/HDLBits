module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter [1:0] A=0,B=1,C=2,D=3; 
    reg [1:0]state,next_state;
    // State transition logic
    always @(*) begin    
        case(state)
            A:begin
                if(s[1] && !s[2] && !s[3])
                    next_state=B;
                else if(s[1] && s[2] && !s[3])
                    next_state=C;
                else if(s[1] && s[2] && s[3])
                    next_state=D;
                else
                    next_state=A;
              end
            B:begin
                if(s[1] && s[2] && !s[3]) 
                    next_state=C;
                else if(s[1]&&s[2]&&s[3])
                    next_state=D;
                else if(!s[1])
                    next_state=A;
                else
                    next_state=B;
            end
            C:begin
                if(s[1] && s[2] && s[3])
                    next_state=D;
                else if(!s[2])
                    next_state=B;
                else if(!s[2] && !s[1])
                    next_state=A;
                else
                    next_state=C;
            end
            D:begin
                if(!s[3] && s[2] && s[1])
                    next_state=C;
                else if(!s[3] && !s[2] && s[1])
                    next_state=B;
                else if(!s[3] && !s[2] && !s[1])
                    next_state=A;
                else 
                    next_state=D;
            end
            default:next_state=A;
        endcase
    end

   

    // State flip-flops with asynchronous reset
    always @(posedge clk) begin   
        if(reset)
            state<=A;
        else
            state<=next_state;
    end
     

    // Output logic
    always@(posedge clk)
        begin
            if(reset)
                dfr<=1'b1;
            else begin
                
            case({state,next_state})
                4'b0000:dfr<=dfr;
                4'b0001:dfr<=1'b0;
                4'b0010:dfr<=1'b0;
                4'b0011:dfr<=1'b0;
                4'b0100:dfr<=1'b1;
                4'b0101:dfr<=dfr;
                4'b0110:dfr<=1'b0;
                4'b0111:dfr<=1'b0;
                4'b1000:dfr<=1'b1;
                4'b1001:dfr<=1'b1;
                4'b1010:dfr<=dfr;
                4'b1011:dfr<=1'b0;
                4'b1100:dfr<=1'b1;
                4'b1101:dfr<=1'b1;
                4'b1110:dfr<=1'b1;
                4'b1111:dfr<=dfr;
                default:dfr<=1'b1;
             endcase
            end
        end    
     always@(*)
        begin          
            case(state)
                A:begin 
                    fr1=1'b1;
                    fr2=1'b1;
                    fr3=1'b1;
                end
                B:begin 
                    fr1=1'b1;
                    fr2=1'b1;
                    fr3=1'b0;
                end
                C:begin 
                    fr1=1'b1;
                    fr2=1'b0;
                    fr3=1'b0;
                end
                D:begin 
                    fr1=1'b0;
                    fr2=1'b0;
                    fr3=1'b0;
                end
                default:begin
                    fr1=1'b1;
                    fr2=1'b1;
                    fr3=1'b1;
                end
            endcase

        end
endmodule
