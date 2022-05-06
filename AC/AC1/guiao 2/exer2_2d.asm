

.data
.text
.globl main
main:
	ori $t1, $0, 5	# inicia o registo com o valor 4
	move $t0, $t1	# mover o contuodo do registo $t1 para $t2
	srl $t1, $t0,4	# fazendo o deslocamento logico a direita, de 4 bit 
	xor $t3, $t0, $t1	#fazendo xor entre o conteuodo do $t1 com $t0 e registar no $t3;
	srl $t1, $t3, 2		# fazendo o deslocamento logico a direita, de 2 bit e registar no registo $t1
	xor $t0, $t3, $t1	#fazendo xor entre o conteuodo do $t1 com $t3 e registar no $t0;
	srl $t3, $t0, 1		# fazendo o deslocamento logico a direita, de 1 bit e registar no registo $t3
	xor $t2, $t0, $t3	#fazendo xor entre o conteuodo do $t3 com $t0 e registar no $t2;
	
jr $ra		# fim do programa