module led_ctrl(clk,rstn,led_o);

    input  clk;// 50MHz(20ns)
    input  rstn;
    output [3:0] led_o;
    
    
    // 1sec counter
    reg  [31:0] cnt;
    wire    onepps;
    reg [3:0]  cs;// current state
    reg [3:0]  ns;// next state
    
    always@(posedge clk or negedge rstn) begin
        if(~rstn)
            cnt <= 'h0;// inital setting
        else if(cnt == 32'd49999999)
            cnt <= 'h0;
        else
            cnt <= cnt + 32'h1;
    end
    // onepps signal
    assign onepps = (cnt == 'd49999999) ? 1'b1 : 1'b0;
    // define FSM state
    parameter idle = 'd0,
              led0 = 'd1,
              led1 = 'd2,
              led2 = 'd3,
              led3 = 'd4;
              
    // FSM seq part
    always@(posedge clk or negedge rstn) begin
        if(~rstn)
            cs <= 'h0;
        else if(onepps)
            cs <= ns;
        else
            cs <= cs;
    end
    

    // FSM combinational part
    always@(*) begin
        case(cs)
        idle : ns = led0;
        led0 : ns = led1;
        led1 : ns = led2;
        led2 : ns = led3;
        led3 : ns = led1;
        default: ns = idle;
        endcase
    end
    // led control
    assign led_o[0] = (cs == led0) ? 1'b1 : 1'b0;
    assign led_o[1] = (cs == led1) ? 1'b1 : 1'b0;
    assign led_o[2] = (cs == led2) ? 1'b1 : 1'b0;
    assign led_o[3] = (cs == led3) ? 1'b1 : 1'b0;

endmodule
