.data
     .align 2
     .eqv size, 30
str: .asciiz "I serodatupmoC ed arutetiuqrA"
str2: .space 31
str3: .asciiz "\n"
str4: .asciiz "String too long: "
.text
.globl main
main:
       addiu $sp, $sp, -4  # arranhjar espaço na stack
       sw $ra, 0($sp) # salvar o valor de $ra
       
       la $a0, str   # 
       jal strlen    # strlen(str)
       move $t0, $v0
if:    bgt $t0, size, else  # if(strlen(str1) <= STR_MAX_SIZE) {
       la $a0, str2  # 
       la $a1, str  #
       jal strcpy   # strcpy(str2, str1);
       move $t1, $v0
       move $a0, $v0 #
       li $v0, 4     #
       syscall       # print_string(str2); 
     
       la $a0, str3 #
       li $v0, 4    #
       syscall      # print_string("\n");
      
       move $a0, $t1  #
       jal strrev   #strrev(str2)

       move $a0, $v0 #
       li $v0, 4     #
       syscall       # print_string(strrev(str2))
       li $t0, 0     # exit_value = 0;
       j endif #}
       
else:  la $a0, str4  # {
       li $v0, 4     #
       syscall       # print_string("String too long: "); 
       la $a0, str   #
       jal strlen    # strlen(str1)
       move $a0, $v0 #
       li $v0, 1     #
       syscall       # print_int10(strlen(str1));
       li $t0, -1    # exit_value = -1;
       #}
endif: move $v0, $t0   # return exit_value;
       
       lw $ra, 0($sp)  # repor o valor do $ra
       addiu $sp, $sp, 4 # libertar do espaço na stack
fim: jr $ra              # fim 

strcpy:
      li $t0, 0           # i = 0;
do:
     sll $t1, $t0, 2      # $t1 = i*4
     addu $a0, $a0, $t1   # dest[i]
     addu $a1, $a1, $t1   # src[i]
     lb $t2, 0($a1)       # $t2 = *src[i]
     sb $t2, 0($a0)       # dst[i] = $t2
     addiu $t0, $t0, 1    # i++;
while: bne $t2, '\0', do  # while(src[i++] != '\0');
      move $v0, $a0        # return dst
termi: jr $ra              # fim!

strlen: 
      li $t0, 0
while1:
      lb $t1, 0($a0) #$t1 = *s;
      addiu $a0, $a0, 1 # s++
      beq $t1, '\0', endw
      addiu $t0, $t0, 1 # len++
      j while1
endw: move $v0, $t0  # return len
      jr $ra

strrev: 
       addiu $sp, $sp, -16 #arranjar espaço na stack
       sw $ra, 0($sp)      # salavr o contéudo do $ra na stack
       sw $s0, 4($sp)      # salvar o contéundo do $s0 na....
       sw $s1, 8($sp)      #...
       sw $s2, 12($sp)     #...
       
      move $s2, $a0 # $s2 = $a0 
      move $s0, $a0 # p1 = str
      move $s1, $a0 # p2 = str
while2: lb $t0, 0($s1) # $t0 = *p2
       beq $t0, '\0', endw2 # while(*p2 != '\0')
       addiu $s1, $s1, 1   # p2++;
       j while2       
endw2: addiu $s1, $s1, -1  # p2--
while3: bge $s0, $s1, endw3 # while(p1 < p2)
        move $a0, $s0 #..
        move $a1, $s1 #..
        jal exchange
        addiu $s0, $s0, 1  # p1++;
        addiu $s1, $s1, -1 # p2--;
        j while3
 endw3: move $v0, $s2     # return str
 
        lw $ra, 0($sp)      # repor o contéudo do $ra 
        lw $s0, 4($sp)      # repor o contéundo do $s0 
        lw $s1, 8($sp)      #...
        lw $s2, 12($sp)     #
        addiu $sp, $sp, 16  #libertar espaço na stack
final: jr $ra

exchange:
         lb $t0, 0($a0)
         lb $t1, 0($a1)
         sb $t0, 0($a1)
         sb $t1, 0($a0)
endg:   jr $ra