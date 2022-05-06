.data 
.text
.globl strcpy

strcpy:
# i: $t0
# dest[i] : $v0;
# src[i]: $a1
#temp: $t1

      li $t0, 0  # i = 0;
      #lb $a0, 0($a0)      #
      # lb $a1, 0($a1)      #
      

do:
       addu $v0, $a0, $t0       # $v0 = dst[i];
       addu $a1, $a1, $t0       # $a1 = src[i];
       
       bne $a1, '\0', enddo     #  while(src[i] != '\0');  
       lb $t1, 0($a1)           # dst[i]= src[i];
       sb $t1, 0($v0)    
       addi $t0, $t0, 1         # i++;
       j do
enddo: jr $ra                  # fim strcpy;   



  
