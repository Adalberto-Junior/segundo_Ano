.data
.text
.globl strlen

strlen:  li $t1, 0		#len = 0; 
while:   lb $t0, 0($a0)		# while(*s++ != '\0') 1 fazer load byte
         addiu $a0, $a0, 1	# 2 encrementa a o ponteiro
         beq $t0, '\0', endw 	#{ 3 fazer a comparação
         addi $t1, $t1, 1   	# len = $t1++;
         j while   	  	# }
endw:    move $v0, $t1 	   	# return len
	 jr $ra
