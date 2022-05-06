# Mapa de registos: 
# $t0 – value 
# $t1 – bit 
# $t2 - i 
 .data 
str1: .asciiz "Introduza um numero: " 
str2: .asciiz "\n O valor em binario e: "
 .eqv print_string,4 
 .eqv read_int,5 
 .eqv print_char,11

.text 
 .globl main 
main: la $a0,str1 
 li $v0,print_string		 # (instrução virtual) 
 syscall			 # print_string(str1); 
 li $v0, 5				 # value=read_int(); 
 syscall
 la $a0,str2				 # print_string("str2"); 
 li $v0, 4
 syscall
 #move $t2, $v0
 li $t2,0			 # i = 0 
for: bge $t2,32,endfor		 # while(i < 32) { 
     rem $t3, $t2, 4		# i % 4
     beqz  $t3, el
     
andit:  andi $t1,$t2,0x80000000 	# (instrução virtual) 
 	bgt $t1,$0,else 		# if(bit != 0) 
     	ori $a0, $0, '1'		# print_char('1');
     	#li $a0, 1
     	li $v0, 11
    	 syscall 
el:	ori $a0, $0, ' ' 	#print_char ('  ')
	li $v0, 11
	syscall
     j andit			#jumb andit
	
else: 				# else 
      ori $a0, $0,'0'		# print_char('0'); 
      li $v0, 11
      syscall 
      sll $t0, $t0, 1			# value = value << 1; 
      addi $t2, $t2, 1			# i++; 
 j for 				# } 
endfor: 			# 
 jr $ra				 # fim do programa 
