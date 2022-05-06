# Mapa de registos 
# ... 
# houve_troca: $t4 
# i: $t5 
# lista: $t6 
# lista + i: $t7

.data
	.eqv size, 10
str1:  .asciiz "Introduza os valores: "
str2: .asciiz "; "
       .align 2
lista: .space 40
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv false, 0
	.eqv true, 1
	
.text
.globl main
main:  
      la $t0, lista	# p = lista
      li $t2, size
      sll $t2, $t2, 2
      addu $t2, $t2, $t0  # $t2 = lista + size

while:	bge $t0, $t2, endw	# while(i < size)
	la $a0, str1		# print_string(str1)
	li $v0, 4
	syscall
	
	li $v0, read_int
	syscall
	
	sw	$v0, 0($t0)
	addi $t0, $t0, 4	#p++;
	j while
	
endw: #jr $ra
	
	la $t6,lista 		# 
do: 				# do { 
	li $t4, false 			# houve_troca = FALSE; 
	li $t5,0 		# i = 0; 
for: 	bge $t5, size, fimd 	# while(i < SIZE-1){ 
if: 	sll $t7, $t5, 2		# $t7 = i * 4 
 	addu $t7,$t7, $t6	 # $t7 = &lista[i] 
 	lw $t8, 0($t7)		 # $t8 = lista[i] 
 	lw $t9,4($t8) 			# $t9 = lista[i+1] 
 	ble $t8, $t9,endif 		# if(lista[i] > lista[i+1]){ 
 	sw $t8,4($t9)		 # lista[i+1] = $t8 
 	sw $t9,0($t8) 		# lista[i] = $t9 
 	li $t4,true		 # 
 				# } 
endif: addiu $t5, $t5, 1 	# i++; 
 	j for			 # } 
fimd: 	beq $t4, 1, do	 			# } while(houve_troca == TRUE); 


 	li $t5, 0
 	#la $t6, lista
while1: bge $t5, size, fim	# while(i <  size)
	sll $t2, $t5, 2		# lista +i = i *4
	addu $t2, $t2, $t7	# $t2 = &lista[i]
 	#lw  $a0, 0($t2)
 	move $a0, $t2			
 	li $v0, 1		# print_int10(*p)
 	syscall 
 	la $a0, str2		# print_String(str2)
 	li $v0, 4
 	syscall

 	addiu $t5, $t5, 1	# i++
  j while1  	
 		 
fim:	 jr $ra # termina o programa 
