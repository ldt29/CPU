module BCD7_show(
	reset,
	din,
	clk_1K,
	an,
	dout,
	light,
	dp
);

input reset;
input [15:0] din;
input  clk_1K;
output [3:0] an;
output [6:0] dout;
input light;
output dp;

reg [6:0] dout;
reg [1:0] mark;
reg [3:0] an;
reg  dp;


always @(negedge clk_1K or posedge reset)//控制显示位的动态刷新
begin
if(reset) an<=4'b1111;//reset,不显示结果
else begin
if(~light)  begin an<=4'b1111;
dp<=1;//led灯未亮，不显示结果
end
else begin
if(din!=0) //未结束计时，不显示结果
begin
case(mark)
  2'b00:begin mark<=mark+1;
      an<=4'b1110;
      dp<=1;
	  end
  2'b01:begin mark<=mark+1;	
      an<=4'b1101;
      dp<=0;
        end	 
  2'b10:begin mark<=mark+1;
      an<=4'b1011;
      dp<=1;
        end
  default:begin mark=2'b00;
      an<=4'b0111;
      dp<=1;
        end       
     endcase
end
end
end
end


always @(*)//数码管数字显示
begin
case(mark)
 2'b00:begin
    case(din[15:12])
         4'h0:dout<=7'b1000000;    
		 4'h1:dout<=7'b1111001;
		 4'h2:dout<=7'b0100100;
		 4'h3:dout<=7'b0110000;	 
		 4'h4:dout<=7'b0011001;
		 4'h5:dout<=7'b0010010;
	     4'h6:dout<=7'b0000010;
		 4'h7:dout<=7'b1111000;
		 4'h8:dout<=7'b0000000;
		 4'h9:dout<=7'b0010000;
		 default:dout<=7'b1111111;
	  endcase
	  end
  2'b01:begin 
        case(din[11:8])
           4'h0:dout<=7'b1000000;    
           4'h1:dout<=7'b1111001;
           4'h2:dout<=7'b0100100;
           4'h3:dout<=7'b0110000;     
           4'h4:dout<=7'b0011001;
           4'h5:dout<=7'b0010010;
           4'h6:dout<=7'b0000010;
           4'h7:dout<=7'b1111000;
           4'h8:dout<=7'b0000000;
           4'h9:dout<=7'b0010000;
           default:dout<=7'b1111111;
        endcase
        end	 
  2'b10:begin
        case(din[7:4])
           4'h0:dout<=7'b1000000;    
           4'h1:dout<=7'b1111001;
           4'h2:dout<=7'b0100100;
           4'h3:dout<=7'b0110000;     
           4'h4:dout<=7'b0011001;
           4'h5:dout<=7'b0010010;
           4'h6:dout<=7'b0000010;
           4'h7:dout<=7'b1111000;
           4'h8:dout<=7'b0000000;
           4'h9:dout<=7'b0010000;
           default:dout<=7'b1111111;
        endcase  
        end
   default:begin
           case(din[3:0])
              4'h0:dout<=7'b1000000;    
              4'h1:dout<=7'b1111001;
              4'h2:dout<=7'b0100100;
              4'h3:dout<=7'b0110000;     
              4'h4:dout<=7'b0011001;
              4'h5:dout<=7'b0010010;
              4'h6:dout<=7'b0000010;
              4'h7:dout<=7'b1111000;
              4'h8:dout<=7'b0000000;
              4'h9:dout<=7'b0010000;
              default:dout<=7'b1111111;
          endcase  
          end       
     endcase
end


endmodule


