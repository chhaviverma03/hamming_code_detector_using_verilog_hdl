`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2026 10:18:20
// Design Name: 
// Module Name: hamming_encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hamming_encoder(
input [3:0] data_in,output  [6:0] data_out
    );
    
    wire p1,p2,p4;
    wire d3,d5,d6,d7;
    
    assign d3=data_in[0];
    assign d5=data_in[1];
    assign d6=data_in[2];
    assign d7=data_in[3];
    
    assign data_out={d7,d6,d5,p4,d3,p2,p1};
    
    //parity :even parity
    //p1:1,3,5,7
    assign p1=d3^d5^d7;
    //p2:2,3,6,7
    assign p2=d3^d6^d7;
    //p3:4,5,6,7;
    assign p4=d5^d6^d7;
    
endmodule

