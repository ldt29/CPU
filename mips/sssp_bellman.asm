
.text
main:

# Parameters
li $s7, 1024
li $t0, 0
li $a0,6
li $s0,6
addi $a1, $t0, 4    # set $a1 to &graph

data_in:  #利用代码初始化
li $t8,0
sw $t8,0($a1)
li $t8,9
sw $t8,4($a1)
li $t8,3
sw $t8,8($a1)
li $t8,6
sw $t8,12($a1)
li $t8,-1
sw $t8,16($a1)
li $t8,-1
sw $t8,20($a1)
addi $a1,$a1,128
li $t8,9
sw $t8,0($a1)
li $t8,0
sw $t8,4($a1)
li $t8,-1
sw $t8,8($a1)
li $t8,3
sw $t8,12($a1)
li $t8,4
sw $t8,16($a1)
li $t8,1
sw $t8,20($a1)
addi $a1,$a1,128
li $t8,3
sw $t8,0($a1)
li $t8,-1
sw $t8,4($a1)
li $t8,0
sw $t8,8($a1)
li $t8,2
sw $t8,12($a1)
li $t8,-1
sw $t8,16($a1)
li $t8,5
sw $t8,20($a1)
addi $a1,$a1,128
li $t8,6
sw $t8,0($a1)
li $t8,3
sw $t8,4($a1)
li $t8,2
sw $t8,8($a1)
li $t8,0
sw $t8,12($a1)
li $t8,6
sw $t8,16($a1)
li $t8,-1
sw $t8,20($a1)
addi $a1,$a1,128
li $t8,-1
sw $t8,0($a1)
li $t8,4
sw $t8,4($a1)
li $t8,-1
sw $t8,8($a1)
li $t8,6
sw $t8,12($a1)
li $t8,0
sw $t8,16($a1)
li $t8,2
sw $t8,20($a1)
addi $a1,$a1,128
li $t8,-1
sw $t8,0($a1)
li $t8,1
sw $t8,4($a1)
li $t8,5
sw $t8,8($a1)
li $t8,-1
sw $t8,12($a1)
li $t8,2
sw $t8,16($a1)
li $t8,0
sw $t8,20($a1)

addi $a1,$t0,4


# Call Bellman-Ford
jal  bellman_ford

li $s6,0
addi $t8,$t0,0

# Print results
li   $t0, 1
add $t1,$s7,$zero

li   $s6, 0

print_entry:
addi $t1, $t1, 4
lw   $a0, 0($t1)
add  $s6,$s6,$a0
addi $t0, $t0, 1
sub  $s5, $t0, $s0
bltz  $s5, print_entry

lui $t8, 0x4000
addi $a0,$t8,0x10
sw $s6, 0($a0)


loop:
j loop

#li $v0,17
#syscall

bellman_ford:
##### YOUR CODE HERE #####

# Initialization

add   $t1, $s7, $zero
sw   $zero, 0($t1)

li   $t0, 1
li   $t2, -1
init:
addi $t1, $t1, 4
sw   $t2, 0($t1)
addi $t0, $t0, 1
blt  $t0, $a0, init


# Relaxation for (n - 1) times
li   $t0, 1
RforT:

# Relaxation on every edge each time
move $t2, $zero 
RonE1:

li $t3, 0
RonE2:
addi $sp, $sp, -12
sw   $a1, 0($sp)
sw   $t0, 4($sp)
sw   $t2, 8($sp)

sll  $t5, $t2, 5
add  $t4, $t5, $t3

add   $t1, $s7, $zero
sll  $t2, $t2, 2
add  $t1, $t1, $t2
srl  $t2, $t2, 2
lw   $t5, 0($t1)    # dist[u]  

add   $t1,$s7,$zero
sll  $t3, $t3, 2
add  $t1, $t1, $t3
srl  $t3, $t3, 2
lw   $t6, 0($t1)    # dist[v]

sll  $t4, $t4, 2
add  $a1, $a1, $t4
srl  $t4, $t4, 2
lw   $t7, 0($a1)    # graph[addr]

seq  $t0, $t5, -1
seq  $t2, $t7, -1
or   $t0, $t0, $t2
bne  $t0, $zero, continue

seq  $t0, $t6, -1
add  $t5, $t5, $t7  # dist[u] + graph[addr]
sgt  $t2, $t6, $t5 
or   $t0, $t0, $t2
beq  $t0, $zero, continue

add   $t1, $s7,$zero
sll  $t3, $t3, 2
add  $t1, $t1, $t3
srl  $t3, $t3, 2
sw   $t5, 0($t1) 


continue:
lw   $a1, 0($sp)
lw   $t0, 4($sp)
lw   $t2, 8($sp)
addi $sp, $sp, 12

addi $t3, $t3, 1
blt  $t3, $a0, RonE2

addi $t2, $t2, 1
blt  $t2, $a0, RonE1

addi $t0, $t0, 1
blt  $t0, $a0, RforT

jr   $ra
