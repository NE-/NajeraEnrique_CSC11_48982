/*
 * File: mod.c
 * Author: Enrique Najera
 * Purpose: Find quotient of two ints
 *          using subtraction and
 *          loops only
 * 28 September 2015
 */

// SYS_LIBS
#include <stdio.h>

// Start method main
int main()
{
    // Declare Variables
    int numerator   = 16;
	int denominator =  3;
    
	// Subtract and count until numerator is less than 1
	for (int i = 0; numerator > 1 ; i++)
	{
		numerator -= denominator;
	}

	printf( "16 %% 3 = %d\n", numerator );

	return 0;
} // End method main
