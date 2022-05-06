.data
	.eqv size, 20
	.eqv read_string, 8
	.eqv print_int10, 1
	
#Mapa de registos:
#num: $t0,
# p : $t1,
#*p : $t2
#str: $t3
#str+i : $t4
	
str: .space 21
.text

.globl main

main:	la $a0, str		# $a0 = &str[0]
     	li $a1, size		#
     	li $v0, read_string
     	syscall
     	
	li $t0, 0	# num = 0;
	la $t1, str	#p = str
	
while:  lb $t2, 0($t1)
	beq $t2,0, endw
if:	blt $t2, '0', endif	#if *p => '0' &&
	bgt $t2, '9', endif	#if *p <= 9
	addi $t0, $t0, 1	# num++

endif: addiu $t1, $t1, 1
	j while

endw: move $a0, $t0
      li $v0, print_int10	
      syscall

jr $ra
