module SSD(
         input clk, 
         input reset,
         input MemWrite, 
         input [31:0] write_data, 
         output [12:0] ssd
       );
reg dp;
reg [6:0] read_ssd;
reg [3:0] an;
reg light;

assign ssd = {light,an,dp,read_ssd};

wire clk_1K;
reg [31:0] din;
reg [1:0] mark;

always @ (posedge clk)
  begin
      if (MemWrite)
        begin
        din <= write_data;
        light <= 1;
        end
  end

clk_gen clk_gen(
    .clk(clk),
    .reset(reset),
    .clk_1K(clk_1K)
);

always @(negedge clk_1K or posedge reset)
    begin
    if(reset) an <= 4'b1111;//reset,????????
    else
    begin
    case(mark)
      2'b00:begin mark<=mark+1;
          an <= 4'b0010;
          dp <= 1;
          case(din[11:8])
               4'h0:read_ssd<=7'b1111110;    
               4'h1:read_ssd<=7'b0000110;
               4'h2:read_ssd<=7'b1101101;
               4'h3:read_ssd<=7'b1001111;     
               4'h4:read_ssd<=7'b1100110;
               4'h5:read_ssd<=7'b1101101;
               4'h6:read_ssd<=7'b1111101;
               4'h7:read_ssd<=7'b0000111;
               4'h8:read_ssd<=7'b1111111;
               4'h9:read_ssd<=7'b1101111;
               default:read_ssd<=7'b0000000;
            endcase
            end
      2'b01:begin mark<=mark+1;    
          an <= 4'b0100;
          dp <= 1;
           case(din[7:4])
            4'h0:read_ssd<=7'b1111110;    
            4'h1:read_ssd<=7'b0000110;
            4'h2:read_ssd<=7'b1101101;
            4'h3:read_ssd<=7'b1001111;     
            4'h4:read_ssd<=7'b1100110;
            4'h5:read_ssd<=7'b1101101;
            4'h6:read_ssd<=7'b1111101;
            4'h7:read_ssd<=7'b0000111;
            4'h8:read_ssd<=7'b1111111;
            4'h9:read_ssd<=7'b1101111;
            default:read_ssd<=7'b0000000;
         endcase
            end     
      2'b10:begin mark<=mark+1;
          an <= 4'b1000;
          dp <= 1;
           case(din[3:0])
                   4'h0:read_ssd<=7'b1111110;    
                  4'h1:read_ssd<=7'b0000110;
                  4'h2:read_ssd<=7'b1101101;
                  4'h3:read_ssd<=7'b1001111;     
                  4'h4:read_ssd<=7'b1100110;
                  4'h5:read_ssd<=7'b1101101;
                  4'h6:read_ssd<=7'b1111101;
                  4'h7:read_ssd<=7'b0000111;
                  4'h8:read_ssd<=7'b1111111;
                  4'h9:read_ssd<=7'b1101111;
                  default:read_ssd<=7'b0000000;
            endcase
            end
      default:begin mark<= 2'b00;
          an <= 4'b0001;
          dp <= 1;
           case(din[15:12])
                4'h0:read_ssd<=7'b1111110;    
               4'h1:read_ssd<=7'b0000110;
               4'h2:read_ssd<=7'b1101101;
               4'h3:read_ssd<=7'b1001111;     
               4'h4:read_ssd<=7'b1100110;
               4'h5:read_ssd<=7'b1101101;
               4'h6:read_ssd<=7'b1111101;
               4'h7:read_ssd<=7'b0000111;
               4'h8:read_ssd<=7'b1111111;
               4'h9:read_ssd<=7'b1101111;
               default:read_ssd<=7'b0000000;
               endcase  
            end       
         endcase            
    end
    end

endmodule
