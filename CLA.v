`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:12 07/16/2024 
// Design Name: 
// Module Name:    CLA 
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
module Carry_lookahead_adder(
	input [3:0]A,B, // 4bit input
	input Cin, // input carry
	output [3:0]S, // output sum
	output Cout
	);
wire [3:0]P,G; // Intermediate signals
wire [4:1]C;

assign P[0] = A[0] ^ B[0]; // intermediate Propagate singals
assign P[1] = A[1] ^ B[1];
assign P[2] = A[2] ^ B[2];
assign P[3] = A[3] ^ B[3];

assign G[0] = A[0] & B[0]; // intermediate Generate singals
assign G[1] = A[1] & B[1];
assign G[2] = A[2] & B[2];
assign G[3] = A[3] & B[3];
              
assign C[1] = G[0] | (P[0] & Cin);  // carry generation
assign C[2] = G[1] | (P[1] & C[1]);
assign C[3] = G[2] | (P[2] & C[2]);
assign C[4] = G[3] | (P[3] & C[3]);

assign S[0] = P[0] ^ Cin;   // assign sum
assign S[1] = P[1] ^ C[1];
assign S[2] = P[2] ^ C[2];
assign S[3] = P[3] ^ C[3];
assign Cout = C[4];

endmodule
