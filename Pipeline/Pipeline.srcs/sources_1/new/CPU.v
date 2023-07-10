`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/10 17:17:47
// Design Name: 
// Module Name: CPU
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


module CPU(
    input  reset                        , 
	input  clk                          , 
	output MemRead                      , 
	output MemWrite                     ,
	output [32 -1:0] MemBus_Address     , 
	output [32 -1:0] MemBus_Write_Data  , 
	input  [32 -1:0] Device_Read_Data 
);
    
endmodule
