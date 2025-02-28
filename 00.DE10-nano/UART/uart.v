module uart( clk, rst, tx, rx, led);
    
    input    clk;
    input    rst;
    input    rx;
    output   tx;
    output  [7:0] led;
    wire    [7:0] rx_dat;
    wire    rx_rdy;

// rx process
    uart_rx uart_rx_inst0(
        .clk    (clk),
        .rstn   (rst),
        .rx     (rx),
        .rx_dat (rx_dat),
        .done   (rx_rdy)
        );
    
    assign led = rx_dat;
    assign tx  = 1'b1;
endmodule

module uart_rx( clk, rstn, rx, rx_dat, done);
    input    clk;
    input    rstn;
    input    rx;
    output  [7:0] rx_dat;
    output   done;
    reg     [7:0] rx_dat;
    reg     [31:0] cnt;
    wire           state_change;
    wire    rx_val_cap;

    reg        rx_1d, rx_2d;
    wire       rx_neg;
    reg    [3:0] cs,ns;
    parameter cnt_end = 434;
    parameter cnt_latch = 217;
    
    parameter   idle = 'd0,
                start = 'd1,
                rxbit0 = 'd2,
                rxbit1 = 'd3,
                rxbit2 = 'd4,
                rxbit3 = 'd5,
                rxbit4 = 'd6,
                rxbit5 = 'd7,
                rxbit6 = 'd8,
                rxbit7 = 'd9,
                stop = 'd10;
                
    always@(posedge clk or negedge rstn) begin
        if(rstn == 1'b0)
            cnt <= 'h0;
        else if(cs !== idle) begin
                if(cnt == cnt_end)
                  cnt <= 'h0;
                else
                  cnt <= cnt + 1'b1;
            end
        else 
            cnt <= 'h0;
    end
    
    assign state_change = (cnt == cnt_end) ? 1'b1 : 1'b0;
    assign rx_val_cap   = (cnt == cnt_latch) ? 1'b1 : 1'b0;
        
    always@(posedge clk or negedge rstn)
    begin   
        if(rstn == 1'b0) begin
            rx_1d <= 1'b0;
            rx_2d <= 1'b0;
        end
        else  begin
            rx_2d <= rx_1d;
            rx_1d <= rx;
        end
    end
    assign rx_neg = (~rx_1d ) && rx_2d;
    
    always@(posedge clk or negedge rstn)
    begin
        if(rstn == 1'b0)
            cs <= 'h0;
        else 
            cs <= ns;
    end
    
    always@(*)
    begin
        case(cs)
            idle: if(rx_neg)
                ns = start;
            else
                ns = idle;
            start:  if(state_change) ns = rxbit0; else ns = start; 
            rxbit0: if(state_change) ns = rxbit1; else ns = rxbit0; 
            rxbit1: if(state_change) ns = rxbit2; else ns = rxbit1; 
            rxbit2: if(state_change) ns = rxbit3; else ns = rxbit2; 
            rxbit3: if(state_change) ns = rxbit4; else ns = rxbit3; 
            rxbit4: if(state_change) ns = rxbit5; else ns = rxbit4; 
            rxbit5: if(state_change) ns = rxbit6; else ns = rxbit5; 
            rxbit6: if(state_change) ns = rxbit7; else ns = rxbit6; 
            rxbit7: if(state_change) ns = stop  ; else ns = rxbit7;   
            stop:   if(state_change) ns = idle  ; else ns = stop ; 
            default: ns = idle;
        endcase
    end     
    // rx_dat_proc
    always@(posedge clk or negedge rstn)
    begin
            if(rstn == 1'b0)
                rx_dat <= 8'h0;
            else if((rx_val_cap) && (cs !== idle) && (cs !== start) && (cs !== stop))
                rx_dat <= {rx,rx_dat[7:1]};
            else
                rx_dat <= rx_dat;
    end
    assign    done = (cs == stop) ? 1'b1 : 1'b0;
    endmodule
