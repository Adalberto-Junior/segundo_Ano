.data
	.eqv size, 20
	.eqv read_string, 8
	.eqv print_int10, 1
str: .space, 21

# Mapa de registos 
# num: $t0 
# i: $t1 
# str: $t2 
# str+i: $t3 
# str[i]: $t4 

.text
.globl main

main: la $a0, str		# $a0 = &str[0]
      li $a1, size		#
      li $v0, read_string
      syscall
      li $t0, 0			# NUM = 0
      li $t1, 0			#i = 0
      
while: la $t2, str		# $t2 = str
	addu $t3, $t2, $t1	 # str + i
	lb $t4, 0($t3)		#stri[i]
	bge $t4, '0', endw	# if str[i] <= 0, print 0
if:	blt $t4, '0', endif
	bgt $t4, '9', endif
	addi $t0, $t0, 1

endif: addi $t1, $t1, 1

	j while
endw: move $a0, $t1
      li $v0, print_int10
      syscall
      
      jr $ra

      
      
