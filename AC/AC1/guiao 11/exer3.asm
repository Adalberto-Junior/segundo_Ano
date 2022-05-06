.data
.align 2
S1: .asciiz "Str_1"
    .space 8
    .word 2021
    .asciiz "Str_2"
    .space 11
    .double 2.7182818459045
#st: .word S1	
str0: .asciiz "\n"
str1: .asciiz "a1: "
str2: .asciiz "i: "
str3: .asciiz "a2: "
str4: .asciiz "g: "   
.text 
.globl main
main:
    
     la $a0, str1       # print_string(str1)
     li $v0, 4          #
     syscall            #
     
     la $t0, S1       #
     addi $a0, $t0, 0    # print_string(a1)
     li $v0, 4          #
     syscall  
               #
     la $a0, str0       # print_string(str0)
     li $v0, 4          #
     syscall  
     
     la $a0, str2       # print_string(str2)
     li $v0, 4          #
     syscall            #
     lw $a0, 16($t0)
     li $v0, 1         #
     syscall            #
     
     la $a0, str0       # print_string(str0)
     li $v0, 4          #
     syscall  
     
     la $a0, str3       # print_string(str3)
     li $v0, 4          #
     syscall            #
     addi $a0, $t0, 20 # print_string(a2)
     li $v0, 4          #
     syscall            #
     
     la $a0, str0       # print_string(str0)
     li $v0, 4          #
     syscall  
     
     la $a0, str4       #print_string(str4)
     li $v0, 4          #
     syscall            #
     l.d $f12, 40($t0)  # print_double(g)
     li $v0, 3          #
     syscall            #
     
     l.d $f0, 40($t0)
     mfc1.d $v0, $f0         #
      
fim: jr $ra
