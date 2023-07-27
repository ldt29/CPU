`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/26 17:35:28
// Design Name: 
// Module Name: test_cpu
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

`timescale 1ns / 1ns
module test_cpu();

reg reset;
reg clk;
wire [12:0] ssd;

CPU cpu_0(
      .clk(clk), .reset(reset), .uart_on(0),
      .ssd(ssd)
    );

initial
  begin
    clk = 1;
    reset = 1;
    #10 reset = 0;
  end

always #5 clk = ~clk;

endmodule
