.data 
k:   0x416A0000
k1:  0xC0C00000
str: .asciiz "\n"
.text
.globl main
main:
     
     l.s $f0, k
     l.s $f2, k1
   
     
     abs.s $f4, $f2
     neg.s $f6, $f0
     
     mov.s $f12, $f4
     li $v0, 2
     syscall
     la $a0, str
     li $v0, 4
     syscall
     mov.s $f12, $f6
     li $v0, 2
     syscall
      la $a0, str
     li $v0, 4
     syscall
     
     add.s $f12, $f0, $f2
     li $v0, 2
     syscall
      la $a0, str
     li $v0, 4
     syscall 
     sub.s $f8, $f2, $f0 
     mov.s $f12, $f8
     li $v0, 2
     syscall
       la $a0, str
     li $v0, 4
     syscall 
     
     mul.s $f12, $f0, $f2
     li $v0, 2
     syscall
     
       la $a0, str
     li $v0, 4
     syscall 
     
     div.s $f12, $f2, $f0
     li $v0, 2
     syscall
     
       la $a0, str
     li $v0, 4
     syscall 
     
   cvt.d.s  $f12,$f2
     li $v0, 3
     syscall
     
     lui $t0, 0xc0a8
     mtc1 $t0, $f8
     mov.s $f12, $f8
     li $v0, 2
     syscall
     
     
    jr $ra
   