.data
 p: .asciiz "Ac1-prAticaS"
 str: .word p
       .eqv size, 20
.text
.globl main
main:
#Mapa dos registos
# p: $t0
# *p: $t1
     
     la $t0, str    # p = str
     li $t2, size   # $t2 = size
     sll $t2, $t2, 2 # $t2 = size *4
    # addu $t0, $t0, $t2 # $t1 = str[size]
     lb $t1, 0($t0)  # $t1 = *p
while: beq $t1, '\0', endw  # while(*p != '\0'){
       sub $t3, $t1,  0x00000061  # *p = * - 'a'
       addi $t1, $t3, 0x00000041   #  *p = *p – 'a' + 'A';
       addi $t0, $t0, 1   # p++;
       j while  #} 

endw: lw $a0, 0($t1)   # print_string(str)
      li $v0, 4   #
      syscall  #
jr $ra