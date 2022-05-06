.data
k:  .double 32.0
k1: .double 9.0
k2: .double 5.0
.text
.globl main
main:
  addi $sp, $sp, -4   # reservar espaço na stack
  sw $ra, 0($sp)      # salvar o valor de $ra 
  
  li $v0, 7   # read_int
  syscall     #
  mov.d $f12, $f0  # $f12 = read_int
  jal f2c 
  mov.d $f12, $f0   # print_double(ft)
  li $v0, 3        #
  syscall  	   #
  
  li $v0, 0  #
  
  lw $ra, 0($sp)  # devolver o valor de $ra
  addi $sp, $sp,  4    # libertar espaço da stack
  
jr $ra



f2c:  
     
    
     l.d $f4, k   # $f1 = 32.0
     l.d $f2, k1  # $f2 = 9.0
     l.d $f6, k2  # $f3 = 5.0 
     sub.d $f12, $f12, $f4  # $f2 = ft - 32.0
     div.d $f6, $f6, $f2  # $f3 = 5.0/9.0
     mul.d $f0, $f6, $f12  # $f4 = 5.0 / 9.0 * (ft – 32.0)
        
jr $ra