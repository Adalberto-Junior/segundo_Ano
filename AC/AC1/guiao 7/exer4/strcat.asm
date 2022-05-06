.data
.text
.globl strcat

strcat:
#p = $s0
#*dst = $a0
#*src = $a1

          addiu $sp, $sp, -8   # reservar espaço na stack
          sw $ra, 0($sp)       # savalguardar o conteudo de $ra
          sw $s0, 4($sp)       # savalguardar o conteudo de $s0
          
          lw $s0, 0($a0)       # *p = dst
while:    beq $s0, '\0', endw  # while(*p != '\0')
          addiu $s0, $s0, 1    #p++;
          j while              #
          
endw:     move $a0, $s0        # strcpy(p, src)
          jal strcpy           #
          move $v0, $a0        # return dst
          
          lw $ra, 0($sp)       # repor o conteudo de $ra
          lw $s0, 4($sp)       # repor o conteudo de $s0
          addiu $sp, $sp, 8   # libertar espaço na stack

fim: jr $ra                    # fim do programa
         
          