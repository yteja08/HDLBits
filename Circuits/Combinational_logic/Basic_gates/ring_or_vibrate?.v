module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    
    assign ringer=(ring&~vibrate_mode);
    assign motor=(ring&vibrate_mode);
    
   /* always@(*)begin
        if(ring)begin
            ringer=1;
            
        end
        else if(vibrate_mode&ring)begin
            motor=1;
            end
        
    end */
endmodule
