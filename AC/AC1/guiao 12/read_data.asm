.data
str: .asciiz " N.Mex:"
str1: .asciiz " Primeiro Nome: "
str2: .asciiz " Ultimo Nome: "
str3: .asciiz "Nota: "
.text
.globl read_data

read_data:
# i: $t0
ar:   move $t1, $a0  # $t1 = student *st
      move $t2, $a1  # $t2 = ns;
      li $t0, 0      # i = 0;
for: 
     
      bge $t0, $t2, fim   #  for(i=0; i < ns; i++){
      mul $t3, $t0, 44   # $t3 = i * 44
      addu $t3, $t1, $t3 # $t3 = &st_array[i]
      
      la $a0, str         # print_string("N. Mec: ");
      li $v0, 4           #
      syscall             #
      li $v0, 5  # read_ind
      syscall    #
esc:  sw $v0, 0($t3)      # st[i].id_number = read_int();
      
      la $a0, str1        # print_string("Primeiro Nome: ");
      li $v0, 4           #
      syscall             #
      addiu $a0, $t3, 4
      li $a1, 17          #
      li $v0, 8           #
      syscall             #
      
      la $a0, str2        # print_string("Ultimo Nome: ");
      li $v0, 4           #
      syscall             #
      addiu $a0, $t3, 22
      li $a1, 14          # $a1 = 14
      li $v0, 8           #
      syscall             #
      
      la $a0, str3        # print_string("Nota: "); 
      li $v0, 4           #
      syscall             #
      li $v0, 6           #
      syscall             #
      s.s $f0, 40($t3)    # st[i].grade = read_float(); 
  
      addiu $t0, $t0, 1   # i++;
      j for
       
fim: jr $ra     # fim
       
      
