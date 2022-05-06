.data
array: .word 7692, 23, 5, 234
       .eqv size, 4
.text
.globl main
main:
#Mapa dos registos
# i: $t0
# soma: $t1
# array[0]: $t2
      
      ori $t1, $0, 0    # soma = 0;
      li $t0, 0    # i = 0;
     
      
while:  la $t2, array	# $t2 = array[0]
        sll $t3, $t0, 2 # $t3 = i*4
        addu $t4, $t2, $t3  # $t4 = array[i] 
        bgt $t0, 3, endw
        lw $t4, 0($t4)  
        add $t1, $t1, $t4  # soma = soma + array[i]
        addi $t0, $t0, 1  # i++;
        j while  # }
endw: or $a0, $0, $t1   # print_int10(soma)
       #move $a0, $t1
      li $v0, 1   #
      syscall   #
jr $ra   # fim do programa