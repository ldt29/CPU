
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
jal  dijkstra

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

# sll $a0,$t8,2
# addi $a0,$a0,16
# sw $s6,0($a0)

loop:
j loop

#li $v0,17
#syscall

dijkstra:
##### YOUR CODE HERE #####

# Initialization

la   $t1, dist
sw   $zero, 0($t1)

li   $t0, 1

la   $t2, visited
sw   $t0, 0($t2)

add $t3, $a1, $zero
init:

addi $t3, $t3, 4
lw   $t4, 0($t3)    # graph[i]

addi $t1, $t1, 4
sw   $t4, 0($t1)    # dist[i]

addi $t2, $t2, 4
sw   $zero, 0($t2)  # visited[i]

addi $t0, $t0, 1
blt  $t0, $a0, init

# Greedy search
li   $t0, 1
for:
# Search for nearest unvisited node
li   $t3, -1      # u
li   $t4, -1      # mid_dist
li   $t5, 1       # v
for1:
la   $t2, visited
sll  $t5, $t5, 2
add  $t2, $t2, $t5  
srl  $t5, $t5, 2
lw   $t6, 0($t2)    # visited[v]

la   $t1, dist
sll  $t5, $t5, 2
add  $t1, $t1, $t5  
srl  $t5, $t5, 2
lw   $t7, 0($t1)    # dist[v]

sne  $t8, $t6, $zero
seq  $t9, $t7, -1
or   $t8, $t8, $t9
bne  $t8, $zero, continue1

seq  $t8, $t4, -1
slt  $t9, $t7, $t4
or   $t8, $t8, $t9
beq  $t8, $zero, continue1

move $t4, $t7
move $t3, $t5 

continue1:

addi $t5, $t5, 1
blt  $t5, $a0, for1

beq  $t4, -1, return

# Update
la   $t2, visited
sll  $t3, $t3, 2
add  $t2, $t2, $t3  # visited[u]
srl  $t3, $t3, 2

li   $t5, 1        # v
sw   $t5, 0($t2)
for2:

la   $t2, visited
sll  $t5, $t5, 2
add  $t2, $t2, $t5  
srl  $t5, $t5, 2
lw   $t6, 0($t2)    # visited[v]

bne  $t6, $zero, continue2

sll  $t3, $t3, 5
add  $t6, $t3, $t5  # addr
srl  $t3, $t3, 5

move $t1, $a1
sll  $t6, $t6, 2
add  $t1, $t1, $t6  
srl  $t6, $t6, 2
lw   $t7, 0($t1)    # graph[addr]

beq  $t7, -1, continue2


la   $t1, dist
sll  $t5, $t5, 2
add  $t1, $t1, $t5  
srl  $t5, $t5, 2
lw   $t6, 0($t1)    # dist[v]

seq  $t8, $t6, -1
add  $t7, $t7, $t4  # min_dist + graph[addr]
sgt  $t9, $t6, $t7
or   $t8, $t8, $t9

beq  $t8, $zero, continue2

sw   $t7, 0($t1)



continue2:

addi $t5, $t5, 1
blt  $t5, $a0, for2


addi $t0, $t0, 1
blt  $t0, $a0, for

return:
jr $ra
