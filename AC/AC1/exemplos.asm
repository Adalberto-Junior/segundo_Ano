.eqv PRINT_STRING, 4
.data	# zona de dados
r1: .asciiz "Arquitectura"	#0x1001000
r2: .asciiz "de"		#100100c
r3: .asciiz "Computadores 1"	#100100f
.text	# zona de código
.globl main
main:
	ori $v0, $0, PRINT_STRING
	la $v0 r1
syscall 
jr $ra
