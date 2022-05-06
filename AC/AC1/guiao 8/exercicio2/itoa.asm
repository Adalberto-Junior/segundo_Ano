# Mapa de registos 
# n: $a0 -> $s0 
# b: $a1 -> $s1 
# s: $a2 -> $s2 
# p: $s3 
# digit: $t0
.data
.text
.globl itoa
itoa:
    addiu $sp, $sp, -20  	# reservar espaço na starck
    sw $ra, 0($sp) 		# guardar o valor de $ra
    sw $s0, 4($sp)		# guardar o valor de $s0
    sw $s1, 8($sp)		# guardar o valor de $s1
    sw $s2, 12($sp)		# guardar o valor de $s2;
    sw $s3, 16($sp)		# guardar o valor de $s3;
 
    
    move $s0, $a0  		# salvar o valor de n;
    move $s1, $a1  		# salvar o valor b;
    move $s2, $a2  		# salvar o valor de *s
    move $s3, $a2 		# p = s
    

do: lb $s0, 0($s0) 	 	# do{
    rem $t1, $s0, $s1  		# digit = n % b
    div $s0, $s0, $s1  		# n = n / b;
    move $a0, $t1   		# $a0 = digit;
    jal toascii     		# toascii(digit);
    sb $v0, 0($s3)  		# *p = toascii(digit)
    addi $s3, $s3, 1 		# p++;
while: bgt $s0, 0, do 		# while(n > 0)
    
    sb  $0, 0($s3)      	# *p = '\0'  
    jal strrev       		# chama a função strrev(s)
    move $v0, $s3      		# return (s);
    
    lw $ra, 0($sp) 		# repõe o valor de $ra
    lw $s0, 4($sp)		# repõe o valor de $s0
    lw $s1, 8($sp)		# repõe o valor de $s1
    lw $s2, 12($sp)		# repõe o valor de $s2;
    lw $s3, 16($sp)		# repõe o valor de $s3;
    addiu $sp, $sp, 20  	# libertar espaço na starck
    jr $ra			# fim do programa 
