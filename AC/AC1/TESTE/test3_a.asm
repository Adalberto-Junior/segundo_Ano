.data
     .eqv N, 5
a: .space 20
b: .space 20
.text
.globl main
main:
#Mapa de registos
# n_even: $t0
#n_odd: $t1
#p1: $t2
# p2: $t3

  li $t0, 0  # n_even = 0
  li $t1, 0  # n_odd = 0

      la $t2, a  # p = a;
       li $t4, N  # $t4 = N
      sll $t5, $t4, 2  # $t5 = N*4
      addu $t5, $t5, $t2  # $t5 = a + N
      
for: bge $t2, $t5, endfor  # while(p < (a + N))

     li $v0, 5  # read_int
     syscall   #
     sw $v0, 0($t2) # *p1 = read_int
   
     addi $t2, $t2, 4  # p1++
     j for    #}
endfor: 
	la $t3, b   # p2 = b
	la $t2, a   # p 1 = a
	
for2: bge $t2, $t5, endfor2  #while(p1 < (a + N))
      lw $t6, 0($t2)
      rem $t4, $t6, 2  # $t4 = *p1 % 2
if:   beq $t4, 0, else  # if(*p1 % 2 != 0){
      sw $t6, 0($t3)  # *p2++ = *p1
      addi $t3, $t3, 4  # p2++
      #or $t7, $0, $t3 # $t7 = *p2
      addi $t1, $t1, 1 # n-odd++
      j endif     # }
else:  addi $t0, $t0, 1 # n_even++;
endif:  addi $t2, $t2, 4 #p1++
	j for2  #}
	
endfor2: la $t3, b
         sll $t1, $t1, 2  # $t1 = n_odd *4
         addu $t4, $t1, $t3  # $t4 = b + n_odd    
 for3:   bge $t3, $t4 endfor3  # while(p < b+ n_odd){
         lw $a0, 0($t3) # print_int(*p2)
         li $v0, 1  # 
         syscall #
         addi $t3, $t3, 4 # p2++
         j for3  #}
endfor3:  jr $ra