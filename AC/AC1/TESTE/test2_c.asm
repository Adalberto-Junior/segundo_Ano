.data
val:    .word 8,4,15,-1987,327,-9,27,16
str1:    .asciiz    "Result is: "
.eqv    SIZE,8
.text
.globl main
main:
    # Mapa de registos
    # i: $t0
    # v: $t1
    # &(val[0]): $t2
    li    $t0,0                # i = 0;
    la    $t2,val                # $t2 = &(val[0])
do:
    sll    $t3,$t0,2            # obter i
    addu    $t4,$t3,$t2            # &val[i]
    lw    $t1,0($t4)            # v = val[i]; -----
    lw    $t5,16($t4)            # t5 = val[i+size/2]
    sw    $t5,0($t4)            # val[i] = val[i+size/2];
    sw    $t1,16($t4)             # $t4 = val[i+SIZE/2]
    
    addi    $t0,$t0,1            # i++;
    bge    $t0,4,enddo            # while (...)
    j    do
enddo:
    li    $v0,4
    la    $a0,str1
    syscall                    # print_string("Result is:");
    
    li    $t0,0                # i = 0;
    
do1:
    sll    $t6,$t0,2            # obter i
    addu    $t6,$t6,$t2            # endereço de val[i]
    
    lw    $a0,0($t6)
    li    $v0,1
    syscall                    # print_int10(val[i]);    
    
    li    $v0,11
    li    $a0,','
    syscall                    # print_char(',');
    
    addi    $t0,$t0,1            # i++;
    bge    $t0,8,enddo1
    j    do1
enddo1:
    jr    $ra