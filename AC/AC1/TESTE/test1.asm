# Mapa de registos
#val: $t1
# n: $t0
#min: $t2
#max: $t3

.data
str1: .asciiz "Digite ate 20 inteiros (zero para terminar)"
str2: .asciiz "Maximo/minimo sao: "
#str3: .asciiz " : "
.text
.globl main
main:
       li $t0, 0	# n = 0;
       li $t2, 0x7fffffff   # min = 0x7fffffff;
       li $t3, 0x80000000   # max = 0x80000000;
       
   
do: 
    la $a0, str1	#print_string(str1)
    li $v0, 4  		#
    syscall 		#
    
    li $v0, 5		# read_int
    syscall
    sw $v0, 0($t1)	# val = read_int
    
if:  beqz $t1, endw	# if (val != 0){
if2: ble $t1, $t3, if3	# if (val > max)
     move $t3, $t1      # max = val
if3: bge $t1, $t2, endif # if(val < min)
     move $t2, $t1       # min = val;  
     				#}

endif:  addi $t0, $t0, 1  # n++;
	slti $t4, $t0, 20    # if n < 20, $t4 = 1
	sne $t5, $t1, $0     # if val != 0, $t5 = 1
	and $t6, $t4, $t5    # $t6 = $t4 & $t5
	beq $t6, 1, do	     # while(n < 20 & val != 0);
				
	#blt $t0, 20, do  # while(n < 20 &&
	#bnez $t1, do     # val != 0);
              # }
	
endw: 
      la $a0, str2	# print_string (str2)
      li $v0, 4
      syscall
      
      move $a0, $t3		#print_int10(max)
      li $v0, 1
      syscall
      
      li $a0, 0x0000003A	# print_char(' : ')
      li $v0, 11
      syscall
      
      move $a0, $t2     # $a0 = min
      li $v0, 1         # print_int10(min)
      syscall
      
	jr $ra
