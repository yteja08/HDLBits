module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah );
    
    parameter[1:0] LEFT=0, RIGHT=1,FALL_L=2,FALL_R=3;
    reg [1:0]state,next_state;

    always @(*) begin
        case(state)
            LEFT:begin
                if(bump_left && ground)
                    next_state=RIGHT;
               else if(!ground)
                    next_state=FALL_L;
                else
                    next_state=LEFT;
                end
            
            RIGHT:begin
                if(bump_right && ground)
                    next_state=LEFT;
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
        if(!ground)
            aaah<=1'b1;
        else
            aaah<=1'b0;
    end
    

    assign walk_left =(state==LEFT);
    assign walk_right =(state==RIGHT);
endmodule
