// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    /*
    always @(*) begin
    up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
        if (scancode[15:4]==12'he06) begin
            if (scancode[3:0]==4'hb)
                left=1'b1;
        end
        else if (scancode[15:4]==12'he07) begin
            if (scancode[3:0]==4'h2)
                down=1'b1;
        	else if (scancode[3:0]==4'h4)
                right=1'b1;
        	else if (scancode[3:0]==4'h5)
                up=1'b1;
        end
    end */
    
    
    always @(*) begin
    up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
        case(scancode)
            16'he06b:left=1'b1;
            16'he072:down=1'b1;
            16'he074:right=1'b1;
            16'he075:up=1'b1;
        endcase
    end
                  
   
endmodule

