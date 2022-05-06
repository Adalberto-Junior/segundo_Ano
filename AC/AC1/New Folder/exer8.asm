.data
.text
.globl main

main:
     addiu $sp, $sp, -4  # arranjar espaço na stack
     sw $ra, 0($sp)      # salvaguardar o contéudo do regidto $ra
      
     li $a0, 0xF
     li $a1, 0xD
     jal div        # div (0xF2ED, 0xDE2F)
     move $a0, $v0  # 
     li $v0, 1      #
     syscall        #
     li $v0, 0      # return 0;    
     
     lw $ra, 0($sp)     # repor o contéudo do registo $ra
     addiu $sp, $sp, 4  # libertar espaço na stack; 
endg: jr $ra

div: 
    sll $a1, $a1, 16  # divisor = divisor << 16;
    andi $t4, $a0, 0xFFF # $t4 = (dividendo & 0xFFFF
    sll $a0, $t4, 1      # dividendo = (dividendo & 0xFFFF) << 1;
   
   li $t0, 0   # i = 0;
for:  bge $t0, 16, endf  # while(i < 16) {
      li $t1, 0          # bit = 0;
if:   blt $a0, $a1, endif  # if(dividendo >= divisor) {
      sub $a0, $a0, $a1    # dividendo = dividendo - divisor; 
      li $t1, 1            # bit = 1;
      #}
endif: sll $a0, $a0, 1    # dividendo = dividendo << 1;
       or $a0, $a0, $t1   # dividendo = (dividendo << 1) | bit; 
       addiu $t0, $t0, 1   # i++;
       j for              #}
endf: srl $t2, $a0, 1     # resto = (dividendo >> 1)
      andi $t2, $t2, 0xFFFF0000 # resto = (dividendo >> 1) & 0xFFFF0000; 
      andi $t3, $a0, 0xFFFF     # quociente = dividendo & 0xFFFF;
      or $v0, $t2, $t3         # return (resto | quociente); 
      
fim: jr $ra                    #fim
      
     