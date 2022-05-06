.data
.text 
.globl main
main:
	
	ori $t1, $0, 8
	srl $t2, $t1, 1
	xor $t0, $t1, $t2
	
	jr $ra
	