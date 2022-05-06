.data
str1: .asciiz "Arquitetura de "
str2: .space 50
str3: .asciiz "Computadores I"
str4: .asciiz "\n"
.text
.globl main
main:
         addiu $sp, $sp, -4   # reservar espaço na stack
         sw $ra, 0($sp)       # savalguardar o conteudo de $ra
         
         la $a0, str2         # strcpy(str2, str1);
         la $a1, str1         #
         jal strcpy           #
         
         lw $a0, 0($v0)       # $a0 = str2
         li $v0, 4            # print_string(str2);
         syscall              #
         
         la $a0, str4         # 
         li $v0, 4            # print_string("\n");
         syscall              #
         
         la $a1, str3         # $a1 = Computadores I
         jal strcat           # strcat(str2, "Computadores I")
         
         move $a0, $v0        #print_string( strcat(str2, "Computadores I") );
         li $v0, 4            #
         syscall              #
         
         li $v0, 0            # return 0;
   
         lw $ra, 0($sp)       # repor o conteudo de $ra
         addiu $sp, $sp, 8    # libertar espaço na stack

fim: jr $ra                   # fim do programa
         


