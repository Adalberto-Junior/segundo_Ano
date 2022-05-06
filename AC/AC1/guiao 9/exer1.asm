.data
PI: .float 3.1415926
K:  .float 0.0
.text
.globl main
main:

# ren: $f1
# val: $t0

do:
   li $v0, 5   # read_int
   syscall     # 
   move $t1, $v0  # val = read_int
 
   mtc1 $t1, $f0          # $f0 = $t1
   cvt.s.w $f0, $f0       # converter o int para float; 
   l.s $f2, PI            # $f2 <= 3.1415926(igual a la)
   mul.s $f1, $f0, $f2   #res =  float(val) * 2.59375
   mov.s $f12, $f1       # print_float
   li $v0, 2             #
   syscall               #
   
   l.s $f3, K   # $f3 = 0.0
   
while: c.eq.s $f1, $f3  # if res = 0.0
       bc1f do    	# while(res != 0.0)
       
       li $v0, 0
jr $ra    # fim do programa