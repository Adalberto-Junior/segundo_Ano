#include<detpic32.h>

void send2displays(char);
void delay(int);

static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

int main(void)
{
   LATE = LATE & 0xFF80;
   TRISE = TRISE & 0xFF80;

   TRISB = TRISB | 0x0003;

   LATD = LATD & 0xFF9F;
   TRISD = TRISD & 0xFF9F;

   LATB = LATB & 0x80FF;
   TRISB = TRISB & 0x80FF;

   unsigned int counter = 0, timer = 0;
   char in, key = 0x00;
   while(1)
   {
      LATE = (LATE & 0xFF80) | counter;

      switch(PORTB & 0x0003)
      {
         case 0:
            LATDbits.LATD5 = 0;
            LATDbits.LATD6 = 0;
            break;

         case 1:
            in = inkey();
            if(in >= 0x30 && in <= 0x39) { key = in; }
            send2displays(key << 4);
            break;

         case 2:
            in = inkey();
            if(in >= 0x30 && in <= 0x39) { key = in; }
            send2displays(key & 0x0F);
            break;

         case 3:
            send2displays(counter);
            break;
      }
      delay(10);
      timer++;
      if(timer >= 20) {
         timer = 0;
         counter = counter >= 60 ? 0 : counter+1;
      }
   }
}

void send2displays(char value)
{
   static char displayFlag = 0;
   unsigned char digit_low = value & 0x0F;
   unsigned char digit_high = (value & 0xF0) >> 4;

   if(!displayFlag)
   {
      LATDbits.LATD5 = 1;
      LATDbits.LATD6 = 0;
      LATB = (LATB & 0x80FF) | (display7Scodes[digit_low] << 8);
   }
   else
   {
      LATDbits.LATD5 = 0;
      LATDbits.LATD6 = 1;
      LATB = (LATB & 0x80FF) | (display7Scodes[digit_high] << 8);   
   }

   displayFlag = !displayFlag;
}


void delay(int ms)
{
   for(;ms > 0;ms--)
   {
      resetCoreTimer();
      while(readCoreTimer() < (PBCLK/1000));
   }
}
