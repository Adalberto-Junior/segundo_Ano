.data
    .eqv size, 3
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros"
str4: .asciiz "\nString #"
str5: .asciiz ": "
array: .word str1, str2, str3    
.text
.globl main
main:
    li $t0, 0   # i = 0;
for:
   bge $t0, size, endf
   la $a0, str4
   li $v0, 4
   syscall
   move $a0, $t0
   li $v0, 1
   syscall
   la $a0, str5
   li $v0, 4
   syscall
   
   li $t1, 0
while: 
      la $t2, array
      sll $t3, $t0, 2  # $t3 = i *4
      addu $t2, $t2, $t3  # $t3 = array[i]
      lw $t2, 0($t2)     # $t3 = &array[i][0]
      addu $t2, $t2, $t1  # $t3 = &array[i][j]
      lb $t2, 0($t2)      # $t3 = array[i][j] 
      beq $t2, '\0', endw # while....
      move $a0, $t2
      li $v0, 11
      syscall
      li $a0, '-'
      li $v0, 11
      syscall
      addiu $t1, $t1, 1   # j++
      j while
endw: addiu $t0, $t0, 1   # i++;
      j for 
endf: jr $ra
      
 