#include <detpic32.h>    
#define K 20000

void delay(unsigned int ms)
{
	resetCoreTimer();
	while(readCoreTimer()< K * ms);
}

int main(void)
{
	unsigned char segment;
	LATDbits.LATD5 = 1;// enable display low (RD5) and disable display high (RD6)
	LATDbits.LATD6 = 0;
	TRISB = (TRISB & 0x80FF);// configure RB8-RB14 as outputs
	TRISD = (TRISD & 0xFF9F);// configure RD5-RD6 as outputs
	
	int i;
	
	while(1)
	{
		segment = 1;
		for(i=0; i < 7; i++)
		{
			LATB = (LATB & 0x80FF) | (segment << 8);// send "segment" value to display
			delay(500);
			segment = segment << 1; //seg*2
		}
		//a cada ciclo troca o display
		LATDbits.LATD5 = !LATDbits.LATD5;
		LATDbits.LATD6 = !LATDbits.LATD6;
		
	}
	return 0;
 } 

