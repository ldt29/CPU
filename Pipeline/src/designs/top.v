module top(
         sysclk, reset,
         ssd
       );
       
input sysclk;
input reset;
output [12:0] ssd;

wire [12:0] ssd1;
assign ssd = ssd1;

CPU cpu_0(
      .clk(sysclk), .reset(reset), .uart_on(0),
      .ssd(ssd1)
    );

endmodule

//module top(
//    sysclk,reset,
//    ssd
//);
//input sysclk;
//input reset;
//wire clk_1K;
//reg [1:0] mark;

//output reg [12:0] ssd;

//clk_gen clk_gen(
//    .clk(sysclk),
//    .reset(reset),
//    .clk_1K(clk_1K)
//);

//always @(negedge clk_1K or posedge reset)
//    begin
//    if(reset) ssd <= 13'b1111111111111;
//    else
//    begin
//    case(mark)
//      2'b00:begin mark<=mark+1;
//            ssd <= 13'b1000101111110;
//            end
//      2'b01:begin mark<=mark+1;    
//            ssd <= 13'b1001001111110;
//            end     
//      2'b10:begin mark<=mark+1;
//            ssd <= 13'b1010001101101;
//            end
//      default:begin mark<= 2'b00;
//            ssd <= 13'b1100001101101;
//            end       
//         endcase            
//    end
//    end
    
////assign ssd = 13'b1001011111111;
       
//endmodule