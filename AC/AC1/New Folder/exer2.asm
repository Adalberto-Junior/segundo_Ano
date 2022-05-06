.data
   .eqv size, 3
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "Ponteiros"
array: .word str1, str2, str3
.text
.globl main

main:

   la $t0, array   # p = array
   li $t3, size
   sll $t3, $t3, 2
   addu $t1, $t0, $t3  # pultimo = array + size

for: bge $t0, $t1, endf   # while(p < pultimo)
     
     lw $a0, 0($t0)  # $a0 = *p
     li $v0, 4
     syscall
     
     li $a0, '\n'
     li $v0, 11
     syscall
     
     addiu $t0, $t0, 4  # p++;
     j for

endf: jr $ra
