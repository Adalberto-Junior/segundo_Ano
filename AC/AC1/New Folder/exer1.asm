.data
      .eqv size, 3
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros"
array: .word str1, str2, str3
.text
.globl main
main:
     li $t0, 0   # i = 0;
     

for: bge $t0, size, endf   # while(i < size) 
     la $t2, array   # $t2 = array
     sll $t1, $t0, 2
     addu $t2, $t2, $t1    # $t2 = array[i]
     
     lw $a0, 0($t2)    
     li $v0, 4
     syscall
     
     li $a0, '\n'
     li $v0, 11
     syscall
     
     addiu $t0, $t0, 1   # i++;
     j for
endf: jr $ra

