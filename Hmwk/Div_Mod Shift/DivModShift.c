/*
 * File: DivModShift.c
 * Author: Enrique Najera
 * Purpose: 1) Shift left until denominator is just less than the numerator
 *          2) Subtract denominator from shifted numerator, increment the shifted division
 *			3)  Shift the denominator right until just less than what is left from the numerator after subtraction
 *			4) Repeat 2) until the increment for the shifted division is no more than 1
 *			5) Output the results, either div or mod.
 * 30 September 2015
 */

// SYS_LIBS
#include <stdio.h>

// typedef boolean for C
typedef int bool;
#define true 1
#define false 0

// Function Prototypes
int shift(int, int, int, int, int, int, bool); // Takes 6 REG to LSR or LSL and counter

// Start method main
int main()
{
	// Declare Variables
	int R0 =  0; // Holds output
	int R1 = 45; // Numerator
	int R2 =  6; // Denominator
	int R3 =  1; // Scale
	int R4 =  6; // Temp_Original
	int R5 =  0; // Temp_scale

	// Let user know which 
	//2 numbers are being used
	printf("%d / %d\n", R1, R2);
	
	// Start maths and assign result to R0
	R0 = shift(R0, R1, R2, R3, R4, R5, true);
	
	// Output modulus
	printf("Mod: %d\n", R0);

	// SYS_EXIT
	return 0;
} // End method main

// Start method shift
int shift(int R0, int R1, int R2, int R3, int R4, int R5, bool maxQ)
{
	// While numerator > denominator
	while ( R1 > R4 )
	{
		// Shift while denominator < numerator
		while ( R4 < R1 )
		{
			R4 = R2 << R3;
			R3++;
		}
		
		if ( maxQ == true )
		{
			// Calculate modulus
			R5 = quotient(R3);

			// Only do while R3 is at max
			maxQ = false;
		}

		// Since R4 < R1 shift back
		R4 = R4 >> 1;

		// Subtract
		R1 -= R4;

		// Redo if numerator > denominator
		R4 = R2; // Original for shifting
		R3 =  1; // Reset scale for counting
	}// End while numerator > denominator

	// When done, output quotient
	printf("Quotient: %d\n", R5);

	// Return modulus
	return R1;
} // End method shift

// Start method quotient
int quotient(int R5)
{
	// Declare Variables
	int temp_q = 0; // Temporary 'quotient'

	while ( R5 >= 1)
	{
		temp_q += R5;
		R5 /= 2;
	}

	// Return quotient
	return temp_q;
} // End method quotient

