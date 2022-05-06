.data
stg: .word 72343
     .asciiz "Napoleao"
     .space 9
     .asciiz "Bonaparte"
     .space 5
     .float 5.1
str: .asciiz "\nN.Nec: "
str1: .asciiz "\nNome: "
str2: .asciiz "\nNota: "
.text
.globl main 
main:
     
     la $t0, stg
     la $a0, str  # print_string(str)
     li $v0, 4    #
     syscall      #
     lw $a0, 0($t0)  #
     li $v0, 36      #
     syscall         #
      
     la $a0, str1   # print_string(str1)
     li $v0, 4      #
     syscall      #
     addiu $a0, $t0, 22    #
     li $v0, 4       #
     syscall          #
     addiu $a0, $t0, 4 #
     li $v0, 4       #
     syscall           #
     
     la $a0, str2  # print_string(str2)
     li $v0, 4     #
     syscall       #
     l.s $f12, 40($t0)  #
     li $v0, 2          #
     syscall            #
     
     li $v0, 0    # return 0;

fim: jr $ra