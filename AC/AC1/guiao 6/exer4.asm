.data
str1: .asciiz "Nr. de parametros: "
str2: .asciiz ": "
str3: .asciiz "\nP"
.text
.globl main
main:
# Mapa dos regisgtos
# i: $t0
#
#
   
   la $a0, str1		# print_string(str1)
   li $v0, 4            # 
   syscall              #
   
   #or $a0, $0, $a0	# print_int10(argc)
   lw $t7, 0($a0)
   sw $t7, 0($a0)
   li $v0, 1          #
   syscall   #
    or $t2, $0, $a0  # $t2 = argc
    lw $t4, 0($a0)   # $t4 = *$a0
    or $t3, $0, $a1  # $t3 = argv
   #sll $t4, $t4, 2  # $t4 = argc * 4
    #addu $t5, $t3, $t4  # $t5 = argv[argc]
   
   li $t0, 0  # i = 0;
 for: bge $t0, $t2, endfor  # while(i < argc)
      la $a0, str3	# print_string(\np)
      li $v0, 4    #
      syscall  #
      
      or $a0, $0, $t0    # print_int(i)
      li $v0, 1   #
      syscall  #
      
      la $a0, str2 # print_string(": ")
      li $v0, 4  #
      syscall  #
      
      sll $t5, $t0, 2  # $t5 = i * 4
      addu $t4, $t2, $t5  # $t4 = &argv[i]
      
      or $a0, $0, $t4    # print_int(argv[i])
      li $v0, 1   #
      syscall   #
 	j for   #}
      li $v0, 0  # return 0;
      syscall    #
endfor: jr $ra