module top_module (
    input a,
    input b,
    output q );//

    assign q = 0?(a==0||b==0):(a==1&&b==1);// Fix me

endmodule


