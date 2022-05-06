.data
     
str1: .asciiz "I serodatupmoC ed arutetiuqrA"
      .align 2
str2: .space 31
str3: .asciiz "\n"
str4: .asciiz "String too long: "
      .eqv STR_MAX_SIZE, 30
.text
.globl main
main:
#Mapa dos rgistos
#str1: $a0 -> $s0
#str2: $a1 -> $s1
# exit_value: $t0
#STR_MAX_SIZE: $s2
salvar: addiu $sp, $sp, -12  # arranjar espaço na stack;
        sw $ra, 0($sp)       # salvar o valor de $ra
        sw $s0, 4($sp)	     # salvar o valor de $s0
        sw $s1, 8($sp)	     # salvar o valor de $s1
      
       la $s0, str1  #  $s0="I serodatupmoC ed arutetiuqrA"
       la $s1, str2  #  $s1[STR_MAX_SIZE + 1];
      
       move $a0, $s0  # $a0 = str1
       jal strlen     # strlen(str1)
       
if:    bgt $v0, STR_MAX_SIZE, else  #if(strlen(str1) <= STR_MAX_SIZE) {
       move $a0, $s1 #
       move $a1, $s0 #
       jal strcpy      # strcpy(str2, str1)
       
       move $a0, $v0  # print_string(str2);
       li $v0, 4      #
       syscall        #
       
       la $a0, str3   # print_string("\n"); 
       li $v0, 4      #
       syscall        #
       
       move $a0, $s1  #  strrev(str2)
       jal strrev     #
       move $a0, $v0  #print_string(strrev(str2)); 
       li $v0, 4      #
       syscall        #
       
       li $v0, 0      # exit_value = 0; 
       j endif       #}
else: #{
        la $a0, str4   # print_string("String too long: "); 
        li $v0, 4      #
        syscall        #
        
        move $a0, $s0  # strlen(str1);
        jal strlen     #
        move $a0, $v0  # print_int10(strlen(str1)); 
        li $v0, 1      #
        syscall        #
        li $v0, -1     # exit_value = -1;
                       #}
                       
endif:  lw $ra, 0($sp)       # repor o valor de $ra
        lw $s0, 4($sp)	     # repor o valor de $s0
        lw $s1, 8($sp)	     # repor o valor de $s1
        addiu $sp, $sp, -12  # libertar espaço na stack;
fim:	jr $ra               # fim do main;
