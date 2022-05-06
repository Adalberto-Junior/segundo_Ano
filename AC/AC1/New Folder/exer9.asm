.data
k: .float 2.59375
k2: .float 0.0
.text
.globl main 
main: 
    
    l.s $f0, k   #
do: 
    li $v0, 5   #
    syscall     #
    move $t0, $v0  # val = read_int
    mtc1 $t0, $f2  # $f2 = val
    cvt.s.w $f2, $f2   # $f2 = (float)val;
    mul.s $f12, $f2, $f0  # $f12 = res = (float)val * 2.59375;
    li $v0, 2             #
    syscall               #
    l.s $f4, k2           # $f4 = 0.0
while:  c.eq.s $f12, $f4  
        bc1f do         #}while(res != 0.0);
     li $v0, 0          # return 0
fim: jr $ra
    