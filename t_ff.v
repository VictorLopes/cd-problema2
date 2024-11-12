module t_ff(clk, rst, t, q);
    input clk;
    input rst;
    input t;
    output reg q;
 always @(posedge clk)
        begin 
            if (!rst)
                q <= 0; 
            else if (t)
                q <= ~q;
        end 
endmodule
