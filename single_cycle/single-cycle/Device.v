module Device(
	input  reset    , 
	input  clk      , 
	input  MemRead  , 
	input  MemWrite ,
	input  [32 -1:0] MemBus_Address     , 
	input  [32 -1:0] MemBus_Write_Data  , 
	output [32 -1:0] Device_Read_Data
);

	// device registers
	reg [31:0] reg_op;
	reg [31:0] reg_start;
	reg [31:0] reg_ans;
    
	// -------- Your code below (for question 3) --------
	always @(*)
        if(MemWrite == 1)
            case (MemBus_Address)
               32'h40000000: reg_op <= MemBus_Write_Data;
               32'h40000008: begin
                    reg_start <= MemBus_Write_Data;
                    if (reg_start != 0)
                        reg_start = 32'h00000001;
               end
            endcase
    

    assign Device_Read_Data = reg_ans;
        
    reg [31:0] t;
    always @(posedge reset or posedge clk)
        if (reset) begin
            reg_op <= 32'h00000000;
            reg_start <= 32'h00000000; 
            reg_ans <= 32'h00000000;
        end
        else begin
            case (reg_start)
                32'h00000001: begin
                    reg_ans <= 32'h00000001;
                    t <= reg_op;
                    reg_start <= 32'h00000002;
                end
                32'h00000002: begin 
                    reg_ans <= reg_ans + t;
                    t <= t * reg_op;
                    reg_start <= 32'h00000003;
                end
                32'h00000003: begin 
                    reg_ans <= reg_ans + t;
                    t <= t * reg_op;
                    reg_start <= 32'h00000004;
                end
                32'h00000004: begin 
                    reg_ans <= reg_ans + t;
                    t <= t * reg_op;
                    reg_start <= 32'h00000005;
                end
                32'h00000005: begin 
                    reg_ans <= reg_ans + t;
                    reg_start <= 32'h00000000;
                end
            endcase
        end
	
	// -------- Your code above (for question 3) --------

endmodule
