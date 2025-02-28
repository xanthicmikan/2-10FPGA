module count_led7
(   rst_n,
    clk,
    count,
    data_o);

    input  rst_n;
    input  clk;
    output  [3:0] count;
    output    data_o;
    
    reg  [3:0]  count;
    wire    data_o;

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            count <= 4'h0;
        else if(count == 'd7)
            count <= 4'h0;
        else    
            count <= count + 4'b1;
    end
    
    assign data_o = ((count>= 4'h2) && (count<=4'h5)) ? 1'b1 : 1'b0;
    
endmodule
