.data
str: .asciiz "101101 e 2024 sao anos bissextos"
.text
.globl main
main:
# Mapa de registos 
# res: $v0 
# s: $a0 
# *s: $t0 
# digit: $t1 

	addiu $sp, $sp, -4  # reservar espaço na stack
	sw $ra, 0($sp)      # guarda o valor de $ra na stack
	la $a0, str 	    # $a0 = str;
	jal atoi	    # chama a função atoi
	move $a0, $v0       # copia o resultado de atoi(str) para $a0;
	li $v0, 1           # print_int10(atoi(str));
	syscall		    #
	
	li $v0, 0          # return 0;
	lw $ra, 0($sp)     # repoe o valor de $ra;
	addiu $sp, $sp, 4  # liberta o espaço na stack;
	 
	jr $ra   # fim do programa; 

atoi:  li $v0, 0            # res = 0;
while: lb $t0, 0($a0)       #  while(*s >= '0'  && *s <= '9')
       blt $t0, 0x30, endw  #
       bgt $t0, 0x31, endw  #
       sub $t1, $t0, 0x30   # digit = *s - '0'
       addiu $a0, $a0, 1    # s++;
       mul $v0, $v0, 2     # res = 2 * res;
       add $v0, $v0, $t1    # res = res + digit;
       j while       	    # }
endw: jr $ra    	    # retorna a chamadora

