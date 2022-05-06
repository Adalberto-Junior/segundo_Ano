.data
str: .asciiz "Digite ate 20 inteiros (zeros para terminar)"
str1: .asciiz "Maximo/minimo sao: "
.text
.globl main
main:
#Mapas dos registos
# val: $t0
# n: $t1
# min: $t2
# max: $t3

  li $t1, 0  # n = 0;
  li $t2, 0x7FFFFFFF  # min = 
  li $t3, 0x80000000  # max=

do: 
    la $a0, str  # print_string(str)
    li $v0, 4   #
    syscall  #
    
    li $v0, 5  # read_int
    syscall
    or $t0, $0, $v0  # val = read_int
if: beq $t0, 0, endif  # if(val != 0){
if1: ble $t0, $t3, else  # if(val > max)
    or $t3, $0, $t0  # max = val;
      j endif   #}
else:
if2:  bge $t0, $t2, endif  # if(val < min)
      or $t2, $0, $t0  # min = val;
endif: 
     addi $t1, $t1, 1 # n++;
     blt $t1, 20, dor   # whilhe( (n < 20) &&
        j enddo         #
dor: bne $t0, 0, do     # (val != 0))

enddo: la $a0, str1   # print_string(str1)
       li $v0, 4    #
       syscall   #
       
       or $a0, $0, $t3    # print_int10(max)
       li $v0, 1   #
       syscall  #
       
       li $a0, ':'  # print_char(':')
       li $v0, 11  #
       syscall  #
       
       or $a0, $0, $t2    # print_int10(min)
       li $v0, 1  #
       syscall
jr $ra