.data
str: .asciiz "Arquiteturas de Computadores I"
.text
.globl main
main:
     addiu $sp, $sp, -4  # reservar espaço na stack
     sw $ra, 0($sp)     #salvargaudaer o valor de $ra na stack
     
     la $a0, str
     jal strlen
     
     move $a0, $v0
     li $v0, 1
     syscall
     
     lw $ra, 0($sp) # repor o valor de $ra
     addiu $sp, $sp, 4 # liberatr espaço na stack
fim: jr $ra

strlen: 
      li $t0, 0
while:
      lb $t1, 0($a0) #$t1 = *s;
      addiu $a0, $a0, 1 # s++
      beq $t1, '\0', endw
      addiu $t0, $t0, 1 # len++
      j while
endw: move $v0, $t0  # return len
      jr $ra