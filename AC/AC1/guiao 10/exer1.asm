.data 
k:   .float 1.0
kt:  .float 2.5
.text
.globl main

# i: $t0;
# result: $f0
# x: $f12  -> $f20
# y: $a0   -> $s0
#asb(y): $t1

main: 
	addiu $sp, $sp, -4
	sw $ra, 0($sp)    # salvar o valor de $ra
	
	l.s $f12, kt
	li $a0, 3  
	jal xtoy
	
	mov.s $f12, $f0
	li $v0, 2
	syscall
	
	lw $ra, 0($sp) # repor o valor de $ra
	addiu $sp, $sp, 4  # libertar espaço na stark
fim: jr $ra     # fim do programa


xtoy:
        addiu $sp, $sp, -12
	sw $ra, 0($sp)    # salvar o valor de $ra
	sw $s0, 4($sp)    # salvar o valor de $s0
	s.s $f20, 8($sp)  # slavar o valor de $f20
	
	mov.s $f20, $f12 
	move $s0, $a0
	jal abs
	move $t1, $v0  # $t1 = abs(y)
 	li $t0, 0  # i= 0;
 	l.s $f0, k   # result = 1.0
for:    bge $t0, $t1, endfor    # while(i < abs(y))
if:     ble $s0, 0, else  # if(y > 0)
        mul.s $f0, $f0, $f20  # resul *= x
        j endif
else:  div.s $f0, $f0, $f20  # result /= x
endif: addi $t0, $t0, 1  #i++;
        j for  #}
endfor: 
	lw $ra, 0($sp)    # repor o valor de $ra
	lw $s0, 4($sp)    # repor o valor de $s0
	l.s $f20, 8($sp)  # repor o valor de $f20
	addiu $sp, $sp, 12


abs: 
if2: bge $a0, 0, endif2    # if(val < 0) 
     #mul $a0, $a0, -1  # val = -val
     sub $a0, $0, $a0
endif2: or $v0, $0, $a0   # return vall;
jr $ra   # fim do programa
