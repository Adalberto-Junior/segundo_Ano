.data
.align 2
S2:
    .asciiz "St1"
    .space 6
    .double 3.141592653589
    .word 291
    .word 756
    .byte 'X'
    .float 1.983
      
#st: .word S1	
str0: .asciiz "\n"
str1: .asciiz "a1: "
str2: .asciiz "g: "
str3: .asciiz "a2: "
str4: .asciiz "v: " 
str5: .asciiz "k: "  
.text 
.globl main
main:
      la $t0, S2         #
      #li $t2, 40         #
      #mul $t2, $t2, 3   #
      #addu $t0, $t0, $t2 #
      
    
     la $a0, str1       # print_string(str1)
     li $v0, 4          #
     syscall            #
     
     #sll $t2, $t
     addi $a0, $t0, 0     # print_string(a1)
     li $v0, 4          #
     syscall            #
     
     la $a0, str0       # print_string(str0)
     li $v0, 4          #
     syscall  
     
     la $a0, str2       # print_string(str2)
     li $v0, 4          #
     syscall            #
     l.d $f12, 16($t0)  #print_intu10(g)
     li $v0, 3          #
     syscall            #
     
     la $a0, str0       # print_string(str0)
     li $v0, 4          #
     syscall  
     
     la $a0, str3       # print_string(str3)
     li $v0, 4          #
     syscall            #
     addi $a0, $t0, 28  # print_string(a2)
     li $v0, 36         #
     syscall            #
     
     la $a0, str0       # print_string(str0)
     li $v0, 4          #
     syscall  
     
     la $a0, str4       #print_string(str4)
     li $v0, 4          #
     syscall            #
     addi $a0, $t0, 32  # print_double(v)
     li $v0, 4          #
     syscall            #
     
     la $a0, str0       # print_string(str0)
     li $v0, 4          #
     syscall  
     
     la $a0, str5       # print_string(str5)
     li $v0, 4          #
     syscall            #
     l.s $f12, 36($t0)  #print_intu10(k)
     li $v0, 2         #
     syscall            #
     
     l.d $f0,  24($t0)     # $f0 = s2.a2[1]
     l.d $f2, 16($t0)      # $f2 = s2.g
     mul.d $f2, $f2, $f0   # $f2 =  s2.g * s2.a2[1]
     cvt.s.d $f2, $f2      # $f2 = (float)s2.g * s2.a2[1]
     div.s $f12, $f12, $f2 # float)s2.g * s2.a2[1] / k
     
     mfc1 $v0, $f12        #
      
fim: jr $ra
