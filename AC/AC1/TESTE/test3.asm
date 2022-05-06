#Mapa de registos
# n_eleven: $t0
#n_odd: $t1
# p1: $t2
# p2: $t3
.data 
     .eqv N, 5
a:   .space 20   	# int a[N]
b:   .space 20		# int b[N]
.text
.globl main
main:
	li $t0, 0	#n_even = 0
	li $t1, 0      # n_odd = 0;
	
	la $t2, a	# p1 = a;
	li $t4, N	# $t4 = N;
	sll $t4, $t4, 2 # $t4 = N*4
	addu  $t4, $t4, $t2  # $t4 = a + N;

for:       #{
       bge $t2, $t4, endfor  # while(p1 < a + N)
       li $v0, 5     # read_int
       syscall
       sw $v0, 0($t2)   # *p1 = read_int
       addi $t2, $t2, 4 # p++;
       
       	j for  #}
endfor:	
	la $t3, b   # p2 = b
for2:       #{
         bge $t2, $t4, endfor2    #while(p1 < (a + N))
         lw $t5, 0($t2)   # $t5 = *p1
         rem $t6, $t5, 2  # $t6 = *p1  % 2     
   if:  beqz $t6, else  # if(*p1  % 2 != 0){
   	lw $t3, 0($t3)  # $t3 = *p2
   	addi $t3, $t3, 4  # *p2++
   	sw $t5, 0($t3)  # *p2++ = *p1
   	addi $t1, $t1, 1 # n_odd++;
   		j endif  #}
   else:      # else{
          addi $t0, $t0, 1  # n_even++
   
endif:	  addi $t2, $t2, 4 	# p1++;
	   j for2   #} 
endfor2: 	
          sll $t6, $t1, 4  # $t6 = n_odd *4
          addu $t6, $t6, $t3	# $t6 = b+ n_odd
for3:     beq $t3, $t6, endfor3   #while(p < b+n_odd){
          sw $t3, 0($a0)	# $a0 = *p2
          li $v0, 1    # print_10(*p2)
          syscall
          
         j for3   # }
endfor3: jr $ra  # fim do programa;