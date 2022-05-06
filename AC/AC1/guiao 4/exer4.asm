.data
    .eqv size, 20
str: .space 81
str2: .asciiz "Introduza uma string"
.text
.globl main
main:
#Mapa dos registos
# p : $t0
#*p: $t1

       la $a0, str2   # print_string(str2)
       li $v0, 4  #
       syscall  #
       la $a0, str
       li $a1, size
       li $v0, 8
       syscall 
str1:  or $t0, $0, $v0
       la $t0, str1    # p = strr1
       li $t4, size      # $t4 = size
       sll $t2, $t4, 2 # $t2 = size * 4
       addu $t1, $t0, $t2  # $t1 = array[size]
       lw $t1, 0($t1)  # $t1 = *p = *array[i]
while: beq $t1, '\0', endw  # while(*p != '\0'){
       addi $t1, $t1, -0x61  # *p = * - 'a'
       addi $t1, $t1, 0x41   #  *p = *p – 'a' + 'A';
       addi $t0, $t0, 1   # p++;
         j while  #}
         
 endw: or $a0, $0, $t1    # print_string(str)
        li $v0, 4  #
        syscall   #
jr $ra