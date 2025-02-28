`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:59:09 08/10/2021 
// Design Name: 
// Module Name:    seq_test 
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
module seq_test(
    input CLK,
    input [3:0] D,
    output [7:0] SEQ,
    output [3:0] DIGIT
    );
	 
assign DIGIT = 4'b1110;

decoder_7_seq decoder(
.CLK(CLK),
.SEQ(SEQ),
.D(D)
);

endmodule
