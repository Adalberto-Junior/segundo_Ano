#include <detpic32.h>    
#define K 20000

void delay(unsigned int ms)
{
	resetCoreTimer();
	while(readCoreTimer()< K * ms);
}

void send2displays(unsigned char value)
{
	static const char display7Scode[] = {
	0x3F, //0
	0x06, //1
	0x5B, //2
	0x4F, //3
	0x66, //4
	0x6D, //5
	0x7D, //6
	0x07, //7
	0x7F, //8
	0x6F, //9
	0x77, //A
	0x7C, //b
	0x39, //C
	0x5E, //d
	0x79, //E
	0x71  //F	
	};
	static char displayFlag = 0;

	if(displayFlag)
	{
		LATDbits.LATD6 = 1;
		LATDbits.LATD5 = 0;
		LATB = (LATB & 0x80FF) | ((display7Scode[value >> 4]) << 8);
		
		displayFlag	= 0;
	}else{
		LATDbits.LATD6 = 0;
		LATDbits.LATD5 = 1;
		LATB = (LATB & 0x80FF) | ((display7Scode[value & 0x0F]) << 8);
	
		displayFlag	= 1;
	}
}

int main(void)
{
	TRISB = (TRISB & 0x80FF);
	TRISD = (TRISD & 0XFF9F);
	// declare variables
	// initialize ports
	int counter = 0;
	while(1)
	{
		int i = 0;
		do
		{
			send2displays(counter);
			delay(20); //50Hz
		} while(++i < 16);
		delay(200);  //5Hz
		counter++;
		// increment counter (mod 256)
	}
	return 0;
} 
