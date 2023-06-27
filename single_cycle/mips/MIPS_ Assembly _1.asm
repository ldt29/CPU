.data
in_buff: .space 4
.text
la $t4, in_buff
addi $a0, $zero, 12123
addiu $a1, $zero, -12345
sll $a2, $a1, 16
sra $a3, $a2, 16
sw $a0 0($t4)
beq $a3, $a1, L1
lui $a0, 22222
L1:
add $t0, $a2, $a0
sra $t1, $t0, 8
addi $t2, $zero, -12123
slt $v0, $a0, $t2
sltu $v1, $a0, $t2
lw $t3, 0($t4)
Loop:
j Loop