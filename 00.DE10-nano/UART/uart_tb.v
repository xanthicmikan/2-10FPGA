`timescale 1ns/1ns
module uart_tb();
    reg    clk          = 1'b0;
    reg    uart_pc2fpga = 1'b1;
    wire    uart_fpga2pc;
    reg    pc_clk = 1'b1;
    reg    rst = 1'b0;
    wire  [7:0] led;


    always
        #(8680/2) pc_clk = ~pc_clk;
        
    // 50MHz clock generator
    always
    #10 clk = ~clk;
    
    // DUT
    uart uart(
        .clk    (clk),
        .rst    (rst), 
        .rx     (uart_pc2fpga),
        .tx     (uart_fpga2pc), 
        .led    (led)
    );
    // testbench
    initial
    begin
        #100 rst = 1'b1;// release system rst
        
        repeat(10) begin
        @(posedge pc_clk);
        end
        
        pc_send_dat(8'h31);	// PC Send ASCII Code 31 to FPGA through UART
        
        repeat(10) begin
        @(posedge pc_clk); 	
        end	
        
        pc_send_dat(8'h33);	// PC Send ASCII Code 33 to FPGA through UART
        
        repeat(10) begin
        @(posedge pc_clk);
        end
        
        $stop;
    end
    
    task pc_send_dat;
    input    [7:0] pc_ascii_dat;// PC Send ASCII Code to FPGA through UART 
    begin
        @(posedge pc_clk)
        uart_pc2fpga = 1'b0; // start bit
        @(posedge pc_clk)
        uart_pc2fpga = pc_ascii_dat[0]; 
        @(posedge pc_clk)
        uart_pc2fpga = pc_ascii_dat[1]; 
        @(posedge pc_clk)
        uart_pc2fpga = pc_ascii_dat[2]; 
        @(posedge pc_clk)
        uart_pc2fpga = pc_ascii_dat[3]; 
        @(posedge pc_clk)
        uart_pc2fpga = pc_ascii_dat[4]; 
        @(posedge pc_clk)
        uart_pc2fpga = pc_ascii_dat[5]; 
        @(posedge pc_clk)
        uart_pc2fpga = pc_ascii_dat[6]; 
        @(posedge pc_clk)
        uart_pc2fpga = pc_ascii_dat[7]; 
        @(posedge pc_clk)
        uart_pc2fpga = 1'b1; // stop bit
    end
    endtask
endmodule