module InstructionMemory(
	input      [32 -1:0] Address, 
	output reg [32 -1:0] Instruction
);
	
	always @(*)
		case (Address[9:2])

			// -------- Paste Binary Instruction Below (Inst-q1.txt, Inst-q2.txt, Inst-q3.txt)
            //		addi $a1 $zero 1	# $a1 = 1
            //        sw $a1 0($t1)        # set reg_start = 1
            //        addi $a0 $zero 7    # y = 7
            //        jal h_y                # calc y^2 + y
            //        addi $s1 $v0 0        # $s1 = h(y)
            //        lui $t2 0x4000
            //        addi $t2 $t2 4        # $t2 = address of reg_ans
            //        lw $s0 0($t2)        # $s0 = g(x)
            //        sub $s2 $s0 $s1        # $s2 = f(x, y)
            //    loop:
            //        j loop
            //    h_y:
            //        add $t0 $zero $a0    # partial sum $t0 = y
            //        mul $t1 $a0 $a0        # $t1 = y^2
            //        add $t0 $t0 $t1        # $t0 = y + y^2
            //        addi $v0 $t0 0        # $v0 = $t0
            //        jr $ra                # return h(y)
            
            8'd0:    Instruction <= 32'h20040005;
            8'd1:    Instruction <= 32'h3c084000;
            8'd2:    Instruction <= 32'h21080000;
            8'd3:    Instruction <= 32'had040000;
            8'd4:    Instruction <= 32'h3c094000;
            8'd5:    Instruction <= 32'h21090008;
            8'd6:    Instruction <= 32'h20050001;
            8'd7:    Instruction <= 32'had250000;
            8'd8:    Instruction <= 32'h20040007;
            8'd9:    Instruction <= 32'h0c100010;
            8'd10:    Instruction <= 32'h20510000;
            8'd11:    Instruction <= 32'h3c0a4000;
            8'd12:    Instruction <= 32'h214a0004;
            8'd13:    Instruction <= 32'h8d500000;
            8'd14:    Instruction <= 32'h02119022;
            8'd15:    Instruction <= 32'h0810000f;
            8'd16:    Instruction <= 32'h00044020;
            8'd17:    Instruction <= 32'h70844802;
            8'd18:    Instruction <= 32'h01094020;
            8'd19:    Instruction <= 32'h21020000;
            8'd20:    Instruction <= 32'h03e00008; 
			// -------- Paste Binary Instruction Above
			
			default: Instruction <= 32'h00000000;
		endcase
		
endmodule
