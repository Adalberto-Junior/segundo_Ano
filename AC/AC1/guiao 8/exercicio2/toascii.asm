.data
.text
.globl toascii

toascii: 
       lb $a0, 0($a0)
       addi $a0, $a0, 0x30      # v += '0';
if:    ble $a0, 0x39, endif     # if(v > '9')
       addi $a0, $a0, 0x37      # v += 7 , 'A' - 9 - 1
endif: or $v0, $0, $a0          # return v;
       jr $ra
