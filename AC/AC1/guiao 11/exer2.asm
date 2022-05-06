.data
.align 2
stg: .word 7234
     .asciiz "Napoleao"
     .space 9
     .asciiz "Bonaparte"
     .space 5
     .float 5.1
str1: .asciiz "\nN.Mec: "
str2: .asciiz "\nNome: "
str3: .asciiz "\nNota: "
str4: .asciiz "Primeiro Nome: "
.text
.globl main
main:
#
       li $v0, 5
      syscall
      move $t1, $v0
      
      la $a0, str1 # $t0 = stg
      li $v0, 4  
      syscall
      la $t0, stg
      
      move $a0, $t1  
      li $v0, 36
      syscall       # print_intu10(stg.id_number);
      
      la $a0, str2
      li $v0, 4  
      syscall
      addi $a0, $t0, 22  #$a0 = stg.last_name
      li $v0, 4
      syscall            #print_string(stg.last_name);
      
      li $a0, ','       
      li $v0, 11 
      syscall           # print_char(',');
      
      la $a0, str4
      li $v0, 4
      syscall          # print_string("Primeiro Nome: ");
      
      li $v0, 8        # read_string(stg.first_name, 17);
      syscall         
      move $a0, $v0    
      li $v0, 4    
      syscall          #print_string(stg.first_name);
      
      la $a0, str3
      li $v0, 4  
      syscall
      
      l.s $f12, 40($t0)
      li $v0, 2
      syscall  #print_float(stg.grade);
      
      li $v0, 0
      
    
fim:  jr $ra   
      

