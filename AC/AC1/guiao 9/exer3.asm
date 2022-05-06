.data
   .align 3
a: .space 80
k: .double 0.0
   .eqv size, 10 
.text 
.globl main
main:
# i -> $t0
       addiu $sp, $sp, -4  # arranjar espaço na stack
       sw $ra, 0($sp)      # salvaguardar o valor de $ra
       
       l.d $f12, a           # $f12 = a[size]
       li $t0, 0             # i = 0;
for:   sll $t1, $t0, 3       # $t1 = i * 8     {
       mtc1 $t1, $f0         # $f0 = $t1 = i * 8
       add.d $f12, $f12, $f0 # $f12 = a[i];
       bge $t0, size, endfor # while(i < size)
       li $v0, 5             # read_int()
       syscall               #
       l.d $f12, 0($v0)      # a[i] = read_int();
       cvt.d.w $f12, $f12    # a[i] = (double) read_int();
      
       addiu $t0, $t0, 8     # i++;
       j for                 #}

endfor: li $a0, size         # $a0 = size
        jal average          # average(a, SIZE);
        mov.d $f12, $f0      #
        li $v0, 3            # print_double( average(a, SIZE) );
        syscall              #
        li $v0, 0            # return 0;
        
        lw $ra, 0($sp)      # salvaguardar o valor de $ra
        addiu $sp, $sp, 4   # libertar espaço na stack
        
end: jr $ra                  # fim do programa main;

average:
# i: $t0
# array: $f12
# sum: $f0

      or $t0, $0, $a0      # i = n;
      l.d $f0, k           # sum = 0.0
for1: 
    sll $t0, $t0, 3        # $t2 = i * 8 
    mtc1 $t0, $f2          # $f2 = i*8   
    add.d $f12, $f12, $f2  # array[i]
    ble $t0, 0, endfor     # for(; i > 0; i--)
    l.d $f4, -8($f12)      # $f4 =  array[i-1];
    add.d $f0, $f0, $f4    # sum += array[i-1]; 
    addiu $t0, $t0, -8     # i--
    j for                  # }

endfor1: mtc1 $a0, $f2       # $f2 = n
        cvt.d.w $f2, $f2    # (double)n;
        div.d $f0, $f0, $f2 # return sum / (double)n; 
        
fim:    jr $ra              # fim do programa average;
