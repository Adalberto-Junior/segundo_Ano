.data

      .eqv size, 3
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros"
array: .word str1, str2, str3

#$t1 = i;
.text
.globl main
main:
     li $t1, 0  #i = 0;
for: bge $t1, size, endfor #{ while(i < 3)
     la  $t2, array 	# $t2 = array[0];
     sll  $t3, $t1, 2	#
     addu $t3, $t3, $t2 # $t3 = &array[i]
     lw $a0, 0($t3)	# $a0 = &array[i]
     li $v0, 4
     syscall
     li $a0, '\n'
     li $v0, 11
     syscall
     
     addi $t1, $t1, 1	# i++;
     j for              # }
  
endfor: jr $ra