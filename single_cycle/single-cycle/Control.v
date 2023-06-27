
module Control(
	input  [6 -1:0] OpCode   ,
	input  [6 -1:0] Funct    ,
	output [2 -1:0] PCSrc    ,
	output Branch            ,
	output RegWrite          ,
	output [2 -1:0] RegDst   ,
	output MemRead           ,
	output MemWrite          ,
	output [2 -1:0] MemtoReg ,
	output ALUSrc1           ,
	output ALUSrc2           ,
	output ExtOp             ,
	output LuOp              ,
	output [4 -1:0] ALUOp
);
	
	// Add your code below (for question 2)

	// Your code below (for question 1)
    assign PCSrc[1:0] = 
	    (OpCode == 6'h02 || OpCode == 6'h03)? 2'b01: //j jal
        (OpCode == 6'h00 && (Funct == 5'h08 || Funct == 5'h09))? 2'b10://jr jalr
        2'b00;
       
    assign Branch = 
        (OpCode == 6'h04)? 1'b1://beq
        1'b0;
    
    assign RegWrite =
        (OpCode == 6'h2b || OpCode == 6'h04 || OpCode == 6'h02 || OpCode == 6'h00 && Funct == 5'h08)? 1'b0:
        1'b1;
    
    assign RegDst[1:0] = 
        (OpCode == 6'h00 || OpCode == 6'h1c)? 2'b01://R-type
        (OpCode == 6'h03)? 2'b10:
        2'b00;//I-type
        
    assign MemRead = 
        (OpCode == 6'h23)? 1'b1://lw
        1'b0;
        
    assign MemWrite =
        (OpCode == 6'h2b)? 1'b1://sw
        1'b0;
        
    assign MemtoReg =
        (OpCode == 6'h23)? 2'b01://lw
        (OpCode == 6'h03 || OpCode == 6'h00 && Funct == 5'h09)? 2'b10://jal jalr
        2'b00;
    
    assign ALUSrc1 =
        (OpCode == 6'h00 && (Funct == 5'h00 || Funct == 5'h02 || Funct == 5'h03))? 1'b1://shamt
        1'b0;//rs
        
    assign ALUSrc2 =
        (OpCode == 6'h00 || OpCode == 6'h04 || OpCode == 6'h1c)? 1'b0://rt
        1'b1;//imm
    
    assign ExtOp =
        (OpCode == 6'h0c)? 1'b0://zero
        1'b1;//sign
    
    assign LuOp =
        (OpCode == 6'h0f)? 1'b1://lui
        1'b0;
	
	// Your code above (for question 1)

	// set ALUOp
	assign ALUOp[2:0] = 
		(OpCode == 6'h00)? 3'b010://R-type 
		(OpCode == 6'h04)? 3'b001://beq 
		(OpCode == 6'h0c)? 3'b100://and 
		(OpCode == 6'h0a || OpCode == 6'h0b)? 3'b101://slt
		(OpCode == 6'h1c)? 3'b110://mul 
		3'b000;//add
		
	assign ALUOp[3] = OpCode[0];

	// Add your code above (for question 2)
	
endmodule