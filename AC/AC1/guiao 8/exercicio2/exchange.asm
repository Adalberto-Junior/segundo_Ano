.data
.text
.globl exchange

exchange:
	 lb $t0, 0($a0)		# char aux = *c1
	 lb $t1, 0($a1)		# *c1 = *c2
	 sb $t0, 0($a1)		# c2 = aux
	 sb $t1, 0($a0)	
	
	 jr $ra