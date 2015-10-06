/*
 * File: loop.c
 * Author: Enrique Najera
 * Purpose: Sum of 1 to 10 using
 *          while, do-while, for loop
 * 07 October 2015
 */

// SYS_LIBS
#include <stdio.h>

// Function Prototypes
void whileLoop(int, int, int, int);
void doWhileLoop(int, int, int, int);
void forLoop(int, int, int, int);

// Start method main
int main()
{
    // Declare Variables
	int R0 =  0; // INIT for output
	int R1 =  1; // Index
	int R2 = 10; // Upper bound
	int R3 =  0; // Counter

	// Start loops
	whileLoop(R0, R1, R2, R3);
	doWhileLoop(R0, R1, R2, R3);
	forLoop(R0, R1, R2, R3);

    // SYS_EXIT
    return 0;
} // End method main

// Start method whileLoop
void whileLoop(int R0, int R1, int R2, int R3)
{
    while ( R3 < R2 )
	{
        R0 += R1;
		R1++;
		R3++;
	}

	printf("Summation 1 to 10 in while loop: %d\n", R0);
} // End method whileLoop

// Start method doWhile loop
void doWhileLoop(int R0, int R1, int R2, int R3)
{
    do
	{
        R0 += R1;
		R1++;
		R3++;
	}while ( R3 < R2 );

	printf("Summation 1 to 10 in do-while loop: %d\n", R0);
} // End method doWhileLoop

// Start method forLoop
void forLoop(int R0, int R1, int R2, int R3)
{
    for ( R3 = 0; R3 < R2; R3++ )
	{
        R0 += R1;
		R1++;
	}

	printf("Summation 1 to 10 in for loop: %d\n", R0);
} // End method forLoop

