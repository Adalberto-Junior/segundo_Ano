# Mapa dos Registos
# i: $t0,
# v: $t1,
# &val[0]: $t2;
# temp: $t3;
# temp2: $t4;
# temp3: $t5
.data

str1: .asciiz "Result is: "
str2: .asciiz " , "
       .eqv size, 8
val: .word 8, 4, 15, -1987, 327, -9, 27, 16
      #.space 8
.text
.globl main
main:

	li $t0, 0		 # i = $t0 = 0;
	li $t5, size		 #$t5 = size = 8
	sra $t5, $t5, 1 	# $t5 = size/5
do: 				#{
	la $t2, val		 # $t2 = val[] 
	sll $t0, $t0, 2 	 # i = i *4
	addu $t3, $t2, $t0	 # Temp = val[i]
	sw $t1, 0($t3)		 # v = val[i]
	sra $t2, $t2, 1 	 # val = val[size/2]
	addu $t4, $t3, $t2	# $t4 = val[i+size/2]
	move $t3, $t4		 #$t3 = val[i] = $t4 = val[i+size/2] 
	move $t4, $t1  		 # val[i +size/2] = v
	
        addi $t0, $t0, 1 	# ++i;
        blt $t0, $t5, do	# while(++i < size/2)
        			# }
       
enddo: 	la $a0, str1		# print_string(str1)
	li $v0, 4
	syscall
	
	li $t0, 0		# i=0
	
do1:    			#{
	addi $t0, $t0, 1	# i++;
	move $a0, $t3
	li $v0, 1
	syscall
	
	#li $a0, ' , '
	li $a0, ','
	li $v0, 11
	syscall
	
	bge $t0, size, endw	# while(i < size)
		j do1		# }
		
endw: jr $ra
