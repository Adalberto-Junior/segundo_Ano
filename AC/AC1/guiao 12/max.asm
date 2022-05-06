.data
max_grade: .float -20.0
sum:       .float 0.0
.text
.globl max
max:
#$a0: *st 
#$a1: ns
#$a2: media
#$t0: *p
#$v0: *pmax
#$t2: ns+ st 
     l.s $f0, max_grade      # $f0 = max_grade = -20.0
     l.s $f2, sum            # $f2 = sum = 0.0
     move $t0, $a0
     mul $t2, $a1, 44       # $t2 = ns * 44
     addu $t2, $t2, $t0     # $t2 = st + ns
     
for: bge $t0, $t2, endfor   #for(p = st; p < (st + ns); p++){
     l.s $f4, 40($t0)       # $f4 = p -> grade
     add.s $f2, $f2, $f4    # sum += p -> grade
     
if:  c.le.s $f4, $f0         #if~(p->grade > max_grade) 
     bc1t endif              # se for true vai para endif
     mov.s $f0, $f4          # max_grade = p-> grade
     or $v0, $0, $t0           # pmax = p
     
endif: addiu $t0, $t0, 44
         j for 

endfor: mtc1 $a1, $f6        # $f6 = ns
        cvt.s.w $f6, $f6     #(float)ns
        div.s $f2, $f2, $f6  # *media = sum / (float)ns; 
        s.s $f2, 0($a2)      #
  
fim: jr $ra
