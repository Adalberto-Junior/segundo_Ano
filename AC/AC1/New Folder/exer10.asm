.data
k: .double 0.0
   .eqv size, 10
a: .space 80
.text
.globl main
main:
    addiu $sp, $sp, -4    # reservar espaço na stack
    sw $ra, 0($sp)        # salvaguardar o contéundo do registo $ra
    
    li $t0, 0 # i = 0;
for1: bge $t0, size, endf1  # while(i < size){
      la $a0, a
      sll $t1, $t0, 3     # i = i *8
      addu $a0, $a0, $t1 # $a0 = a[i]
      li $v0, 5          #
      syscall            # read_int
      mtc1 $v0, $f0      #
      cvt.d.w $f0, $f0   # (double) read_int()
      s.d $f0, 0($a0)     # a[i] = (double)read_int(); 
      addiu $t0, $t0, 1   # i++;
      j for1               # }
endf1: #l.d $f12, 0($a0)    #
       #li $v0, 3
       #syscall
       move $a0, $a0
       li $a1, size   #
       jal max    #
       mov.d $f12, $f0
       li $v0, 3       #
       syscall         #
       
       li $v0, 0       # return 0;
  
      lw $ra, 0($sp)   # repor o valo ...
      addiu $sp, $sp, 4 #...
    
fim: jr $ra 



average: 
      move $t0, $a1   # i = 0;
      l.d $f0, k     # sum = 0.0
for: ble $t0, 0, endf # while(i > 0){
     sll $t2, $t0, 3  # i * 8
     addu $a0, $a0, $t2  # array[i]
     lw $t1, -8($a0)     # $t1 = array[i - 1]
     mtc1 $t1, $f2       # $f2 = $t1
     add.d $f0, $f0, $f2 # sum += array[i-1];
     addiu $t0, $t0, -1  # i--;
     j for               # }
endf: mtc1 $a1, $f4       # $f4 = n
     cvt.d.w $f4, $f4    # $f4 = (double) n
     div.d $f0, $f0, $f4 # return sum / (double)n
endg: jr $ra             # enfgame; 

max: 
   sub $a1, $a1, 1    # n = n -1
   addu $t0, $a0, $a1 # *u = p + n -1
   l.d $f0, 0($a0)    # max = *p;
   addiu $a0, $a0, 8  # p++;
for2: bgt $a0, $t0, endf2  # while(p <= u)
    l.d $f2, 0($a0)  # $f2 = *p
if3: c.le.d $f2, $f0 # if(*p > max)
     bc1t endif3    # 
     mov.d $f0, $f2 # max = *p
endif3: addiu $a0, $a0, 8 #p++;
     j for2  #
endf2: jr $ra
     
          