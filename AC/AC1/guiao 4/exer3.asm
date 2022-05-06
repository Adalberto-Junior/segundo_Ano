.data
array: .word 7692, 23, 5, 234
	.eqv print_int10, 1
	.eqv size, 4
.text
.globl main
# Mapa de registos 
# p: $t0 
# pultimo:$t1 
# *p $t2 
# soma: $t3

main:
	li $t3,0	# soma = 0
	li $t4, size
	addi $t4, $t4, -1	#$t4 = size -1
	sll $t4, $t4, 2   # $t4 = size-1 *4
	la $t0, array     # $t0 = p = array[0]
	addu $t1, $t0, $t4	# $t1 = array + size-1

while: bgtu $t0, $t1, endw	# while(p <= pultimo) {
	lw $t2, 0($t0) 		 # $t2 = *p
	add $t3, $t3, $t2 	 #soma = soma + *p
	addiu $t0, $t0, 4	   # p++
  j while    			  #}
	
endw:  or $a0, $0, $t3    # print_int10(soma)
      li $v0, print_int10 #	
      syscall             #
      
fim: 	jr $ra     # fim do programa;

	
