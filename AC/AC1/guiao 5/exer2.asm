
.data
str1:   .asciiz "; "
str2:   .asciiz "\n conteudo do array: "
lista:  .word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.eqv print_int10, 1
	.eqv print_string, 4
	.eqv size, 10
.text
.globl main

main: la $a0, str2	# print_string(str2)
      li $v0, 4
      syscall
      
      la $t0, lista	# p = lista
      li $t2, size
      sll $t2, $t2, 2
      addu $t2, $t2, $t0  # $t2 = lista + size

 while: bge $t0, $t2, fim	# while(p < lista + size)
 	lw  $a0, 0($t0)			# $t1 = *p
 	li $v0, 1		# print_int10(*p)
 	syscall 
 	la $a0, str1		# print_String(str1)
 	li $v0, 4
 	syscall

 	addiu $t0, $t0, 4	# p++
  j while 
   
fim: jr $ra
