# Mapa de registos: 
# $t0 – soma 
# $t1 – value 
# $t2 - i 
 .data 
str1: .asciiz "Introduza um numero: " 
str2: .asciiz "Valor ingnorado\n"
str3: .asciiz " A soma dos positivos e: "
	.eqv print_string,4 
	.eqv read_int, 5
	
 .text 
 .globl main 
main: li $t0,0		 	   	# soma = 0; 
      li $t2, 0 			 # i = 0; 
for: bge $t2,5,endfor			 # while(i < 5) { 
     la $a0, str1			 # print_string("..."); 
     li $v0, 4	
     syscall
     li $v0, 5					 # value=read_int(); 
      syscall
       move $t1, $v0
 ble $t1,$0,else 			# if(value > 0) 
 add $t0,$t0, $t1 				# soma += value; 
 j  endif				 # 
else: la $a0, str2			 # else 
 	li $v0, 4
 	syscall				# print_string("..."); 
endif: addi $t2, $t2, 1			# i++; 
 j for 					# } 
endfor: 
 	la $a0, str3			# print_string("a soma dos positivos"); 
 	li $v0, 4
 	syscall
 	move $a0,$t0			 # print_int10(soma); 
 	li $v0, 1
 	syscall
 jr $ra