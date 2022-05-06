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
        jal max              # max(a, SIZE);
        mov.d $f12, $f0      #
        li $v0, 3            # print_double( average(a, SIZE) );
        syscall              #
        li $v0, 0            # return 0;
        
        lw $ra, 0($sp)      # salvaguardar o valor de $ra
        addiu $sp, $sp, 4   # libertar espaço na stack
        
end: jr $ra                  # fim do programa main;






max:   
       sub $a0, $a0, 1  # $a0 = n -1
       sll $a0, $a0, 3  # $a0 = (n-1)*8
       mtc1 $a0, $f2    # $f2 = $a0 = (n-1)*8
       add.d $f4, $f12, $f2 # $f4 = *u = p + n-1;
       mov.d $f0, $f12      # max = *p;
       li $t5, 8            # $t5 = temp = 8;
       mtc1 $t5, $f6        # $f6 = 8;
       add.d $f12, $f12, $f6  #*p++

for1:  c.le.d $f12, $f4     #while(p <= u)
       bc1f endfor1         #
if:    c.lt.d $f12, $f0     # if(*p < max)
       bc1t endif           # if true goto endif;
       mov.d $f0, $f12      # max = *p;
endif: add.d $f12, $f12, $f6  # p++;
       j for                #}
endfor1: jr $ra              # fim do max();