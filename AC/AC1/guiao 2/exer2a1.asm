


.data
.text
.globl main 

main:
	ori $t0, $0, 6	# colocar os valores nos registo $t0 e $t1.
	ori $t1, $0, 4
	and $t2, $t0, $t1 
	or  $t3, $t0, $t1
	nor $t4, $t0, $t1
	xor $t5, $t0, $t1
	
	jr $ra	# fim do programa