   .equ     SFR_BASE_HI,0xBF88
   .equ     TRISB,0x6040
   .equ     TRISE,0x6100
   .equ     PORTB,0x6050
   .equ     LATE,0x6120
   .equ     readCoreTimer,11
   .equ     resetCoreTimer,12
   .equ     printInt,6

   .data
   .text
   .globl   main

main: addiu $sp,$sp,-4           #
      sw    $ra,0($sp)           #

      lui   $t0,SFR_BASE_HI      #

      lw    $t1,TRISB($t0)       #
      ori   $t1,$t1,0x000F       #
      sw    $t1,TRISB($t0)       # Definir RB0-RB3 como inputs

      lw    $t1,LATE($t0)        #
      ori   $t1,$t1,0x0080       #
      sw    $t1,LATE($t0)        # Colocar RE7 a 1
      lw    $t1,TRISE($t0)       #
      andi  $t1,$t1,0xFF7F       #
      sw    $t1,TRISE($t0)       # Definir RE7 como output

      lw    $t1,PORTB($t0)       #
      andi  $a0,$t1,0x000F       #
      li    $a1,16               #
      li    $v0,printInt         #
      syscall                    # printInt(val,16);

      li    $a0,'\n'             #
      li    $v0,3                #
      syscall                    # putChar('\n');

while:lw    $t2,PORTB($t0)       #
      beq   $t2,$t1,endif        # if the value is new
      move  $t1,$t2              #
      andi  $a0,$t1,0x000F       #
      li    $a1,16               #
      li    $v0,printInt         #
      syscall                    # printInt(val,16);

      li    $a0,'\n'             #
      li    $v0,3                #
      syscall                    # putChar('\n');
      
      lw    $t2,LATE($t0)        #
      xori  $t2,$t2,0x0080       #
      sw    $t2,LATE($t0)        # invert RE7

endif:li    $a0,125              #
      jal   delay                #
      j     while                #

      lw    $ra,0($sp)           #
      addiu $sp,$sp,4            #
      jr    $ra                  #


delay:ble   $a0,0,end            # for(; ms > 0;) {
      li    $v0,resetCoreTimer   #
      syscall                    #    resetCoreTimer();
cicle:li    $v0,readCoreTimer    #
      syscall                    #
      blt   $v0,40000,cicle      #    while(readCoreTimer() < 40000);
      addi  $a0,$a0,-1           #    ms--;
      j     delay                # }
end:  jr    $ra                  #
