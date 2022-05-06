.data
str: .asciiz "ITED - orievA ed edadisrevinU"
.text
.globl main

main:
     addiu $sp, $sp, -4  # arranjar espaço na stack
     sw $ra, 0($sp)   # salvar o valor do $ra na stack
     
     la $a0, str
     jal strrev
     move $a0, $v0
     li $v0, 4
     syscall
     li $v0, 0
     
     lw $ra, 0($sp)  # repor o valo de $ra
     addiu $sp, $sp, 4 # libertar espaço na stack
fim: jr $ra

strrev: 
       addiu $sp, $sp, -16 #arranjar espaço na stack
       sw $ra, 0($sp)      # salavr o contéudo do $ra na stack
       sw $s0, 4($sp)      # salvar o contéundo do $s0 na....
       sw $s1, 8($sp)      #...
       sw $s2, 12($sp)     #...
       
      move $s2, $a0 # $s2 = $a0 
      move $s0, $a0 # p1 = str
      move $s1, $a0 # p2 = str
while: lb $t0, 0($s1) # $t0 = *p2
       beq $t0, '\0', endw # while(*p2 != '\0')
       addiu $s1, $s1, 1   # p2++;
       j while       
endw: addiu $s1, $s1, -1  # p2--
while1: bge $s0, $s1, endw1 # while(p1 < p2)
        move $a0, $s0 #..
        move $a1, $s1 #..
        jal exchange
        addiu $s0, $s0, 1  # p1++;
        addiu $s1, $s1, -1 # p2--;
        j while1
 endw1: move $v0, $s2     # return str
 
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