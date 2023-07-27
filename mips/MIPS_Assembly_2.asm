addi $a0 $zero 5	# x = 5
jal g_x                # calc x^4 + x^3 + x^2 + x + 1
addi $s0 $v0 0        # $s0 = g(x)
addi $a0 $zero 7    # y = 7
jal h_y                # calc y^2 + y
addi $s1 $v0 0        # $s1 = h(y)
sub $s2 $s0 $s1        # $s2 = f(x, y)
loop:
 j loop                 # end
g_x:
 addi $t0 $zero 1    # partial sum $t0 = 1
 addi $t1 $a0 0        # $t1 = x
 add $t0 $t0 $t1        # $t0 = 1 + x
 mul $t1 $t1 $a0        # $t1 = x^2
 add $t0 $t0 $t1        # $t0 = 1 + x + x^2
 mul $t1 $t1 $a0        # $t1 = x^3
 add $t0 $t0 $t1        # $t0 = 1 + x + x^2 + x^3
 mul $t1 $t1 $a0        # $t1 = x^4
 add $t0 $t0 $t1        # $t0 = 1 + x + x^2 + x^3 + x^4
 addi $v0 $t0 0        # $v0 = $t0
 jr $ra                # return g(x)
h_y:
 add $t0 $zero $a0    # partial sum $t0 = y
 mul $t1 $a0 $a0        # $t1 = y^2
 add $t0 $t0 $t1        # $t0 = y + y^2
 addi $v0 $t0 0        # $v0 = $t0
 jr $ra                # return h(y)