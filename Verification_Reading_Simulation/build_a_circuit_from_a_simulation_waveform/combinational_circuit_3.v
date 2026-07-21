module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = 1?((a==1||b==1)&&(c==1||d==1)):(a==0&&b==0);// Fix me

endmodule
