`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:14 08/09/2021 
// Design Name: 
// Module Name:    counter_verilog 
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
module counter_verilog(
    input Clock,
    output reg [3:0] Q
    );

always @(posedge Clock)
begin
 Q <= Q + 1;
end

endmodule