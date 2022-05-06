.data
k: .float 0.0
.text
.globl main
main:

#*array: $f12
#nval: $a0
#i: $t0
# media: $f2
#soma: $f4

var: 
     
     jal average  # não esquecer de3 fazer o average da aula passada
     
     mov.s $f2, $f0   # (float)average(array, nval);
     li $t0, 0    # i = 0;
     l.s $f4, k  # soma = 0.0 
 
for: bge $t0, $a0    #while( i < nval)
     