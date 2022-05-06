.data
# Mapas de registos:
# i: $t0
# v: $t1
# &(val[0]): $t2
# temp: $t3
     .eqv size, 8	# define size 8
str: .asciiz "Result is: "
val: .word 8, 4, 15, -1987, 327, -9, 27, 16
.text
.globl main
main:
    
     li $t4, 4  # $t4 = size/2 = 4
     ori $t0, $0, 0	# i = 0

do:   			#{
      la $t2, val	# $t2 = &(val[0])
      sll $t3, $t0, 2	# $t3 = i*4
      addu $t7, $t2, $t3 # $t2 = &val[i]
      addu $t5, $t7, $t4 # $t5 = val[i+size/2]
      lw $t1, 0($t7)	# v = val[i]
      lw $t6, 0($t5)   # 
      sw $t6, 0($t7)   # val[i] = val[i + size/2]
      sw $t1, 0($t5)	# val[i+size/2] = v
      addi $t0, $t0, 1	# i++
      blt $t0, $t4, do  # }while(++i < size/2)
      
      la $a0, str	# $a0 = str
      li $v0, 4		# print_string(str)
      syscall		# invocação da print_string
      
      ori $t0, $0, 0	# i = 0
do2: 			# {
      lw $a0, 0($t7)
     # sll $t3, $t0, 2	# $t3 = i*4
      addi $t0, $t0, 1  # i++
      addu $a0, $a0, $t0 # $a0 = &val[i]
    #  lw $a0, 0($t2)	# $a0 = val[i++]
      li $v0, 1		# print_int(&$a0)
      syscall
      
      li $a0, ','	# $a0 = ','
      li $v0, 11	# print_char(',')
      syscall		
      
      blt $t0, size, do2	 #{(while(i < size)) 
      
fim: jr $ra		# fim do programa   