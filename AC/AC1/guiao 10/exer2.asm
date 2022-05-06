.data 
k: .double 1.0
k2: .double 0.0
k3: .double 0.5
k4: .double 5.345
.text
.globl main
main:

#val: $f12
#xn: $f0
#aux: $f2
#i: $t0
# temp: $f4
#temp2: $f6
 	addiu $sp, $sp, -4
	sw $ra, 0($sp)    # salvar o valor de $ra
	
	l.d $f12, k4
	jal sqrt
	
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	lw $ra, 0($sp) # repor o valor de $ra
	addiu $sp, $sp, 4  # libertar espaço na stark
fim: jr $ra     # fim do programa




sqrt: 
      l.d $f0, k  # xn = 1.0
      li $t0, 0   # i= 0;
      l.d $f4, k2 # $f4 = 0.0
if:   c.le.d $f12, $f4  # if(val <= 0)  
      bc1t else   # salta de val <= 0
do:   
     mov.d $f2, $f0  # aux = xn
     div.d $f8, $f12, $f0   # $f8 = val / xn
     add.d $f0, $f0, $f8   # xn = xn + val/xn
     l.d $f6, k3   # $f6 = 0.5
     mul.d $f0, $f0, $f6 # xn = 0.5 * (xn + val/xn); 
while: c.eq.d $f2, $f0 # if(aux = xn)
      bc1t endw    #  vai para endw se aux = xn
      addi $t0, $t0, 1  # i++
      blt $t0, 25, do  # while((aux != xn) && (++i < 25));
enddo: j endw          #
else: 
     l.d $f0, k2    # xn = 0.0

endw: jr $ra
     
