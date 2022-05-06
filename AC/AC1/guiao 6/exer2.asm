.data
    .eqv size, 3
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros"
array: .word str1, str2, str3

# p  : $t1
# pultimo: $t2

.text
.globl main

main:
      la $t1, array  # $t1 = p = array = &array[0]
      li $t0, size  # St0 = size = 3
      sll $t0, $t0, 2  # $t0 = $t0 * 4
      addu $t2, $t1, $t0  # $t2 = pUltimo = array + size
      
for: bge $t1, $t2, endfor  # while( p < pultimo){
     lw $a0, 0($t1)	   # $a0 = $t1	
     li $v0, 4
     syscall
     
     li $a0, '\n'
     li $v0, 11
     syscall
      
     addi $t1, $t1, 4
      
     		 j for 	  # }
      
endfor: jr $ra


