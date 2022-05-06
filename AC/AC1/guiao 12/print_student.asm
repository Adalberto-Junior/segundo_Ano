.data
str1: .asciiz "\n"
str3: .asciiz " Primeiro Nome: "
str4: .asciiz " Ultimo Nome: "
str5: .asciiz "Nota: "
.text
.globl print_student

print_student:
     move $t0, $a0  # $t0 = *p
     lw $a0, 0($t0) #
     li $v0, 36     # print_intu10(p->id_number);
     syscall        #
     
     la $a0, str1   # print_string("\n")
     li $v0, 4
     syscall
     
     la $a0, str3   # print_string("\n")
     li $v0, 4
     syscall
     
     addiu $a0, $t0, 4  #
     li $v0, 4          #print_string(p->first_name); 
     syscall            #
     
     la $a0, str4   # print_string("ULTIMO NOME ")
     li $v0, 4
     syscall
     
     la $a0, str3   # print_string("\n")
     li $v0, 4
     syscall
     
     addiu $a0, $t0, 22 # print_string(p->last_name); 
     li $v0, 4          #
     syscall            #
     
     la $a0, str1   # print_string("\n")
     li $v0, 4
     syscall
     
     la $a0, str5   # print_string("; ")
     li $v0, 4
     syscall
     
     l.s $f12, 40($t0)  # print_float(p->grade);
     li $v0, 2          #
     syscall            #

fim: jr $ra        # fim 
