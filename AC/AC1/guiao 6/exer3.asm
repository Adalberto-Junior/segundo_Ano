.data
      .eqv size, 3
str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "ponteiros"
str4: .asciiz "\nstring #"
str5: .asciiz ": "

array: .word str1, str2, str3
.text
# Mapa dos registos
# i : $t0
# j : $t1
# array[i][j] : $t3
.globl main

main:
	li $t0, 0	         #  i = 0; $t0 = i = 0;
for: bge $t0, size, endfor       # while(i < size){
     la $a0, str4	#pritn_string(str4)
     li $v0, 4
     syscall
     
     or $a0, $0, $t0	#print_int10(i)
     li $v0, 1
     syscall
     
     la $a0, str5    #print_string(:)
     li $v0, 4
     syscall
     
       li $t1, 0		# j = $t1 = 0
do: 
       la $t4,array   # $t3 = &array[0] 
       sll $t2,$t0,2 # $t2 = i *4
       addu $t3,$t4,$t2 # $t4 = &array[i] 
       lw $t3,0($t3) # $t3 = array[i] = &array[i][0] 
       addu $t3,$t3,$t1 # $t3 = &array[i][j] 
       lb $t3, 0($t3) # $t3 = array[i][j] 
      
       
       or $a0, $0, $t3	# print_char(array[i][j]); 
       li $v0, 11
       syscall
       
       li $a0, '-'	# print_char('-'); 
       li $v0, 11
       syscall
 	
       addi $t1, $t1, 1 # j++;
       beqz $t3, enddo     # while(array[i][j] != 0)
       	j do
       
enddo: addi $t0, $t0, 1 # i++;
	j for    #  }
	
endfor: jr $ra





