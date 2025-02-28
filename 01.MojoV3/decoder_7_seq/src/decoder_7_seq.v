`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:15:30 08/10/2021 
// Design Name: 
// Module Name:    decoder_7_seq 
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
module decoder_7_seq(
    input CLK,
    input [3:0] D,
    output reg [7:0] SEQ
    );

always @(posedge CLK)
begin
 case(D)
 4'd0: SEQ <= 8'b00000011;
 4'd1: SEQ <= 8'b10011111;
 4'd2: SEQ <= 8'b00100101;
 4'd3: SEQ <= 8'b00001101;
 4'd4: SEQ <= 8'b10011001;
 4'd5: SEQ <= 8'b01001001;
 4'd6: SEQ <= 8'b01000001;
 4'd7: SEQ <= 8'b00011111;
 4'd8: SEQ <= 8'b00000001;
 4'd9: SEQ <= 8'b00001001;
 default: SEQ <= 8'b11111111;
 endcase
 
end 
endmodule
