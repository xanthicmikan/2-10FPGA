`timescale 1ns/1ns
module led_ctrl_tb();
    reg  sysclk;// testbench clk
    reg  rstn;// testbench rstn
    wire [3:0] led_o;
    // clock generator
    always
    #10 sysclk = ~sysclk; // 10 * 1ns
                           // 20ns period (50MHz)
    // DUT inst
    led_ctrl led_ctrl_inst (
        .clk  (sysclk),
        .rstn (rstn),
        .led_o(led_o)
    );
    initial
    begin
        rstn = 1'b0;
        sysclk = 1'b0;
        #100 rstn = 1'b1;
        // system start
        @(posedge led_o[3]);
        $stop;
    end

endmodule