#include <detpic32.h>    


int display7Scode[] = {
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

int main (void)
{
	TRISB = (TRISB & 0x80FF) | 0x000F;  //RB3 - RB0 são entradas (e RB14 - RB8 saídas)
	TRISD = (TRISD & 0xFF9F); //RD5 e 6 saídas
	
	LATDbits.LATD5 = 1; //Select display low
	LATDbits.LATD6 = 0;
	
	while(1)
	{
		int counter = (PORTB & 0x000F);
		char seg = display7Scode[counter];
		
		LATB = (LATB & 0x80FF) | (seg << 8);	
	}
	return 0;	
}
