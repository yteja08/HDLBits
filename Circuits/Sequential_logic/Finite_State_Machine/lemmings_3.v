module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter[2:0] LEFT=0, RIGHT=1,FALL_L=2,FALL_R=3,DIG_L=4,DIG_R=5;
    reg [2:0]state,next_state;

    always @(*) begin
        case(state)
            LEFT:begin
                if(bump_left && ground && !dig)
                    next_state=RIGHT;
                else if(dig && ground)
                    next_state=DIG_L;
               else if(!ground)
                    next_state=FALL_L;
                else
                    next_state=LEFT;
                end
            
            RIGHT:begin
                if(bump_right && ground && !dig)
                    next_state=LEFT;
                else if(dig && ground)
                    next_state=DIG_R;
                else if(!ground)
                    next_state=FALL_R;
                else
                    next_state=RIGHT;
            end
            
            FALL_R:begin
                if(ground)
                    next_state=RIGHT;
                else 
                    next_state=FALL_R;
                end
            
            FALL_L:begin
                if(ground)
                    next_state=LEFT;
                else 
                    next_state=FALL_L;
            end
            DIG_L:begin
                if(ground)
                    next_state=DIG_L;
                else 
                    next_state=FALL_L;
            end
            DIG_R:begin
                if(ground)
                    next_state=DIG_R;
                else 
                    next_state=FALL_R;
            end
            
            
            default:next_state=LEFT;
        endcase
        
    end

    always @(posedge clk or posedge areset) begin
        if(areset)
            state<=LEFT;
        else
            state<=next_state;
    end
    
    always @(posedge clk) begin 
        if(!ground)begin
            aaah<=1'b1;
        end
        else begin
            aaah<=1'b0;
        end
    end
    

    assign walk_left =(state==LEFT);
    assign walk_right =(state==RIGHT);
    assign digging=(state==DIG_L || state==DIG_R);

endmodule
