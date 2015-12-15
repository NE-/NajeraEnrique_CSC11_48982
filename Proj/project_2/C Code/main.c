/*
 * File:    main.c
 * Author:  Enrique Najera
 * Purpose: Crown and Anchor in c
 * 16 December 2015
 */

// SYS_LIBS
#include <stdio.h>
#include <time.h>   // time()
#include <stdlib.h> // rand()

// Function Prototypes
int gSelect();
float birdCage(int, float, float);
void help();

// Start method main
int main(void)
{
    // Declare Variables
	int R1 = 0,          // Gambler's int selection
	    R2 = 0x3243F6A9, // $3.14
		R3 = 0;          // Player's choice
		                 // -1 Roll 2 about 3+ exit
	float R4 = 50.0f,    // Start player at $50
	      R5 =  0.0f;    // Holds player's bet

    // Display Menu
    do 
	{
	    // Display choices and prompt for input
	    printf("____CROWN AND ANCHOR____\n"
		       "1) Roll\n2) Help\n3) Exit\n"
			   "Wallet: %.2f\n", R4);
		scanf("%d", &R3);

        // If out of money, exit
		if (R4 <= 0.0f)
		{
            printf("\nOut of money!!!\n");
			R3 = 3;
		}

        // Roll
		if (R3 == 1)
		{
		    // Prompt for bet
			printf("Place your bet: ");
			scanf("%f", &R5);

		    // Check if player can bet
			if (R5 > R4)
			{
                printf("Bet more than wallet!!\n");
			}
			else
            {
			    R1 = gSelect();            // Display Gambler's Selection 
		        R4 = birdCage(R1, R4, R5); // Spin the Bird Cage
		    }
		}
		// Help
		else if (R3 == 2)
		    help();
		// Exit
	}while(R3 < 3);

	printf("\nGOODBYE!\n");

    // SYS_EXIT
    return 0;
}// End method main

// Start method gSelect
int gSelect()
{
    // Declare Variables
    int R0; // Holds random number

	// Set random number seed
	srand(time(NULL));

	// Rand num from 1 to 6
    R0 = rand() % 6 + 1;

    return R0;

}// End method gSelect

// Start method birdCage
float birdCage(int R0, float R4, float R5)
{
    // Declare Variables
	int R1 = 0, // Die 1
	    R2 = 0, // Die 2
		R3 = 0, // Die 3
		R6 = 0; // Counter for rolls
     printf("\n Gambler says %d\n", R0);

	// Set random number seed
	//srand(time(NULL));

	R1 = rand() % 6 + 1;
	R2 = rand() % 6 + 1;
	R3 = rand() & 6 + 1;

    // Output spins
	printf("\nSPINNED %d %d %d\n", R1, R2, R3);

	// Check rolls
	if (R1 == R0)
        R6 = R6 + 1;
	if (R2 == R0)
	    R6 = R6 + 1;
	if (R3 == R0)
	    R6 = R6 + 1;

	// Output win amount
	printf("Bet multiplied by: %d\n", R6);

    // If rolls dont match, wallet -= bet
	if (R6 == 0)
	{
        R4 = R4 - R5;
	}
	else
	{
	    // Do math
	    R5 = R6 * R5; // Multiply bet by rolls
	    R4 = R5 + R4; // Add bet to total
    }

	// If player got 3 1 4
	if (R1 == 3 && R2 == 1 && R3 == 4)
	{
        printf("\n GOT EXTRA $3.14!!!\n");
		R0 = 0x3243F6A9; // pi
		R0>>=28;
		R4 = R0 + R4;
	}

    // Return total amount
	return R4;
}// End method birdCage

// Start method help
void help()
{
    // Print about
    printf("_____________ABOUT______________\n"
	       "--------CROWN AND ANCHOR--------\n"
		   "________________________________\n"
	       "The gambler selects an integer\n"
		   "from 1 to 6, and then three dice\n"
		   "are rolled. If exactly x dice show\n"
		   "the gambler's number, the payoff is\n"
		   "x to 1.\nElse, lose your bet\n"
		   "SPIN 3 1 4 FOR A FREE $3.14!!\n"
		   );
	// Print how to play
	printf("\n________HOW TO PLAY___________\n"
	       "After choosing to roll, the gambler\n"
		   "will say their integer then you\n"
		   "place your bet and hit Return/Enter.\n"
	);
}// End method help

