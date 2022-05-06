	.data
x1:	.asciiz "TEST1	
	.align 2
x2:	.space 20
x3:

	.text
	.globl main
main:	la $t4, x2
	la $t6, x1
	la $t7, x3 
	sub $s0, $t7, $t6
	ori $t5, $0, 4
	xor $t0, $t0, $t0
	xor $t1, $t1, $t1
l1:	beq $t0, $t5, l2
	add $t2, $t0, $t0
	add $t3, $t2, $t2
	addu $t3, $t3, $t4
	sw $t2, 0($t3)
	add $t1, $t1, $t2
	addi $t0, $t0, 1
	j l1
l2: 	sw $t1, 4($t3)

       	or $a0, $0, $t0
	li $v0, 1
	syscall
	
	ori $a0, $0, '\n'
	li $v0, 11
	syscall
	 
        or $a0, $0, $t1
	li $v0, 1
	syscall
	
	ori $a0, $0, '\n'
	li $v0, 11
	syscall
	
	or $a0, $0, $t2
	li $v0, 1
	syscall
	
	ori $a0, $0, '\n'
	li $v0, 11
	syscall
	 
        or $a0, $0, $t3
	li $v0, 1
	syscall
	
	ori $a0, $0, '\n'
	li $v0, 11
	syscall
	
	or $a0, $0, $t4
	li $v0, 1
	syscall
	
	ori $a0, $0, '\n'
	li $v0, 11
	syscall
	 
        or $a0, $0, $t5
	li $v0, 1
	syscall
	
	ori $a0, $0, '\n'
	li $v0, 11
	syscall
	 
        or $a0, $0, $t6
	li $v0, 4
	syscall
	
	ori $a0, $0, '\n'
	li $v0, 11
	syscall
	
	 or $a0, $0, $t7
	li $v0, 1
	syscall
	
	ori $a0, $0, '\n'
	li $v0, 11
	syscall
	
	 or $a0, $0, $s0
	li $v0, 1
	syscall
	
jr $ra