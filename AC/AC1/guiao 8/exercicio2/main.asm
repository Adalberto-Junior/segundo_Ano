.data
str: .space 330
     .eqv max_str_size, 33
.text
.globl main
main:

# Mapa de registos main 
# str: $s0 
# val: $s1
	addiu $sp, $sp, -12  	# reservar espa�o na stack
	sw $s0, 0($sp) 		# guardar o valor de $s0
	sw $s1, 4($sp) 		# guardar o valor de $s1
	sw $ra, 8($sp) 		# guardar o valor de $ra;
do: 
     la $s0, str		#{
     li $v0, 5  		# read_int()
     syscall
     or $s1,$0,  $v0  		# val = read_int()
     or $a0, $0, $s1 		# itoa(val, 2, str)
     ori $a1, $0, 2  		#
     or $a2, $0, $s0 		#
     jal itoa	     		#
     or $a0, $0, $v0  		# move o conte�do de $v0 para $a0;
     li $v0, 4 			# print_string(itoa(val, 2, str))
     syscall   			#
     
     or $a0, $0, $s1 		# itoa(val, 8, str)
     ori $a1, $0, 8  		#
     or $a2, $0, $s0 		#
     jal itoa	    		#
     or $a0, $0, $v0  		# move o conte�do de $v0 para $a0;
     li $v0, 4 			# print_string(itoa(val, 2, str))
     syscall   			#
     
     or $a0, $0, $s1 		# itoa(val, 16, str)
     ori $a1, $0, 16  		#
     or $a2, $0, $s0 		#
     jal itoa	     		#
     or $a0, $0, $v0  		# move o conte�do de $v0 para $a0;
     li $v0, 4 			# print_string(itoa(val, 2, str))
     syscall   			#

while: bne $s1, 0, do 	 	#while(val != 0)}
        li $v0, 0   		# return 0
        
        
	lw $s0, 0($sp) 		# repor o valor de $s0
	lw $s1, 4($sp) 		# repor o valor de $s1
	lw $ra, 8($sp) 		# repor o valor de $ra;
        addiu $sp, $sp, 12 	# libertar espa�o na stack
        
       jr $ra   		# fim do programa
     
	

    

    
