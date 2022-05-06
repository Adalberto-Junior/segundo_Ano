.data
val: .word 8, 4, 14, -1987, -9, 27, 16
str: .asciiz "Result is: "
     .eqv size, 8 
.text
.globl main
main:
#Mapa dos registos
# i: $t0
# v: $t1
# &(val[0]): $t2
    li $t0, 0  # i = 0
    #la $t2, val
do:   #{
   la $t2, val # $t2 = &(arry[0])
   sll $t5, $t0, 2  # $t0 =i * 4
   addu $t3, $t2, $t5  # $t3 = val[i]
   
  lw $t1, 0($t3) # v = val[i]
  lw $t4, 16($t3) # $t4 = val[i + size/2]
  sw $t4, 0($t3) # val[i] = va[i + size/2]
  sw $t1, 16($t3) # val[i + size/2] = v
  
  addi $t0, $t0, 1 #i++
while: blt $t0, 4, do  # while(++i < size/2)

    la $a0, str # print_string(str)
    li $v0, 4
    syscall #
    
    li $t0, 0  # i = 0;
do1: 
    la $t2, val
    sll $t3, $t0, 2  # obter i
    addu $t2, $t2, $t3
    
   lw $a0, 0($t2) # print_int10(val[i++])
   li $v0, 1    #
   syscall #
  
   addi $t0, $t0, 1 # i++;
   
    li $a0, ',' # print_char(',')
    li $v0, 11 #
    syscall #
while1: blt $t0, size, do1 # while(i < size)}  
 jr $ra   # fim do programa