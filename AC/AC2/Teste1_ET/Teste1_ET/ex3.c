#include<detpic32.h>

void send2displays(char);
void delay(int);

static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

int main(void)
{
   LATB = LATB & 0x80FF;
   TRISB = TRISB & 0x80FF;

   LATD = 0xFF9F;
   TRISD = TRISD & 0xFF9F;

   TRISBbits.TRISB4 = 1;
   AD1PCFGbits.PCFG4 = 0;
   AD1CON1bits.SSRC = 7;
   AD1CON1bits.CLRASAM = 1;
   AD1CON3bits.SAMC = 16;
   AD1CON2bits.SMPI = 2-1;
   AD1CHSbits.CH0SA = 4;
   AD1CON1bits.ON = 1;

   double LSB = 3.3 / (1024 - 1);
   int val = 1.2 / LSB;   

   while(1)
   {
      AD1CON1bits.ASAM = 1;
      while( IFS1bits.AD1IF == 0 );
      IFS1bits.AD1IF = 0;

      printInt(ADC1BUF0, (3 << 16) | 16);
      putChar('\n');
      
      if(ADC1BUF0 < val)
      {
         send2displays(0x0A);
      }
      else
      {
         send2displays(0xB0);
      }

      delay(100);
   }
}

void send2displays(char value)
{
   static char displayFlag = 0;
   unsigned char digit_low = value & 0x0F;
   unsigned char digit_high = (value >> 4) & 0x0F;

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
   for(; ms > 0; ms--)
   {
      resetCoreTimer();
      while(readCoreTimer() < (PBCLK/1000));
   }
}
