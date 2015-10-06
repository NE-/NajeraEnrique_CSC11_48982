/*
 * File: branching.c
 * Author: Enrique Najera
 * Purpose: Branch using if, if else, and switch
 * 07 October 2015
 */

// Function Prototypes
void ifBranch(int, int);
void ifElseBranch(int, int);
void switchBranch(int, int);

// SYS_LIBS
#include <stdio.h>

// Start method main
int main()
{
	// Declare Variables
	int R0 = 0; // INIT for output
	int R1 = 0; // Takes input

	// Promptand get day of the week
	printf("Enter 1 - 5 for day of the week ");
	scanf("%d", &R1);

	// Start branching
	ifBranch(R0, R1);
	ifElseBranch(R0, R1);
	switchBranch(R0, R1);

	// SYS_EXIT
	return 0;
} // End method main

// Start method ifBranch
void ifBranch(int R0, int R1)
{
	if ( R1 == 1 || R1 == 3 )
	{
		R0 = 11;
		printf("if %d\n", R0);
	}
	if ( R1 == 2 || R1 == 4 )
	{
		R0 = 5;
		printf("if %d\n", R0);
	}
	if ( R1 == 5 )
	{
		R0 = 1;
		printf("if %d\n", R0);
	}
	if ( R1 >= 6 || R1 <= 0 )
	{
		R0 = 0;
		printf("if %d\n", R0);
	}
} // End method ifBranch

// Start method ifElseBranch
void ifElseBranch(int R0, int R1)
{
	if ( R1 == 1 || R1 == 3 )
	{
		R0 = 11;
		printf("if else %d\n", R0);
	}
	else if ( R1 == 2 || R1 == 4 )
	{
		R0 = 5;
		printf("if else %d\n", R0);
	}
	else if ( R1 == 5 )
	{
		R0 = 1;
		printf("if else %d\n", R0);
	}
	else
	{
		R0 = 0;
		printf("if else %d\n",R0);
	}
} // End method ifElseBranch

// Start method switchBranch
void switchBranch(int R0, int R1)
{
	switch (R1)
	{
		case 1:
		case 3:
			R0 = 11;
			printf("switch %d\n",R0);
			break;
		case 2:
		case 4:
			R0 = 5;
			printf("switch %d\n", R0);
			break;
		case 5:
			R0 = 1;
			printf("switch %d\n", R0);
			break;
		default:
			R0 = 0;
			printf("switch %d\n", R0);
			break;
	}
} // End method switchBranch

