# i: $t0
# lista: $t1
#lista + i: $t2

.data
       .eqv size,5
str1:  .asciiz "\nIntroduza um numero: "
       .align 2
lista: .space 20	# size *4(5 *4)
       .eqv read_int, 5
       .eqv print_string, 4
.text

.globl main

main: li $t0, 0			# i = 0;

while:	bge $t0, size, endw  	# while(i < size)
	la $a0, str1
	li $v0, 4
	syscall 
	
	li $v0, read_int	# $v0 = readInt
	syscall
	
	la $t1, lista 		# $t1 = &lista[0]
	sll $t2, $t0, 2		# lista +i = i*4
	addu $t2, $t1, $t2	# $t2 = & lista[i]
	sw $v0, 0($t2)		# lista[i] = readInt
	addi $t0, $t0, 1	# i++
    j while	
    
endw: jr $ra