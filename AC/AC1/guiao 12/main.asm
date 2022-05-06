.data
           .align 2
st_array: .space 176  # 4*44 student_media 
str:      .asciiz "\nMedia: "
str1:     .asciiz "\n"
str2: .asciiz " N.Mex:"
          .align 2
media:    .space 4  # float media
          .eqv Max_student, 2
.text
.globl main
main:
#pmax : $t0
#
	addiu $sp, $sp, -4   # reservar espaço na stack
	sw $ra, 0($sp)      # salvaguardar o valor de $ra
        
        la $a0, st_array
        li $a1, Max_student    
        jal read_data
        
        la $a0, st_array
        li $a1, Max_student
        la $a2, media    
        jal max 
        
        move $t0, $v0   # pmax = return(pmax)
        la $a0, str     # print_string(\nMedia)
        li $v0, 4       #
        syscall         # 
        la $a2, media
        l.s $f12, 0($a2)
        li $v0, 2
        syscall
        
        la $a0, str1   # print_string("\n")
        li $v0, 4
        syscall
        
        la $a0, str2   # print_string("N_Mec")
        li $v0, 4
        syscall
        
        move $a0, $t0     # $a0 = pmax
        #la $a0, st_array
        jal print_student  #
 
  
        li $v0, 0       # return 0
        
        lw $ra, 0($sp)  # repor o valor do $ra
        addiu $sp, $sp, 4 # libertar o espaço na stack;
fim: jr $ra  	
	
    

