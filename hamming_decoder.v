`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2026 10:58:50
// Design Name: 
// Module Name: hamming_decoder
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


module hamming_decoder(
input [6:0]code_in,output [3:0]data_out,output [2:0] error_pos,
output error_detected,output [6:0] corrected_code
    );
    
    wire d3,d5,d6,d7;
    wire p1,p2,p4; 
    wire s1,s2,s3;
    wire syndrome;
    assign {d7,d6,d5,p4,d3,p2,p1}=code_in;
    
    //1,3,5,7
    assign s1=p1^d3^d5^d7;
    
    //2,3,6,7
    assign s2=p2^d3^d6^d7;
    
    //4,5,6,7;
    assign s3=p4^d5^d6^d7;
    
    assign syndrome={s3,s2,s1};
    assign error_pos=syndrome;
    assign error_detected=(syndrome!=3'b000);
    
    //for correction to be done
    reg [6:0] corrected;
    
    always@(*) begin
       corrected=code_in;
        case(syndrome)
          
           3'b000:corrected=code_in;
           3'b001:corrected=code_in^7'b0000001;
           3'b010:corrected=code_in^7'b0000010;
           3'b011:corrected=code_in^7'b0000100;
           3'b100:corrected=code_in^7'b0001000;
           3'b101:corrected=code_in^7'b0010000;
           3'b110:corrected=code_in^7'b0100000;
           3'b111:corrected=code_in^7'b1000000;
    
          default:corrected='bx;
      endcase
     end 
    assign corrected_code=corrected;
    assign data_out[0]=corrected_code[2];
    assign data_out[1]=corrected_code[4];
    assign data_out[2]=corrected_code[5];
    assign data_out[3]=corrected_code[6];
endmodule
