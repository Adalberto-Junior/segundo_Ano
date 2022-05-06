.data
k: .float 1.0
k1: .float 2.5
.text
.globl main
main:
    addiu $sp, $s0, -4   #
    sw $ra, 0($sp)     #
    
    l.s $f12, k1
    li $a0, 3
    jal xtoy
    mov.s $f12, $f0 
    li $v0, 2
    syscall
    lw $ra, 0($sp)     #
    addiu $sp, $sp, 4  #
endg: jr $ra

xtoy: 
    addiu $sp, $sp, -12  #...
    sw $ra, 0($sp)      #...
    sw $s0, 4($sp)      #
    s.s $f12, 8($sp)    #
    
    move $s0, $a0   # $s0 = y
    mov.s $f20, $f12
    jal abs         # abs(y)
    move $t1, $v0   #
      li $t0, 0 # i = 0;
     l.s $f0, k      # result = 1.0
    
for: bge $t0, $t1, endf # while(i < abs(y))
if:  ble $s0, 0, else   # if(y > 0)
     mul.s $f0, $f0, $f20  # result *= x;
     j endif    #
else: div.s $f0, $f0, $f20 #  result /= x;
endif: addiu $t0, $t0, 1    #
      j for                #}

endf:    lw $ra, 0($sp)  #..
         lw $s0, 0($sp)   #
         l.s $f20, 0($sp)
         addiu $sp, $sp, 12 #
fim: jr $ra        #

abs: 
if1: bge $a0, 0, endif1   #
     sub $a0, $0, $a0    #
endif1: move $v0, $a0    #
       jr $ra           #