`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2026 10:36:29
// Design Name: 
// Module Name: tb_hamming_encoder
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


module tb_hamming_encoder();
    
    reg [3:0]data_in;
    wire [6:0]data_out;//from encoder
    wire [3:0]data_out_decoder;
    wire [2:0] error_pos;
    wire error_detected;
    wire [6:0]corrected_code;
    
    //to check id error is corrected
    wire [6:0] data_out_temp;
    
    assign data_out_temp=data_out+1'b1;
    
    hamming_encoder dut1(data_in,data_out);
  //  hamming_decoder dut2(data_out,data_out_decoder,error_pos,error_detected,corrected_code);
     hamming_decoder dut2(data_out_temp,data_out_decoder,error_pos,error_detected,corrected_code);
  
   
 initial begin
    data_in=4'b1101;

    #1;
    $display("the data_in by encoder is %b",data_in);

    #10;
    $display("the value of data_out code given by encoder is %b",data_out);

    #10;
    $display("the data received by the decoder is %b",data_out_temp);

    #10;
    $display("the value of error_pos is %b",error_pos);

    #10;
    $display("error_detected is %b",error_detected);

    #10;
    $display("the value of data_out_decoder is %b",data_out_decoder);

    #10;
    $display("the value of corrected_code is %b",corrected_code);
end  
   

endmodule
