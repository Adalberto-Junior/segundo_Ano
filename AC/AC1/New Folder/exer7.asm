.data
str: .asciiz "2020 e 2024 sao anos bissextos"
.text
.globl main
main:
     addiu $sp, $sp, -4   # arranjar espaço na stack
     sw $ra, 0($sp)       # salvaguardar o contéundo de $ra na stack
     
     la $a0, str #
     jal atoi    # atoi(str)
     move $a0, $v0   #
     li $v0, 1       #
     syscall         #
     
     li $v0, 0       # return 0
     
     lw $ra, 0($sp)      # repor valor do registo $ra
     addiu $sp, $sp, 4   # libertar espaço na stack
end: jr $ra


atoi:  
       li $t0, 0  # res = 0;
while: lb $t1, 0($a0) # $t1 = *s
       blt $t1, 0x30, endw  # while((*s >= 0) &&
       bgt $t1, 0x39, endw  # *s <= '9' )){
       sub $t2, $t1, 0x30   # digit = *s - '0'
       addiu $a0, $a0, 1    # s++;
       mul $t0, $t0, 10     # res = res * 10
       add $t0, $t0, $t2   # res = res * 10  +digit
       j while              #}
endw:  move $v0, $t0        # return res
       jr $ra                # fim
      