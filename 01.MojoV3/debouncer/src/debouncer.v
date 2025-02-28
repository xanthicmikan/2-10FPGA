`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:38:58 08/10/2021 
// Design Name: 
// Module Name:    debouncer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module debouncer(
    input CLK,
    input switch_input,
    output reg state,
    output trans_up,
    output trans_dn
    );

reg sync_0, sync_1;

always @(posedge CLK)
begin
 sync_0 = switch_input;
end 

always @(posedge CLK)
begin
 sync_1 = sync_0;
end 

//debounce the switch
reg [16:0] count;
wire idle = (state == sync_1);//if the same, idle = 1
wire finished = &count;//finished is true when all bits of count are 1's

always @(posedge CLK)
begin
 if(idle)
 begin
  count <= 0;
 end
 else
 begin
  count <= count + 1;
  if(finished)
  begin
   state <= ~state;
  end
 end
end

assign trans_up = ~idle & finished & ~state;
assign trans_dn = ~idle & finished & state;

endmodule
