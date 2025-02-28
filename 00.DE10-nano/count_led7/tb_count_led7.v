`timescale 1ns/1ns
module count_led7_tb();
    reg  rstn;
    reg  data_o;
    wire  [3:0]  counter;
    wire    data_o;
    count_m7 count_m7(
        .rstn   (rstn),
        .data_o    (data_o),
        .counter  (counter),
        .data_o (data_o));

    always #10 data_o = ~data_o;
    
    initial
    begin
        rstn = 1'b0;
        data_o = 1'b0;
        #100 
        rstn = 1'b1;
        @(negedge data_o);
        $display("1)pass");
        @(negedge data_o);
        $display("2)pass");
        repeat(10) begin
        @(posedge data_o);
        @(posedge data_o);
        end
        
        $stop;
    end
endmodule
