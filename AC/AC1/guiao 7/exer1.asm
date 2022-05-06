# Mapa dos registos:
# len : $t1
# s : $s0
.data
str1: .asciiz "Arquitetura de Computadores"
.text
.globl main
main:
sb1: 	addiu $sp, $sp, -4	# reservar o espaço na stack
	sw $ra, 0($sp)		# savagualdar o $ra na stack
	
	la $a0, str1		# $s0 = str[]
	
	   jal strlen		# strlen(str)


	move $a0, $v0		# $a0 = $v0
	li $v0, 1
	syscall 		# print_int10(strlen(str))
	li $v0, 0		#return 0
	
	lw $ra, 0($sp)		# devolver o valor de $ra
	addiu $sp, $sp, 4	# libertar o espaço na stack
	jr $ra
	

strlen: li $t1, 0	#len = 0; 
while: lb $t0, 0($a0)	# while(*s++ != '\0') 1 fazer load byte
       addiu $a0, $a0, 1 # 	2 encrementa a o ponteiro
       beq $t0, '\0', endw #{ 3 fazer a comparação
       addi $t1, $t1, 1    # len = $t1++;
       j while   	   # }
endw: move $v0, $t1 	   # return len
	jr $ra
