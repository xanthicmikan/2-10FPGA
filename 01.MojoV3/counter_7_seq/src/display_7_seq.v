`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:45 08/10/2021 
// Design Name: 
// Module Name:    display_7_seq 
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
module display_7_seq(
    input CLK,
    input [3:0] units, tens, hundreds, thousands,
    output [7:0] SEQ,
    output reg [3:0] DIGIT
    );
	 
reg [3:0] digit_data;
reg [1:0] digit_posn;
reg [23:0] prescaler;
	 
decoder_7_seq decoder(.CLK (CLK), .SEQ	(SEQ), .D (digit_data));   

always @(posedge CLK)
begin
  prescaler <= prescaler + 24'd1;
  if (prescaler == 24'd50000) // 1 kHz
  begin
    prescaler <= 0;
    digit_posn <= digit_posn + 2'd1;
    if (digit_posn == 0)
    begin
      digit_data <= units;
      DIGIT <= 4'b1110;
    end
    if (digit_posn == 2'd1)
    begin
      digit_data <= tens;
      DIGIT <= 4'b1101;
    end
    if (digit_posn == 2'd2)
    begin
      digit_data <= hundreds;
      DIGIT <= 4'b1011;
    end	
    if (digit_posn == 2'd3)
    begin
      digit_data <= thousands;
      DIGIT <= 4'b0111;
    end	
  end
end

endmodule
